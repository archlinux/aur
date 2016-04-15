# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: Kaos < gianlucaatlas_AT_gmail_DOT_com >

pkgname=xf86-input-synaptics-gesturesonly
_pkgname=xf86-input-synaptics
pkgver=1.8.3
pkgrel=1
pkgdesc="Synaptics driver for notebook touchpads"
arch=('i686' 'x86_64')
url="http://patchwork.freedesktop.org/patch/14393/"
license=('custom')
depends=('libxtst' 'mtdev')
makedepends=('pkgconfig' 'xorg-server' 'git' 'xorg-server-devel')
provides=('synaptics' 'xf86-input-synaptics')
conflicts=('synaptics')
groups=('xorg-input-drivers')
options=('!libtool' 'zipman')
source=("$_pkgname"::"git://anongit.freedesktop.org/xorg/driver/xf86-input-synaptics#tag=$_pkgname-$pkgver"
        '50-synaptics.conf.patch'
        '14393-gestures-only.patch')
md5sums=('SKIP'
         '5ae00aad3e70265defa5bd08da621b5c'
         '21afe2219d3bf9a628bbae1e4922978e')
sha256sums=('SKIP'
            '8c24a04508acfab32b78e8dfbebe589e35f908cc74f1225215eed6fd48c530c3'
            '781ed57c18b55c3826f5b3be7c966c6d6dadf2234b9e42fb1052150c987172be')

prepare() {
  cd "$srcdir/$_pkgname"

  patch -p1 < $srcdir/14393-gestures-only.patch
}

build() {
  cd "$srcdir/$_pkgname"

  ./autogen.sh
  ./configure --prefix=/usr --with-xorg-conf-dir=/etc/X11/xorg.conf.d
  make
  patch conf/50-synaptics.conf < $srcdir/50-synaptics.conf.patch
}
package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
