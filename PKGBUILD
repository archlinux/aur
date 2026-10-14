# Maintainer: MaksSuRitik <https://github.com/MaksSuRitik>
pkgname=hyprwallselector-git
pkgver=0.1.0.r9.g802ae0d
pkgrel=1
pkgdesc='Independent image and video wallpaper carousel for Hyprland'
arch=('x86_64' 'aarch64')
url='https://github.com/MaksSuRitik/hyprwallselector'
license=('GPL-3.0-or-later')
depends=('qt6-base>=6.10' 'qt6-declarative' 'qt6-wayland' 'layer-shell-qt' 'mpv' 'ffmpeg' 'systemd-libs' 'gcc-libs' 'glibc')
makedepends=('cmake' 'ninja' 'git' 'qt6-shadertools' 'extra-cmake-modules' 'systemd')
checkdepends=('xorg-server-xvfb' 'xorg-xauth')
optdepends=('dms-shell: DMS palette and lock-screen synchronization' 'hyprland: compositor, display state and fullscreen detection' 'qt6-imageformats: additional image formats' 'upower: pause video on battery')
provides=('hyprwallselector')
conflicts=('hyprwallselector')
source=('git+https://github.com/MaksSuRitik/hyprwallselector.git')
sha256sums=('SKIP')
pkgver() {
  cd "$srcdir/hyprwallselector"
  printf '0.1.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
  cmake -S "$srcdir/hyprwallselector" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBEXECDIR=lib/hyprwallselector -DBUILD_TESTING=ON
  cmake --build build
}
check() {
  ctest --test-dir build --output-on-failure
  sh "$srcdir/hyprwallselector/tests/run-ui.sh" "$srcdir/build/test-ui"
}
package() {
  DESTDIR="$pkgdir" cmake --install build
}
