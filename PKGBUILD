# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname=lightdm-slick-greeter
_pkgname=slick-greeter
pkgver=1.2.4
pkgrel=1
pkgdesc="A slick-looking LightDM greeter"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/${_pkgname}"
license=('GPL3')
depends=('cairo'
    'freetype2'
    'gtk3'
    'libcanberra'
    'libxext'
    'lightdm'
    'pixman'
    'xorg-server')
optdepends=('numlockx: enable numerical keypad on supported keyboard')
makedepends=('gnome-common'
    'intltool'
    'vala')
backup=('etc/lightdm/slick-greeter.conf')
install=slick-greeter.install
source=("${_pkgname}-${pkgver}.tar.gz::$url/archive/${pkgver}.tar.gz")
sha256sums=('e00f873219f6656eae6ec99af9188b3772ab6a19cacc9daa27e9a3465ba73af2')

#prepare() {
#  cd ${_pkgname}-${pkgver}
  #Allow compiling with newer versions of Vala
#  patch -Np0 -i ../compile_new_vala.patch
#}

build() {
    cd ${_pkgname}-${pkgver}
    aclocal --install
    autoreconf -vfi
    intltoolize -f
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --sbindir=/usr/bin \
        --libexecdir=/usr/lib/lightdm
    make
}

package() {
    cd ${_pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
    # adjust launcher name
    mv $pkgdir/usr/share/xgreeters/slick-greeter.desktop \
      $pkgdir/usr/share/xgreeters/lightdm-slick-greeter.desktop
}
