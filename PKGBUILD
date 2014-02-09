# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Paul Dino Jones "ZitZ" <Raptorman18@gmail.com>

pkgname=openjazz-svn
pkgver=r189
pkgrel=1
pkgdesc="A free, open-source version of the classic Jazz Jackrabbit™ games (development version)"
arch=('i686' 'x86_64')
url="http://alister.eu/jazz/oj/"
license=('GPL')
depends=('zlib' 'sdl' 'libmodplug')
install=openjazz.install
conflicts=('openjazz')
provides=('openjazz')
source=(openjazz::"svn+http://svn.code.sf.net/p/openjazz/code"
	      "openjazz-datafolders.diff")
sha256sums=('SKIP'
            'a8bbf3d0116cf4faa0a073d8b4e7f356a9833d7dd6d26da1e487c90252334667')

pkgver() {
  cd openjazz
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd openjazz

  # set global datapath and enable looking in home directory
  patch -Np1 < ../openjazz-datafolders.diff
}

build() {
  cd openjazz

  autoreconf -fi
  ./configure --prefix=/usr
  make
}

package() {
  cd openjazz

  make DESTDIR="$pkgdir/" install
  # licenses
  install -Dm644 licenses.txt "$pkgdir"/usr/share/licenses/openjazz/licenses.txt
}
