# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=ruby_version
pkgname=ruby-${_gemname}
pkgver=1.0.3
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
sha256sums=('6ca78ef835ee1cd8259bf8cd65687b04d0c76724145888a6465ba29de141410f')

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
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 ChangeLog.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim: set ts=2 sw=2 et:
