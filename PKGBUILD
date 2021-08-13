# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=ruby_version
pkgname=ruby-${_gemname}
pkgver=1.0.2
pkgrel=1
pkgdesc="Adds the RubyVersion pseudo-constant"
arch=(any)
url=https://github.com/janlelis/ruby_version
license=(MIT)
depends=(ruby)
checkdepends=(ruby-rspec)
makedepends=(rubygems ruby-rdoc)
options=(!emptydirs)
source=(https://github.com/janlelis/ruby_version/archive/v$pkgver/$_gemname-$pkgver.tar.gz)
sha256sums=('cabe4c44f73bfad606d0ff4b61ed42270f4b38c03d37da5a9bf30b53e3b7126a')

prepare() {
  cd $_gemname-$pkgver
  sed -i 's|~>|>=|g' ${_gemname}.gemspec
}

build() {
  cd $_gemname-$pkgver
  gem build ${_gemname}.gemspec
}

check() {
  cd $_gemname-$pkgver
  rspec
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
  install -Dm0644 README.rdoc "$pkgdir/usr/share/doc/$pkgname/README.rdoc"
  install -Dm0644 ChangeLog.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim: set ts=2 sw=2 et:
