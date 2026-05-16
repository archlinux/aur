# Maintainer: mainstreamos <https://github.com/MainstreamOS>
_commit='7d1c9a9c6721606b129829134d6f614f015621e2'
# Useful links:
# https://git.outfoxxed.me/quickshell/quickshell/commits/branch/master
# https://aur.archlinux.org/packages/quickshell-git

groups=(mainstream)
_prefix='mainstream'
replaces=('illogical-impulse-quickshell-git')

_pkgname=quickshell
pkgname="$_prefix-$_pkgname-git"
pkgver=0.3.0.r3
pkgrel=1
pkgdesc="$_pkgname-git pinned commit and extra deps for $_prefix"
arch=(x86_64 aarch64)
url='https://git.outfoxxed.me/quickshell/quickshell'
options=(!strip)
license=('LGPL-3.0-only')
depends=(
  'cpptrace'
  'jemalloc'
  'mesa'
  'qt6-declarative'
  'qt6-base'
  'qt6-svg'
  'libdrm'
  'libpipewire'
  'libxcb'
  'wayland'
  'glib2'
  'polkit'
  # NOTE: Below are custom dependencies of illogical-impulse
  qt6-5compat
  qt6-avif-image-plugin
  qt6-imageformats
  qt6-multimedia
  qt6-positioning
  qt6-quicktimeline
  qt6-sensors
  qt6-svg
  qt6-tools
  qt6-translations
  qt6-virtualkeyboard
  qt6-wayland
  kirigami
  syntax-highlighting
)
makedepends=(
  'cli11'
  'cmake'
  'git'
  'ninja'
  'polkit'
  'qt6-shadertools'
  'spirv-tools'
  'vulkan-headers'
  'wayland'
  'wayland-protocols'
)
provides=("$_pkgname" "$_pkgname-git")
conflicts=("$_pkgname" "$_pkgname-git")

_pkgsrc="$_pkgname"
source=("$_pkgsrc::git+$url.git#commit=$_commit"
  quickshell-check.hook)
sha256sums=('SKIP'
  '8543e21aeaaa5441b73a679160e7601a957f16c433e8d6bd9257e80bd0e94083')

build() {
  cd "$_pkgname"
  cmake -GNinja -B build \
    -DCMAKE_BUILD_TYPE="RelWithDebInfo" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DDISTRIBUTOR="AUR (package: quickshell-git)" \
    -DINSTALL_QML_PREFIX=lib/qt6/qml

  cmake --build build
}

package() {
  install -Dm644 "quickshell-check.hook" -t "$pkgdir/usr/share/libalpm/hooks"
  cd "$_pkgname"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
}
