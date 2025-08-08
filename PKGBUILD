# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=parole
pkgname=${_pkgname}-git
pkgver=4.20.0+106+g77acd986
pkgrel=1
pkgdesc="Modern media player based on the GStreamer framework (git checkout)"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://gitlab.xfce.org/apps/parole/-/blob/master/README.md"
license=('GPL-2.0-or-later')
groups=('xfce4-goodies-git')
depends=('gst-plugins-base' 'gst-plugins-good' 'libnotify' 'libxfce4ui'
         'dbus-glib' 'taglib')
makedepends=('python' 'glib2-devel' 'git' 'xfce4-dev-tools' 'meson' 'gtk-doc')
optdepends=('gst-libav: Extra media codecs'
            'gst-plugins-bad: Extra media codecs'
            'gst-plugins-ugly: Extra media codecs')
provides=("${_pkgname}=${pkgver%%+*}")
conflicts=("${_pkgname}")
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
    -D taglib=enabled
    -D gtk-doc=true
  )

  arch-meson "${_pkgname}" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
