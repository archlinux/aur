# Maintainer: Srevin Saju <srevin03@gmail.com>

pkgname=sugar3-toolkit-gtk3
pkgver=0.116
pkgrel=2
pkgdesc="Sugar GTK library"
arch=('x86_64')
url="https://sugarlabs.org/"
license=('LGPL')
depends=('alsa-lib' 'gtk3' 'libsm' 'python-cairo' 'python-dateutil' 'python-decorator'
         'python-six' 'python-gobject' 'telepathy-mission-control' 'unzip')
makedepends=('intltool' 'gobject-introspection')
optdepends=('webkit2gtk: run sugar-activity-web')
source=("https://github.com/sugarlabs/sugar-toolkit-gtk3/archive/v$pkgver.tar.gz")
sha256sums=('64165bf01a53a8267ce9538808e1d077a51eff3616d41bb3bbdf2e538e5ac102')

prepare() {
  cd sugar-toolkit-gtk3-$pkgver
}

build() {
  cd sugar-toolkit-gtk3-$pkgver
  # Disable hardened build until fixed upstream
  # https://bugs.sugarlabs.org/ticket/4886
  export CFLAGS=${CFLAGS/ -fno-plt}
  export LDFLAGS=${LDFLAGS/,-z,now}
  chmod +x ./autogen.sh
  ./autogen.sh --prefix=/usr PYTHON=python3
  sed -i 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make -j1
}

package() {
  cd sugar-toolkit-gtk3-$pkgver
  make DESTDIR="$pkgdir" install
}
