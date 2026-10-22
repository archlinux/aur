# Maintainer: VanillaGreen <brad@vanillagreen.com>
# Based on the owner-tested quickshell-git recipe by Entailz.

_pkgname=quickshell
pkgname=vgshell-quickshell
pkgver=0.3.2.r7.g2b4501a
pkgrel=2
pkgdesc='Flexible toolkit for making desktop shells with QtQuick'
arch=(x86_64 aarch64)
url='https://git.outfoxxed.me/quickshell/quickshell'
options=(!strip)
license=('LGPL-3.0-only')
depends=(
  'qt6-declarative'
  'qt6-base>=6.7'
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
  vgs-1993-managed-process-lifetime.patch)
sha256sums=('SKIP'
            '8543e21aeaaa5441b73a679160e7601a957f16c433e8d6bd9257e80bd0e94083'
            'df5e9c1ef8d2e1881f8781185c4285cd2ac6c8b1bd4fd3b6a3a7de236a40508a'
            '4e15375f9ac2b7a6c81b0bf494f462993d036214bed0d248b5fab5b154996513'
            'f13331a3e1daee17d483738bab1fc375ed9dc12c4824c64e5713c98c98b8e02d')


prepare() {
  cd "$_pkgsrc"
  patch -p1 --forward --fuzz=0 < "$srcdir/vgs-989-deletelater.patch"
  patch -p1 --forward --fuzz=0 < "$srcdir/vgs-1109-log-filter-mutex.patch"
  patch -p1 --forward --fuzz=0 < "$srcdir/vgs-1993-managed-process-lifetime.patch"
}

build() {
  cd "$_pkgname"
  cmake -GNinja -B build \
    -DCMAKE_BUILD_TYPE="RelWithDebInfo" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DDISTRIBUTOR="VGS 2 (package: vgshell-quickshell)" \
    -DINSTALL_QML_PREFIX=lib/qt6/qml

  cmake --build build
}

package() {
  install -Dm644 "quickshell-check.hook" -t "$pkgdir/usr/share/libalpm/hooks"
  cd "$_pkgname"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
}
