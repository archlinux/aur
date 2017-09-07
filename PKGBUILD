# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Robert Knauer <robert@privatdemail.net>

# For building in a clean chroot you first must install texlive-core to the chroot. (FS#52038)
# e.g.: extra-x86_64-build -- -I /var/cache/pacman/pkg/texlive-core-2017.44918-1-any.pkg.tar.xz

pkgname=freedoko-git
pkgver=0.7.16.r309.ga2bb6e50
pkgrel=1
pkgdesc="Free implementation of the card game Doppelkopf (git version)"
arch=('i686' 'x86_64')
url="http://free-doko.sourceforge.net/en/FreeDoko.html"
license=('GPL')
#depends=('gtkmm3' 'gnet' 'freealut')
depends=('gtkmm3' 'freealut') # network currently disabled upstream
makedepends=('git' 'asciidoc' 'texlive-latexextra' 'w3m' 'dos2unix' 'rsync')
conflicts=('freedoko')
provides=('freedoko')
source=("git+https://gitlab.com/dknof/FreeDoko.git"
        "freedoko-git-archlinux.patch")
sha256sums=('SKIP'
            '32daa2d355b71b990df59dd2f975aea15bb0a1445f5f4d3874bf21824c71b59d')

pkgver() {
  cd FreeDoko
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd FreeDoko
  patch -p1 -i ../freedoko-git-archlinux.patch
}

build() {
  cd FreeDoko
  make compile
  make documentation
}

package() {
  cd FreeDoko
  make DESTDIR="$pkgdir" install
  rm "$pkgdir"/usr/share/doc/freedoko/{de/Windows.txt,en/Windows,hpux*}
}
