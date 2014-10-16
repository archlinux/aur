# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Paul Dino Jones "ZitZ" <Raptorman18@gmail.com>

pkgname=openjazz
pkgver=20140216
_pkgver=160214
pkgrel=1
pkgdesc="A free, open-source version of the classic Jazz Jackrabbit™ games"
arch=('i686' 'x86_64')
url="http://alister.eu/jazz/oj/"
license=('GPL')
depends=('zlib' 'sdl' 'libmodplug')
install=openjazz.install
source=("http://alister.eu/jazz/oj/OpenJazz-src-$_pkgver.zip"
	      "openjazz-datafolders.diff")
sha256sums=('8178731e005188a8e87174af26f767b7a1815c06b3bd9b8156440ecea4d7b10a'
            'a8bbf3d0116cf4faa0a073d8b4e7f356a9833d7dd6d26da1e487c90252334667')

prepare() {
  # set global datapath and enable looking in home directory
  patch -Np1 < openjazz-datafolders.diff
  # modplug has changed the header file directory
  sed 's|modplug.h|libmodplug/&|' -i src/io/sound.cpp
}

build() {
  autoreconf -fi
  ./configure --prefix=/usr
  make
}

package() {
  make DESTDIR="$pkgdir/" install
  # licenses
  install -Dm644 licenses.txt "$pkgdir"/usr/share/licenses/openjazz/licenses.txt
}
