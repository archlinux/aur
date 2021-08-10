# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: farwayer <farwayer@gmail.com>

_gemname=uber
pkgname=ruby-$_gemname
pkgver=0.1.0
pkgrel=4
pkgdesc="Gem-authoring extensions for classes and modules"
arch=(any)
url=https://github.com/apotonick/uber
license=(MIT)
depends=(ruby)
checkdepends=(ruby-bundler ruby-rake ruby-minitest ruby-benchmark-ips)
makedepends=(rubygems ruby-rdoc)
options=(!emptydirs)
source=(https://github.com/apotonick/uber/archive/v$pkgver/$_gemname-$pkgver.tar.gz)
sha256sums=('c34fe94ef41a8b1248c53ff36f19c587f5a9ca606337294f30760036fbe301f3')

prepare() {
  cd $_gemname-$pkgver
  sed -i 's|git ls-files|find|' ${_gemname}.gemspec
}

build() {
  cd $_gemname-$pkgver
  gem build ${_gemname}.gemspec
}

check() {
  cd $_gemname-$pkgver
  rake test
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

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 CHANGES.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim: set ts=2 sw=2 et:
