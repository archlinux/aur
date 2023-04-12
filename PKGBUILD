# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=rhcl
pkgname=ruby-$_gemname
pkgver=0.1.0
pkgrel=1
pkgdesc="Pure Ruby HCL parser"
arch=(any)
url=https://github.com/winebarrel/rhcl
license=(MIT)
options=(!emptydirs)
depends=(ruby ruby-deep_merge)
checkdepends=(ruby-bundler ruby-rake ruby-rspec ruby-racc)
makedepends=(rubygems ruby-rdoc)
source=(${url}/archive/${pkgver}.tar.gz)
sha256sums=('0fa1132bde5b760172ff2e4fcceea98a104fa6011ab395373427dd1da400d449')

prepare() {
  cd $_gemname-$pkgver
  sed -i 's|git ls-files -z|find -print0|' ${_gemname}.gemspec
}

build() {
  cd $_gemname-$pkgver
  gem build ${_gemname}.gemspec
}

check() {
  cd $_gemname-$pkgver
  rake
}

package() {
  cd $_gemname-$pkgver
  local _gemdir="$(gem env gemdir)"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm -rf "$pkgdir/$_gemdir/cache"

  install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:
