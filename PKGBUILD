# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: m4sk1n <m4sk1n@o2.pl>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>

_pkgname=libxfce4ui
pkgbase="${_pkgname}"-devel
pkgname=("${pkgbase}")
pkgver=4.13.4
pkgrel=1
pkgdesc="Commonly used Xfce widgets among Xfce applications (Development version)"
arch=('i686' 'x86_64')
url="https://git.xfce.org/xfce/libxfce4ui/tree/README"
license=('GPL2')
# libxfce4ui-devel depends
makedepends=('libxfce4util>=4.12.0' 'gtk2' 'xfconf' 'libsm' 'startup-notification'
         'hicolor-icon-theme' 'gtk3')
# build depends
makedepends+=('intltool' 'gtk-doc' 'xfce4-dev-tools' 'gobject-introspection' 'git' 'vala')
_commit='a663a5344d405eb93192ada5e0990ee9a5269b4c'
source=("${_pkgname}"::git://git.xfce.org/xfce/libxfce4ui#commit="${_commit}")
sha256sums=('SKIP')

if [[ "`pkg-config --modversion gladeui-2.0 2>/dev/null`" != '' ]] ; then makedepends+=('glade') ; pkgname+=('glade-plugin-libxfce4ui-devel') ; fi
if [[ "`pkg-config --modversion gladeui-1.0 2>/dev/null`" != '' ]] ; then makedepends+=('glade-gtk2') ; pkgname+=('glade-gtk2-plugin-libxfce4ui-devel') ; fi

build() {
  cd "${_pkgname}"

  NOCONFIGURE=1 ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-gtk-doc \
    --disable-debug \
    --enable-maintainer-mode \
    --disable-gladeui \
    --with-vendor-info='Arch Linux'
  make
}

package_libxfce4ui-devel() {
  depends=('libxfce4util>=4.12.0' 'gtk2' 'xfconf' 'libsm' 'startup-notification'
           'hicolor-icon-theme' 'gtk3')
  provides=("${_pkgname}=${pkgver%%.r*}")
  conflicts=("${_pkgname}")
  
  cd "${_pkgname}"

  make DESTDIR="$pkgdir" install
  rm -fr "${pkgdir}"/usr/{lib,share}/glade{,3}
}

package_glade-plugin-libxfce4ui-devel() {
  pkgdesc='Glade GTK3 interface designer plugin for libxfce4ui'
  depends=('glade' "${_pkgname}>=${pkgver%.r*}")

  cd "${_pkgname}"/glade

  make DESTDIR="$pkgdir" install
}

package_glade-gtk2-plugin-libxfce4ui-devel() {
  pkgdesc='Glade GTK2 interface designer plugin for libxfce4ui'
  depends=('glade-gtk2' "${_pkgname}>=${pkgver%.r*}")

  cd "${_pkgname}"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-gtk-doc \
    --disable-debug \
    --enable-maintainer-mode \
    --disable-gladeui2 \
    --with-vendor-info='Arch Linux'

  cd glade
  make
  make DESTDIR="$pkgdir" install
}
