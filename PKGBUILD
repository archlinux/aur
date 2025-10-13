# Maintainer: Entailz <entail-wraps0r at icloud dot com>

pkgname=quickshell
pkgver=0.2.1
pkgrel=1
pkgdesc='Flexible toolkit for making desktop shells with QtQuick'
arch=(x86_64 aarch64)
url='https://git.outfoxxed.me/quickshell/quickshell'
options=(!strip)
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
  'google-breakpad'
)
makedepends=(
  'spirv-tools'
  'qt6-shadertools'
  'wayland'
  'wayland-protocols'
  'cli11'
  'ninja'
  'cmake'
  'pkgconf'
)

source=("$pkgname"-"$pkgver.tar.gz"::"$url/archive/v0.2.1.tar.gz"
  quickshell-check.hook)

sha256sums=('a7e0a1029ff69d0f3b5788e042463735bacafd5fc369b1382143ffbd9d497964'
            '8543e21aeaaa5441b73a679160e7601a957f16c433e8d6bd9257e80bd0e94083')
b2sums=('88a1b8db9b731de7f0c196eacf6533152c6766f4d13b9154c8089e215e07b83ae3434c1efda71a4a7ca1c71b323e0f9182a2f746882203548493ed83fd59cc3c'
        'c729d8c05d0490eda0a4095d831f7fe4f2873debe0dd3dbb0de41a801ed652a885de7048cecc26eaddec9d22e68a7d00552ad3f3db96d80041671192faf0afe0')

build() {
  cd "$pkgname"
  cmake -GNinja -B build \
    -DCMAKE_BUILD_TYPE="RelWithDebInfo" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DDISTRIBUTOR="AUR (package: quickshell)" \
    -DDISTRIBUTOR_DEBUGINFO_AVAILABLE=NO \
    -DINSTALL_QML_PREFIX=lib/qt6/qml

  cmake --build build
}

package() {
  install -Dm644 "quickshell-check.hook" -t "$pkgdir/usr/share/libalpm/hooks"
  cd "$pkgname"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}

post_install() {
    update-desktop-database -q
    xdg-icon-resource forceupdate
}
