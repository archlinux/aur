# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Michael Straube <michael.straube@posteo.de>
# Contributor: Robert Knauer <robert@privatdemail.net>

pkgname=freedoko-git
pkgver=0.7.21.r124.g63789f2bc
pkgrel=1
pkgdesc="Free implementation of the card game Doppelkopf (development version)"
arch=('x86_64')
url="http://free-doko.sourceforge.net"
license=('GPL3')
depends=('gtkmm3' 'freealut')
makedepends=('git' 'asciidoc' 'texlive-latexextra' 'w3m' 'dos2unix' 'rsync')
conflicts=('freedoko')
provides=('freedoko')
source=("git+https://gitlab.com/dknof/FreeDoko.git"
        "freedoko-install-directories.patch")
sha256sums=('SKIP'
            '3bd03f2d57327b97ea1ab22ff210381f0ff60d8b1db794f07cda5ef01d7e7df4')

pkgver() {
  cd FreeDoko
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

prepare() {
  cd FreeDoko
  patch -Np1 <../freedoko-install-directories.patch

  # disable manual binary stripping
  sed -i '/$(MAKE) strip/d' src/Makefile
}

build() {
  cd FreeDoko

  export CXXFLAGS+=' -std=c++17'

  make compile
  make documentation
}

package() {
  make -C FreeDoko DESTDIR="$pkgdir" install
}
