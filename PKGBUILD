# Maintainer: Remisa Phillips <remisa.yousefvand@gmail.com>

pkgname=remidock
pkgver=0.4.13
pkgrel=1
pkgdesc='Custom Qt/QML dock for KDE Plasma Wayland'
arch=('x86_64')
url='https://github.com/yousefvand/RemiDock'
license=('MIT')
depends=(
  'qt6-base'
  'qt6-declarative'
  'qt6-svg'
  'qt6-imageformats'
  'layer-shell-qt'
  'libpulse'
)
makedepends=(
  'cmake'
  'ninja'
  'gcc'
  'extra-cmake-modules'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/yousefvand/RemiDock/archive/refs/tags/v0.4.13.tar.gz")
sha256sums=('50ccab764776f40777e22310d56368e86756f89fe723d2554f6acfab6b2e74c6')

build() {
  cmake -S "RemiDock-${pkgver}" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  # Binary-only package: do not run , because that may
  # install README, license, desktop files, icons, autostart files, or other
  # project resources. Only the compiled executable is packaged.
  local binary_path=""

  # The RemiDock CMake build currently places the executable in build/bin/.
  # Older or different layouts may place it elsewhere, so keep a safe fallback.
  if [[ -f "build/bin/RemiDock" && -x "build/bin/RemiDock" ]]; then
    binary_path="build/bin/RemiDock"
  else
    binary_path="$(find build -type f -perm -111 -name 'RemiDock' | head -n 1)"
  fi

  if [[ -z "${binary_path:-}" || ! -f "$binary_path" || ! -x "$binary_path" ]]; then
    printf 'ERROR: Could not find built executable file: RemiDock\n' >&2
    find build -maxdepth 3 -name 'RemiDock' -print >&2 || true
    exit 1
  fi

  install -Dm755 "$binary_path" "$pkgdir/usr/bin/RemiDock"
}
