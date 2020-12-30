# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=parole
pkgname=${_pkgname}-git
pkgver=4.15.0
pkgrel=1
pkgdesc="Modern media player based on the GStreamer framework (git checkout)"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://gitlab.xfce.org/apps/parole/-/blob/master/README.md"
license=('GPL')
groups=('xfce4-goodies')
depends=('gst-plugins-base' 'gst-plugins-good' 'libnotify' 'libxfce4ui'
         'dbus-glib')
makedepends=('intltool' 'python' 'git' 'xfce4-dev-tools')
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
  cd "${_pkgname}-${pkgver}"
  ./configure --prefix=/usr
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
