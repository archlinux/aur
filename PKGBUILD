pkgname=grilo-plugins-git
_pkgname=grilo-plugins
pkgver=0.3.12+35+gd6d91c7c
pkgrel=1
epoch=1
pkgdesc="A collection of plugins for the Grilo framework"
url="https://gitlab.gnome.org/GNOME/grilo-plugins"
arch=(x86_64)
license=(LGPL)
depends=('grilo' 'lua' 'libmediaart' 'libgdata' 'tracker3' 'gom' 'libdmapsharing' 'chromaprint'
         'gst-plugins-bad' 'gmime3')
makedepends=('git' 'meson' 'gperf' 'yelp-tools')
checkdepends=('gst-plugins-good' 'gst-plugins-base' 'python-gobject' 'tracker3-miners')
optdepends=('dleyna-server: DLNA plugin'
            'tracker3-miners: Tracker plugin')
provides=('grilo-plugins')
conflicts=('grilo-plugins')
source=("git+https://gitlab.gnome.org/GNOME/grilo-plugins.git")
b2sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^grilo-plugins-//;s/-/+/g'
}

build() {
  arch-meson -D enable-tracker=no $_pkgname build
  meson compile -C build
}

check() {
  dbus-run-session meson test -C build --print-errorlogs
}

package() {
  depends+=(libgr{ilo,lnet,lpls}-0.3.so)
  DESTDIR="$pkgdir" meson install -C build
}
