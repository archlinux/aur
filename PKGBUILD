# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=racc
pkgname=ruby-$_gemname
pkgver=1.5.2
pkgrel=2
pkgdesc='LALR parser generator written in Ruby itself and generates ruby programs'
arch=(x86_64)
url='https://github.com/ruby/racc'
license=(BSD)
depends=(ruby)
makedepends=(rubygems ruby-rake ruby-rdoc ruby-bundler ruby-rake-compiler)
options=(!emptydirs)
source=(https://github.com/ruby/racc/archive/v${pkgver}.tar.gz)
sha256sums=('86e2dfae23e0d46930eed8e0f11bd115046aea79bed78d5d21b2f169cc495a5f')

build() {
  cd "$_gemname-$pkgver"
  rake compile
  rake build
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

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

  install -Dm0644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
