# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Tim Meusel <tim at bastelfreak dot de>

_gemname=fast_gettext
pkgname=ruby-${_gemname}
pkgver=2.0.3
pkgrel=1
pkgdesc='A simple, fast, memory-efficient and threadsafe implementation of GetText'
arch=(any)
url='https://github.com/grosser/fast_gettext'
license=(MIT RUBY)
makedepends=(ruby-rdoc ruby-rake ruby-rspec ruby-bundler)
depends=(ruby)
source=("https://github.com/grosser/fast_gettext/archive/v${pkgver}/${_gemname}-v${pkgver}.tar.gz")
options=(!emptydirs)
sha256sums=('7a58cd52a57911987b50747e890d4f810f4b271173431646274e1cfe5f605c0a')

# disable cloud metric reporting during tests
prepare() {
  cd "${_gemname}-${pkgver}"

  sed -i '/single_cov/d' spec/spec_helper.rb
  sed -i '/SingleCov.setup/d' spec/spec_helper.rb
  sed -i '/SingleCov/d' spec/fast_gettext/*.rb
  sed -i '/SingleCov/d' spec/fast_gettext/translation_repository/*.rb
}

build() {
  cd "${_gemname}-${pkgver}"
  gem build "${_gemname}.gemspec"
}

check() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  # tests currently disabled because active-record isn't available as package
  # rspec
}

package() {
  cd "${_gemname}-${pkgver}"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

  # no license file provided in the source
  install -Dm 644 Readme.md CHANGELOG -t "${pkgdir}/usr/share/doc/${pkgname}"
}
