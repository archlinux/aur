# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: m4sk1n <m4sk1n@o2.pl>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>

_pkgname=libxfce4ui
pkgbase="${_pkgname}"-git
pkgname=("${pkgbase}")
pkgver=4.13.4.r1.geafab0f
pkgrel=2
pkgdesc="Commonly used Xfce widgets among Xfce applications (git checkout)"
arch=('i686' 'x86_64')
url="https://git.xfce.org/xfce/libxfce4ui/tree/README"
license=('GPL2')
# libxfce4ui-devel depends
makedepends=('libxfce4util>=4.12.0' 'gtk2' 'xfconf' 'libsm' 'startup-notification'
         'hicolor-icon-theme' 'gtk3')
# build depends
makedepends+=('intltool' 'gtk-doc' 'xfce4-dev-tools' 'gobject-introspection' 'git' 'vala')
source=("${_pkgname}::git://git.xfce.org/xfce/libxfce4ui")
sha256sums=('SKIP')

if [[ "`pkg-config --modversion gladeui-2.0 2>/dev/null`" != '' ]] ; then makedepends+=('glade') ; pkgname+=('glade-plugin-libxfce4ui-git') ; fi
if [[ "`pkg-config --modversion gladeui-1.0 2>/dev/null`" != '' ]] ; then makedepends+=('glade-gtk2') ; pkgname+=('glade-gtk2-plugin-libxfce4ui-git') ; fi

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/([^-]*-g)/r\1/;s/-/./g"
}

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

package_libxfce4ui-git() {
  depends=('libxfce4util>=4.12.0' 'gtk2' 'xfconf' 'libsm' 'startup-notification'
           'hicolor-icon-theme' 'gtk3')
  provides=("${_pkgname}=${pkgver%%.r*}")
  conflicts=("${_pkgname}")
  
  cd "${_pkgname}"

  make DESTDIR="$pkgdir" install
  rm -fr "${pkgdir}"/usr/{lib,share}/glade{,3}
}

package_glade-plugin-libxfce4ui-git() {
  pkgdesc='Glade GTK3 interface designer plugin for libxfce4ui'
  depends=('glade' "${_pkgname}>=${pkgver%.r*}")
  provides=("glade-plugin-libxfce4ui=${pkgver%.r*}")
  conflicts=('glade-plugin-libxfce4ui')

  cd "${_pkgname}"/glade

  make DESTDIR="$pkgdir" install
}

package_glade-gtk2-plugin-libxfce4ui-git() {
  pkgdesc='Glade GTK2 interface designer plugin for libxfce4ui'
  depends=('glade-gtk2' "${_pkgname}>=${pkgver%.r*}")
  provides=("glade-gtk2-plugin-libxfce4ui=${pkgver%.r*}")
  conflicts=('glade-gtk2-plugin-libxfce4ui')
  
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
