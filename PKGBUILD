# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase="libepc"
pkgname=("${pkgbase}" "${pkgbase}-docs")
pkgver=0.4.6
pkgrel=4
pkgdesc="Easy Publish and Consume Library"
arch=('x86_64' 'i686')
url="https://gitlab.gnome.org/Archive/libepc"
license=('LGPL-2.1-or-later')
makedepends=('avahi>=0.6' 'glib2>=2.36' 'glib2-devel>=2.36' 'gnome-common'
             'gnutls>=1.4' 'gtk3' 'gtk-doc>=1.4' 'intltool>=0.35' 'libsoup>=2.2')
_pkgsrc="${pkgbase}-${pkgver}"
source=("${_pkgsrc}.tar.xz::https://download.gnome.org/sources/${pkgbase}/${pkgver%.*}/${_pkgsrc}.tar.xz")
sha256sums=('215990847a8526c85774cb74fbcaea4c46866df58281b21dce5a62aac5da7ae8')

build() {
  cd "${srcdir}/${_pkgsrc}"
  libtoolize
  autoreconf -vfi
  ./configure \
    --prefix='/usr' \
    --enable-gtk-doc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package_libepc() {
  depends=('avahi>=0.6' 'glib2>=2.36' 'glibc' 'gnutls>=1.4' 'gtk3'
           'libsoup>=2.2' 'util-linux-libs')

  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install
  
  cd "${pkgdir}/usr/share"
  rm -rf "gtk-doc"
}

package_libepc-docs() {
  pkgdesc+=" (documentation)"
  arch=('any')

  cd "${srcdir}/${_pkgsrc}/docs/reference/${pkgbase}"
  make DESTDIR="${pkgdir}" install
}
