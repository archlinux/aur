# Credits: Based on work by Outfoxxed and PR contributions by the Quickshell community (PR #351).

pkgname=noon-qs-web
_pkgname=quickshell
pkgver=0.2.1.r351.g$(date +%Y%m%d)
pkgrel=1
pkgdesc="Flexible toolkit for making desktop shells with QtQuick (PR #351 WebView support) for Noon Project"
arch=('x86_64' 'aarch64')
url="https://github.com/quickshell-mirror/quickshell"
license=('LGPL3')
depends=('gcc-libs' 'hicolor-icon-theme' 'jemalloc' 'libglvnd' 'libdrm' 'libpam.so'
         'libpipewire' 'libwayland-client.so' 'libxcb' 'mesa' 'pam' 'qt6-base'
         'qt6-declarative' 'qt6-svg' 'qt6-wayland' 'qt6-webengine' 'wayland')
makedepends=('git' 'cmake' 'ninja' 'cli11' 'qt6-shadertools' 'spirv-tools' 'wayland-protocols')
provides=("quickshell")
conflicts=("quickshell" "quickshell-git")
source=("$_pkgname::git+https://github.com/quickshell-mirror/quickshell.git#branch=master")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgname"
  git fetch origin pull/351/head:webview-pr
  git checkout webview-pr
}

pkgver() {
  cd "$_pkgname"
  printf "0.2.1.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S "$_pkgname" \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_JEMALLOC=ON \
    -DCRASH_REPORTER=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
