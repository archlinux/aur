# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=xfce4-screensaver
pkgname=${_pkgname}-git
pkgver=4.20.0+1+g49d1344
pkgrel=1
pkgdesc='Screensaver for XFCE Desktop (git checkout)'
url='https://docs.xfce.org/apps/screensaver/start'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('GPL2')
depends=('libxss' 'libxklavier' 'garcon' 'libwnck3' 'python-gobject' 'xfconf' 'dbus-glib'
         'libwlembed' 'libxfce4windowing')
makedepends=('systemd' 'xfce4-dev-tools' 'meson' 'wayland-protocols' 'git' 'xmlto' 'docbook-xml')
provides=("${_pkgname}=${pkgver%%+*}")
conflicts=("${_pkgname}")
groups=('xfce4-goodies-git')
source=("${_pkgname}::git+https://gitlab.xfce.org/apps/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/^xfce-//;s/-/+/g"
}

build() {
  local meson_options=(
    -D x11=enabled
    -D wayland=enabled
    -D docs=enabled
  )

  arch-meson "${_pkgname}" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
