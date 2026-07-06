# Maintainer: Dustin Pilgrim

_pkgname=quickshell
pkgname=quickshell-lockhint-git
pkgver=0.3.0.r829.g78c72f2
pkgrel=1
pkgdesc='Flexible toolkit for making desktop shells with QtQuick (logind LockedHint build)'
arch=('x86_64' 'aarch64')
url='https://github.com/saltnpepper97/quickshell'
license=('LGPL-3.0-only')
options=('!strip')

depends=(
  'cpptrace'
  'glib2'
  'hicolor-icon-theme'
  'jemalloc'
  'libdrm'
  'libpipewire'
  'libxcb'
  'mesa'
  'pam'
  'polkit'
  'qt6-base'
  'qt6-declarative'
  'qt6-svg'
  'qt6-wayland'
  'wayland'
)
makedepends=(
  'cli11'
  'cmake'
  'git'
  'ninja'
  'pkgconf'
  'qt6-shadertools'
  'spirv-tools'
  'vulkan-headers'
  'wayland-protocols'
)
provides=('quickshell')
conflicts=('quickshell' 'quickshell-git')

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc::git+$url.git#branch=master"
  'quickshell-check.hook'
)
sha256sums=(
  'SKIP'
  '8543e21aeaaa5441b73a679160e7601a957f16c433e8d6bd9257e80bd0e94083'
)

pkgver() {
  cd "$_pkgsrc"
  printf '0.3.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$_pkgsrc"
  cmake -GNinja -B build \
    -DCMAKE_BUILD_TYPE='RelWithDebInfo' \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DDISTRIBUTOR='AUR (quickshell-lockhint-git)' \
    -DINSTALL_QML_PREFIX=lib/qt6/qml

  cmake --build build
}

package() {
  install -Dm644 'quickshell-check.hook' -t "$pkgdir/usr/share/libalpm/hooks"

  cd "$_pkgsrc"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname"
}
