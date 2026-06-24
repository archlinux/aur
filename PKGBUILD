_pkgname=xfce4-notifyd-layer-shell
pkgname=xfce4-notifyd-layer-shell-git
pkgver=0.4.4.r262.gcdf1ea5
pkgrel=1
pkgdesc="xfce4-notifyd (Xfce's notification daemon) with Wayland layer shell support"
arch=('x86_64')
url='https://github.com/icasdri/xfce4-notifyd-layer-shell'
license=('GPL2')
conflicts=('xfce4-notifyd')
depends=('libxfce4ui' 'libnotify' 'hicolor-icon-theme' 'gtk-layer-shell')
makedepends=('xfce4-dev-tools' 'intltool' 'python' 'xfce4-panel')
provides=('notification-daemon')
source=('git+https://github.com/icasdri/xfce4-notifyd-layer-shell.git')
sha256sums=('SKIP')
options=('!lto')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | cut -c 15- | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"

  export LDFLAGS="$LDFLAGS -fuse-ld=bfd"
  export LIBS="$(pkg-config --libs gtk+-3.0) $LIBS"
  ./autogen.sh \
    --prefix=/usr \
    --disable-static \
    --disable-debug
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir" install
}
