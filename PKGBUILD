# Maintainer: Skunnyk <skunnyk@archlinux.fr>
# Maintainer: Andre Miranda <andreldm at xfce dot org>
pkgname=xfce4-screenshooter-git
pkgver=1.11.3.r6.g34ba26d
pkgrel=1
pkgdesc="An application to take screenshots"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://docs.xfce.org/apps/screenshooter/start"
license=('GPL-2.0-or-later')
groups=('xfce4-goodies')
depends=('xfce4-panel' 'hicolor-icon-theme')
makedepends=('git' 'glib2-devel' 'meson' 'xfce4-dev-tools' 'wayland-protocols')
provides=('xfce4-screenshooter')
conflicts=('xfce4-screenshooter')
source=($pkgname::git+https://gitlab.xfce.org/apps/xfce4-screenshooter.git)
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long | sed -r 's/^xfce4-screenshooter-//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  git submodule init
  git config submodule.mate-submodules.url "$srcdir/protocols/wlr-protocols"
  git -c protocol.file.allow=always submodule update
}

build() {
    arch-meson $pkgname build \
        --localstatedir=/var
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
