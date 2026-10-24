# Maintainer: clague

_pkgname=quickshell
pkgname="$_pkgname-release-git"
pkgver=0.3.2.r11.g9b0f339
pkgrel=1
pkgdesc='Flexible toolkit for making desktop shells with QtQuick (Release build, -DNO_PCH=ON)'
arch=(x86_64 aarch64)
url='https://git.outfoxxed.me/quickshell/quickshell'
options=()
license=('LGPL-3.0-only')
depends=(
  'qt6-declarative'
  'qt6-base'
  'jemalloc'
  'qt6-svg'
  'libpipewire'
  'libxcb'
  'wayland'
  'libdrm'
  'mesa'
	'cpptrace'
  'polkit'
  'hicolor-icon-theme'
)
makedepends=(
	'vulkan-headers'
  'spirv-tools'
  'qt6-shadertools'
  'wayland-protocols'
  'cli11'
  'ninja'
  'cmake'
  'git'
)
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git"
  quickshell-check.hook)
sha256sums=('SKIP'
            '8543e21aeaaa5441b73a679160e7601a957f16c433e8d6bd9257e80bd0e94083')


pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  cmake -GNinja -B build \
    -DCMAKE_BUILD_TYPE="Release" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DDISTRIBUTOR="AUR (package: quickshell-release-git)" \
    -DINSTALL_QML_PREFIX=lib/qt6/qml \
    -DNO_PCH=ON

  cmake --build build
}

package() {
  install -Dm644 "quickshell-check.hook" -t "$pkgdir/usr/share/libalpm/hooks"
  cd "$_pkgname"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
}


# Note:
# - Uses CMAKE_BUILD_TYPE=Release (optimized build)
# - Uses -DNO_PCH=ON to avoid PCH issues when building with clang
