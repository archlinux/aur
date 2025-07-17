# Maintainer: Jan de Groot  <jgc@archlinux.org>
pkgname=libwnck
pkgver=2.31.0
pkgrel=5
pkgdesc="Window Navigator Construction Kit"
arch=('x86_64')
license=('LGPL-2.0-only')
depends=(
  'at-spi2-core' 'libatk-1.0.so'
  'cairo' 'libcairo.so'
  'fontconfig'
  'freetype2' 'libfreetype.so'
  'gdk-pixbuf2' 'libgdk_pixbuf-2.0.so'
  'glib2' 'libgio-2.0.so'
  'glibc'
  'gtk2'
  'harfbuzz' 'libharfbuzz.so'
  'libx11'
  'libxres'
  'pango' 'libpango-1.0.so'
  'startup-notification'
)
makedepends=('libxt' 'intltool' 'gobject-introspection')
url="https://gitlab.gnome.org/GNOME/libwnck"
provides=('libwnck-1.so')
source=(https://download.gnome.org/sources/${pkgname}/${pkgver:0:4}/${pkgname}-${pkgver}.tar.xz
        WindowActionMenu-unset-window-and-stop-async-events-on-dispose.patch)
sha512sums=('54262a08882021f08f3ba7f2ddfa33fc1f02e391a0f61cf999a50a089e0d277dfe13ab133c1a46e9abf0599bd24c21dacff80b51013cbb1375d2cd71ac9abbe9'
            '1ba6ee8503e71daf103b7285ce0690042ebd86a4b85728a04ff32e6ee5789d2be71ba32149b0c246518bc47a27a233edfa9cfac9eca16cc44b3c6c8d19943423')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../WindowActionMenu-unset-window-and-stop-async-events-on-dispose.patch
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr --sysconfdir=/etc \
        --localstatedir=/var --disable-static
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install

    #The binaries are shipped in libwnck3
    rm -f "${pkgdir}/usr/bin/wnckprop"
    rm -f "${pkgdir}/usr/bin/wnck-urgency-monitor"
    rmdir "${pkgdir}/usr/bin"
}
