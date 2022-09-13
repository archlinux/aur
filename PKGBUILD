# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=http-accept
pkgname=ruby-${_gemname}
pkgver=2.2.0
pkgrel=1
pkgdesc="Parse Accept and Accept-Language HTTP headers in Ruby"
arch=(any)
url=https://github.com/socketry/http-accept
license=(MIT)
depends=(ruby)
checkdepends=(ruby-bundler ruby-rspec)
makedepends=(rubygems ruby-rdoc)
source=(https://github.com/socketry/http-accept/archive/v$pkgver/$_gemname-$pkgver.tar.gz)
sha256sums=('9a614046d55f8c122a38116332650e6ccddd7bf7e0c0e039dd8653ef63122f49')

prepare() {
  cd ${_gemname}-$pkgver
  sed -i 's|~>|>=|g' ${_gemname}.gemspec

  sed -i '/covered/d' ${_gemname}.gemspec
  sed -i '/covered/d' spec/spec_helper.rb
  sed -i '/cert_chain/d' ${_gemname}.gemspec
  sed -i '/signing_key/d' ${_gemname}.gemspec

  # there is no license file in the repo, but we can extract one from the readme
  # https://stackoverflow.com/a/35966027
  sed '/## License/,$!d' README.md > LICENSE
}

build() {
  cd ${_gemname}-$pkgver
  gem build ${_gemname}.gemspec
}

check() {
  cd ${_gemname}-$pkgver
  rspec
}

package() {
  cd ${_gemname}-$pkgver
  local _gemdir="$(gem env gemdir)"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm -rf "$pkgdir/$_gemdir/cache"

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:
