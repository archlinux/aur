# Maintainer: Entailz <entail-wraps0r at icloud dot com>

pkgname=quickshell
pkgver=r484.aeb347b
pkgrel=1
pkgdesc='Simple and flexbile QtQuick based desktop shell toolkit.'
arch=(x86_64 aarch64)
url='https://quickshell.outfoxxed.me/'
options=(!strip)
license=('GPL')
depends=(
  'qt6-declarative'
  'qt6-base'
  'jemalloc'
  'qt6-svg'
  'libpipewire'
  'qt6-wayland'
  'wayland-protocols'
  'libxcb'
  'wayland'
  'cli11'
  'libdrm'
  'mesa'
  'google-breakpad'
  'qt6-shadertools'
)
makedepends=(
  'ninja'
  'cmake'
  'pkgconf'
)

source=(git+https://git.outfoxxed.me/$pkgname/$pkgname
  quickshell-check.hook)
sha256sums=('SKIP'
  '8543e21aeaaa5441b73a679160e7601a957f16c433e8d6bd9257e80bd0e94083')
b2sums=('SKIP'
  'c729d8c05d0490eda0a4095d831f7fe4f2873debe0dd3dbb0de41a801ed652a885de7048cecc26eaddec9d22e68a7d00552ad3f3db96d80041671192faf0afe0')

pkgver() {
  cd "$srcdir/quickshell"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
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

  cd $pkgname
  DESTDIR=$pkgdir cmake --install build
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
