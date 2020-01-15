# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Tim Meusel <tim at bastelfreak dot de>
# Contributor: Artem Vorotnikov <artem at vorotnikov dot me>

_gemname=minitar
pkgname=ruby-$_gemname
pkgver=0.9
pkgrel=1
pkgdesc='Provides POSIX tarchive management from Ruby programs.'
arch=(any)
url=https://github.com/halostatue/minitar
license=(RUBY BSD)
depends=(ruby)
makedepends=(rubygems ruby-rdoc ruby-rake ruby-hoe ruby-minitest)
options=(!emptydirs)
source=("https://github.com/halostatue/minitar/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('0e489b36aa023565d597b35849797725441d1cfabfe521f136ec4508e03f058c')

# update the gemspec to allow newer versions of rake
# remove references to cloud CI pipelines
prepare() {
  cd "${_gemname}-${pkgver}"
  sed -i 's|~>|>=|g' "${_gemname}.gemspec"
  sed -i "/Rake::Task\['travis'\].*/d" Rakefile
}

check() {
  cd "${_gemname}-${pkgver}"
  rake test
}

build() {
  cd "${_gemname}-${pkgver}"
  # gem build "${_gemname}.gemspec"
  rake gem
}

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  cd "${_gemname}-${pkgver}"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    pkg/$_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

  install -Dm0644 Licence.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
