_pkgname=sys-perf-prof-tray
pkgname=${_pkgname}-git
pkgver=1.0
pkgrel=1
pkgdesc='Manages CPU boost, CPU governors, LACT profiles from tray icon'
arch=('x86_64')
url='https://github.com/zaps166/sys-perf-prof-tray'
license=('MIT')
depends=('qt6-base')
makedepends=('ninja' 'cmake' 'fakeroot')
optdepends=('lact' 'cpupower' 'sudo')
source=("git+https://github.com/zaps166/sys-perf-prof-tray.git")
sha256sums=('SKIP')

build() {
  cmake \
    -G Ninja \
    -B build \
    -S $_pkgname \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_SUDO=ON
  ninja -C build
}

package() {
  install -Dm755 "$srcdir/build/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 "$srcdir/$_pkgname/conf/autostart/$_pkgname.desktop" "$pkgdir/etc/xdg/autostart/$_pkgname.desktop"

  mkdir -p "$pkgdir/etc/sudoers.d"
  chmod 750 "$pkgdir/etc/sudoers.d"
  install -m640 "$srcdir/$_pkgname/conf/sudoers.d/$_pkgname" "$pkgdir/etc/sudoers.d/$_pkgname"
}
