# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: twa022 <twa022 at gmail dot com>

pkgbase=gnome-python-desktop
pkgname=('gnome-python-desktop' 'python2-gnomekeyring' 'python2-wnck')
pkgver=2.32.0
pkgrel=20
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
makedepends=('intltool' 'pkg-config' 'gnome-python' 'libwnck' 'libgnome-keyring' 'python2')
url="https://www.gnome.org"
source=(https://download.gnome.org/sources/${pkgbase}/${pkgver%.*}/${pkgbase}-${pkgver}.tar.bz2
        01_wnck_enums.patch)
sha256sums=('09dbd580bf3b0ef60f91b090eafe6d08ddcc50a609e2b425a7f8eca46d4e0ee9'
            'e21823dcc1a16174dbf9e48d99c6d3b29fded24ac65dfa55cae9981380a91759')

prepare() {
  cd ${pkgbase}-${pkgver}
  patch -Np1 -i ../01_wnck_enums.patch
}

build() {
  cd ${pkgbase}-${pkgver}
  PYTHON=/usr/bin/python2 ./configure \
    --prefix=/usr \
    --disable-metacity \
    --disable-evolution \
    --disable-evolution_ecal
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package_gnome-python-desktop() {
  depends=('python2-gnomekeyring' 'python2-wnck' 'gnome-python')
  pkgdesc="Python bindings for the GNOME desktop environment"

  cd ${pkgbase}-${pkgver}
  make install-pkgconfigDATA DESTDIR="${pkgdir}"
}

package_python2-gnomekeyring() {
  depends=('pygtk' 'libgnome-keyring')
  pkgdesc="Python bindings for libgnome-keyring"
  conflicts=('python-gnomekeyring<=2.32.0-10')
  replaces=('python-gnomekeyring<=2.32.0-10')

  cd ${pkgbase}-${pkgver}
  make -C gnomekeyring install DESTDIR="${pkgdir}"
}

package_python2-wnck() {
  depends=('pygtk' 'libwnck')
  pkgdesc="Python bindings for libwnck"
  conflicts=('python-wnck<=2.32.0-10')
  replaces=('python-wnck<=2.32.0-10')

  cd ${pkgbase}-${pkgver}
  make -C wnck install DESTDIR="${pkgdir}"
}

