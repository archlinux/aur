# Maintainer: noctalia-dev <team@noctalia.dev>
_pkgname=noctalia-qs
pkgname="$_pkgname-git"
pkgver=0.0.1.r0.gb2c7d52
pkgrel=1
pkgdesc='Custom fork of Quickshell powering Noctalia Shell'
arch=(x86_64 aarch64)
url='https://github.com/noctalia-dev/noctalia-qs'
license=('LGPL-3.0-only')
options=(!debug)
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
  'polkit'
)
makedepends=(
  'spirv-tools'
  'qt6-shadertools'
  'wayland'
  'wayland-protocols'
  'cli11'
  'ninja'
  'cmake'
  'git'
)
provides=("$_pkgname")
conflicts=(
  "$_pkgname"
  quickshell
  quickshell-git
)
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
  cmake -G Ninja -B build \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D DISTRIBUTOR="AUR (package: noctalia-qs-git)" \
    -D DISTRIBUTOR_DEBUGINFO_AVAILABLE=No \
    -D INSTALL_QML_PREFIX=lib/qt6/qml
  cmake --build build
}

package() {
  install -Dm644 "quickshell-check.hook" -t "$pkgdir/usr/share/libalpm/hooks"
  cd "$_pkgname"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
}