# Maintainer: Boohbah <boohbah at gmail dot com>
# Contributor: P. Badredin <p dot badredin at gmail dot com>
# Contributor: Justin Blanchard <UncombedCoconut at gmail dot com>

pkgname=stockfish-git
pkgver=r3393.gfe07ae4
pkgrel=1
pkgdesc="A free UCI chess engine derived from Glaurung 2.1 (git version)"
arch=('i686' 'x86_64')
url="http://stockfishchess.org/"
license=('GPL3')
optdepends=('polyglot: for xboard support')
makedepends=('git')
provides=('stockfish')
conflicts=('stockfish')
install=stockfish.install
source=("$pkgname::git+https://github.com/official-stockfish/Stockfish.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname/src"
  if [[ "$CARCH" == "i686" ]]; then
    _arch=x86-32
  elif grep -q popcnt /proc/cpuinfo; then
    _arch=x86-64-modern
  else     
    _arch=x86-64
  fi
  make profile-build ARCH=$_arch
}

package() {
  cd "$pkgname/src"
  make PREFIX="$pkgdir/usr" install
}

# vim:set sts=2 sw=2 et:
