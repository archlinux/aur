# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Robert Knauer <robert@privatdemail.net>

pkgname=freedoko-git
pkgver=0.7.16.r302.g55e43523
pkgrel=1
pkgdesc="Free implementation of the card game Doppelkopf (git version)"
arch=('i686' 'x86_64')
url="http://free-doko.sourceforge.net/en/FreeDoko.html"
license=('GPL')
#depends=('gtkmm3' 'gnet' 'freealut')
depends=('gtkmm3' 'freealut') # network currently disabled upstream
makedepends=('git' 'asciidoc' 'texlive-latexextra' 'w3m' 'dos2unix')
conflicts=('freedoko')
provides=('freedoko')
source=("git+https://gitlab.com/dknof/FreeDoko.git"
        "freedoko-git-archlinux.patch")
sha256sums=('SKIP'
            '2382a910c08388fb148951cae46c0f57fc4df14e529b2536083d739f47d4f2f6')

pkgver() {
  cd FreeDoko
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd FreeDoko

  patch -p1 -i ../freedoko-git-archlinux.patch
  find manual -type f -exec chmod 644 {} \;
}

build() {
  cd FreeDoko

  make compile
  make documentation
}

package() {
  cd FreeDoko

  make DESTDIR="$pkgdir" install
  install -Dm644 bin/FreeDoko.desktop "$pkgdir"/usr/share/applications/freedoko.desktop
  rm "$pkgdir"/usr/share/doc/freedoko/manual/{de/Makefile,en/Makefile}
  rm "$pkgdir"/usr/share/doc/freedoko/manual/de/operation/pictures/Regeln/create_screenshots.sh
  rm "$pkgdir"/usr/share/doc/freedoko/{de/Windows.txt,en/Windows,hpux*}
}
