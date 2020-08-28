# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: m4sk1n <m4sk1n@o2.pl>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>

_pkgname=libxfce4ui
pkgname=${_pkgname}-devel
pkgver=4.15.3
pkgrel=3
pkgdesc="Commonly used Xfce widgets among Xfce applications (Development version)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://gitlab.xfce.org/xfce/libxfce4ui/-/blob/master/README"
license=('GPL2')
groups=('xfce4-devel')
depends=('libxfce4util' 'xfconf' 'libsm' 'startup-notification'
         'hicolor-icon-theme' 'gtk3' 'libgtop')
makedepends=('intltool' 'gtk-doc' 'gobject-introspection' 'vala' 'glade' 'xfce4-dev-tools')
optdepends=('glade: Glade designer plugin')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://archive.xfce.org/src/xfce/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2"
        '0001_shortcut_keys_fix.patch::https://gitlab.xfce.org/xfce/libxfce4ui/-/commit/0fc934ebee037a91e032d362d83d991309c4ce88.patch')
sha256sums=('ce89419720da0fa84a3bb46bc447564c5800057c026c272ae0b016918c0a9307'
            'f26766a45833804699de03224ff9e5b6ca3d76ad860802bb14e26792864205ac')

prepare() {
  cd "${_pkgname}-${pkgver}"
  # https://gitlab.xfce.org/xfce/libxfce4ui/-/merge_requests/4
  patch -Np1 -i ../0001_shortcut_keys_fix.patch
}

build() {
  cd "${_pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-gtk-doc \
    --disable-debug \
    --enable-gladeui2 \
    --with-vendor-info='Arch Linux' \
    --enable-maintainer-mode

  make
}

package() {
  cd "${_pkgname}-${pkgver}"

  make DESTDIR="$pkgdir" install
}
