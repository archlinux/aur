# Maintainer: VanillaGreen <brad@vanillagreen.com>
# Based on the owner-tested quickshell-git recipe by Entailz.

_pkgname=quickshell
pkgname=vgshell-quickshell
pkgver=0.3.2.r7.g2b4501a
pkgrel=6
pkgdesc='Flexible toolkit for making desktop shells with QtQuick'
arch=(x86_64 aarch64)
url='https://git.outfoxxed.me/quickshell/quickshell'
options=(!strip)
license=('LGPL-3.0-only')
depends=(
  'qt6-declarative'
  'qt6-base>=6.7'
  'qt6-wayland'
  'jemalloc'
  'qt6-svg'
  'libpipewire'
  'libxcb'
  'wayland'
  'libdrm'
  'mesa'
	'cpptrace'
	'polkit'
)
makedepends=(
	'vulkan-headers'
  'spirv-tools'
  'qt6-shadertools'
  'wayland'
  'wayland-protocols'
  'cli11'
  'ninja'
  'cmake'
  'git'
)
provides=("$_pkgname=${pkgver%%.r*}")
conflicts=('quickshell' 'quickshell-git')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git#commit=2b4501a282689792b62e94f3fb30d8f512324fe6"
  quickshell-check.hook
  vgs-989-deletelater.patch
  vgs-1109-log-filter-mutex.patch
  vgs-1993-managed-process-lifetime.patch
  vgs-1129-fileview-read.patch
  vgs-2641-presentation-feedback.patch)
sha256sums=('SKIP'
            '8543e21aeaaa5441b73a679160e7601a957f16c433e8d6bd9257e80bd0e94083'
            '053fe3488b504f05e4c6ff2a4f7248f4bc31f08760598fa424536c6d7d975c9c'
            'd417a500ace6e3920c07f30873ce6a8dcf17ec96307fdb9e7e48f208c4c17951'
            'e4422d6727624596206e18f4a866f3d7073a691b5f1bb9ebddf1fe9482055c15'
            'b17cb15ba1a1396bc2422a0209f413fa308cfef22c51ea285fab3eecaf3560e3'
            '71b0a1c927954f493d0c294f68e6cb8c8eea761068f2820c949f53e34889bd01')


prepare() {
  cd "$_pkgsrc"
  patch -p1 --forward --fuzz=0 < "$srcdir/vgs-989-deletelater.patch"
  patch -p1 --forward --fuzz=0 < "$srcdir/vgs-1109-log-filter-mutex.patch"
  patch -p1 --forward --fuzz=0 < "$srcdir/vgs-1993-managed-process-lifetime.patch"
  patch -p1 --forward --fuzz=0 < "$srcdir/vgs-1129-fileview-read.patch"
  patch -p1 --forward --fuzz=0 < "$srcdir/vgs-2641-presentation-feedback.patch"
}

build() {
  cd "$_pkgname"
  cmake -GNinja -B build \
    -DCMAKE_BUILD_TYPE="RelWithDebInfo" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DDISTRIBUTOR="VGS 5 (package: vgshell-quickshell)" \
    -DINSTALL_QML_PREFIX=lib/qt6/qml

  cmake --build build
}

package() {
  install -Dm644 "quickshell-check.hook" -t "$pkgdir/usr/share/libalpm/hooks"
  cd "$_pkgname"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
}
