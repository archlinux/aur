# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfconf
pkgname=${_pkgname}-devel
pkgver=4.17.2
pkgrel=1
pkgdesc="A simple client-server configuration storage and query system"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://docs.xfce.org/xfce/xfconf/start"
license=('GPL2')
groups=('xfce4-devel')
depends=('libxfce4util' 'dbus')
makedepends=('intltool' 'gtk-doc' 'chrpath' 'vala' 'gobject-introspection' 'python') #for gdbus-codegen
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!emptydirs')
source=("https://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('e4eefa03cdd3672f928e80bf86f68ba9e9ea3e1ee8208f8d964610c416ee8db0')

build() {
  cd "${_pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var \
    --disable-static \
    --enable-gtk-doc \
    --disable-debug
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install

  # fix insecure rpath, https://bugs.archlinux.org/task/19980
  find "$pkgdir" -name Xfconf.so -exec chrpath -d {}  \;
}

