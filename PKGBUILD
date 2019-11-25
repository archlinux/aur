# Maintainer: Michael Straube <michael.straube@posteo.de>
# Contributor: Robert Knauer <robert@privatdemail.net>

pkgname=freedoko-git
pkgver=0.7.21.r1.ge1530b594
pkgrel=1
pkgdesc="Free implementation of the card game Doppelkopf (development version)"
arch=('x86_64')
url="http://free-doko.sourceforge.net"
license=('GPL')
depends=('gtkmm3' 'freealut')
makedepends=('git' 'asciidoc' 'texlive-latexextra' 'w3m' 'dos2unix' 'rsync')
conflicts=('freedoko')
provides=('freedoko')
source=("git+https://gitlab.com/dknof/FreeDoko.git"
        "freedoko-install-directories.patch")
sha512sums=('SKIP'
            '602f53bfd4c4c49824400a36e4655dc6f6d5692b7277489f8e5f9f9d9d4d90eb086a4d142736e76edc2c8864430d8cbf5fa403bb25497b2c6a510a1979fe7650')

pkgver() {
  cd FreeDoko
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd FreeDoko
  patch -p1 -i ../freedoko-install-directories.patch
  sed -i '/$(MAKE) strip/d' src/Makefile
}

build() {
  cd FreeDoko

  export CXXFLAGS+=' -std=c++17'

  make compile
  make documentation
}

package() {
  cd FreeDoko
  make DESTDIR="$pkgdir" install
}
