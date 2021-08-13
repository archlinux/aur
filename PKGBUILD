# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=ruby_engine
pkgname=ruby-${_gemname}
pkgver=2.0.0
pkgrel=1
pkgdesc="Adds the RubyEngine pseudo-constant"
arch=(any)
url=https://github.com/janlelis/ruby_engine
license=(MIT)
depends=(ruby)
checkdepends=(ruby-rspec)
makedepends=(rubygems ruby-rdoc)
options=(!emptydirs)
source=(https://github.com/janlelis/ruby_engine/archive/v$pkgver/$_gemname-$pkgver.tar.gz)
sha256sums=('0c831878b609e1fd29681bc3a354e4e64715a16e7be029f762886dfc46cf1019')

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

  install -Dm0644 MIT-LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.rdoc "$pkgdir/usr/share/doc/$pkgname/README.rdoc"
  install -Dm0644 ChangeLog.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim: set ts=2 sw=2 et:
