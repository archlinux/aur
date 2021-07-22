# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=racc
pkgname=ruby-$_gemname
pkgver=1.5.2
pkgrel=4
pkgdesc='LALR parser generator written in Ruby itself and generates ruby programs'
arch=(x86_64)
url=https://github.com/ruby/racc
license=(BSD)
depends=(ruby)
checkdepends=(ruby-test-unit)
makedepends=(rubygems ruby-rake ruby-rdoc ruby-bundler ruby-rake-compiler)
options=(!emptydirs)
source=(https://github.com/ruby/racc/archive/v${pkgver}.tar.gz)
sha256sums=('86e2dfae23e0d46930eed8e0f11bd115046aea79bed78d5d21b2f169cc495a5f')

build() {
  cd "$_gemname-$pkgver"
  rake compile
  rake build
}

check() {
  cd "$_gemname-$pkgver"
  rake test
}

package() {
  cd "$_gemname-$pkgver"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  # N.B. we don't install the bin to /usr/bin because it conflicts with
  #      "racc" provided by ruby
  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    pkg/$_gemname-$pkgver.gem

  rm -rf "$pkgdir/$_gemdir/cache"

  install -Dm0644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.rdoc "$pkgdir/usr/share/doc/$pkgname/README.rdoc"
  install -Dm0644 ChangeLog "$pkgdir/usr/share/doc/$pkgname/CHANGELOG"
}
