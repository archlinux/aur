# Maintainer: Nichlas Severinsen <ns@nsz.no>

pkgname=shufflecake
_gitname=$pkgname-userland
pkgver=v0.1
pkgrel=1
pkgdesc="Shufflecake - Plausible deniability layer for Linux (Userland tool)"
arch=("any")
url="https://shufflecake.net/"
license=("GPLv3")
depends=("dm-sflc-git-dkms")
makedepends=("make")
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://codeberg.org/shufflecake/$_gitname/archive/$pkgver.tar.gz")

sha256sums=("471bdab0da3fc67d78b46373fc1a33d01b92cb5927d12818149a75b9992e3ebf")

build() {
  cd "${srcdir}/$_gitname"
  # TODO: patch install in Makefile so that it uses install instead of cp
  # This will break in the future, just remove the line then
  make
}

package() {

  cd "$srcdir/$_gitname"

  mkdir -p "$pkgdir/usr/bin"

  sed -e "s/cp/install -m 755/" \
      -e "s|/usr/bin|\$\(DESTDIR\)/usr/bin|" \
      -i "Makefile"
  
  make install DESTDIR="$pkgdir"

}
