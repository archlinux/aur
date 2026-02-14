# Maintainer: thadah <thadahdenyse@protonmail.com>
pkgname=commet-git
pkgver=0.4.0.r21.g37a9fdd5
pkgrel=1
pkgdesc="A client for Matrix focused on providing a feature rich experience while maintaining a simple interface"
url="https://commet.chat"
license=('AGPL-3.0-only')
arch=('x86_64')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'fontconfig'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'harfbuzz'
  'libdrm'
  'libepoxy'
  'libsoup3'
  'libx11'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxrandr'
  'mesa'
  'mpv'
  'pango'
  'webkit2gtk-4.1'
  'zlib'
)
makedepends=(
  'cmake'
  'dart'
  'flutter'
  'git'
  'mimalloc'
  'ninja'
)
provides=('commet')
conflicts=('commet' 'commet-bin')
source=("${pkgname}::git+https://github.com/commetchat/commet.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}/commet"

  dart run scripts/codegen.dart

  # Remove -Werror from CMakeLists.txt (applied to plugins, causes build failure)
  sed -i 's/-Wall -Werror/-Wall/' linux/CMakeLists.txt

  # Build
  export COMMET_PROD=1 # Production mode
  local _hash
  _hash=$(git -C "${srcdir}/${pkgname}" rev-parse HEAD)

  flutter build linux \
    --release \
    --dart-define BUILD_MODE=release \
    --dart-define PLATFORM=linux \
    --dart-define "GIT_HASH=${_hash}" \
    --dart-define "VERSION_TAG=v${pkgver}"
}

package() {
  cd "${pkgname}/commet"

  # Bundle file
  install -dm755 "${pkgdir}/usr/lib/chat.commet.commetapp"
  cp -a build/linux/x64/release/bundle/* "${pkgdir}/usr/lib/chat.commet.commetapp/"

  # Desktop and icons
  install -Dm644 linux/debian/usr/share/applications/chat.commet.commetapp.desktop \
    "${pkgdir}/usr/share/applications/chat.commet.commetapp.desktop"

  for size in 16 32 64 128 256 512; do
    install -Dm644 "linux/debian/usr/share/icons/hicolor/${size}x${size}/apps/commet-desktop.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/commet-desktop.png"
  done

  # Create symlink in /usr/bin
  install -dm755 "${pkgdir}/usr/bin"
  ln -s /usr/lib/chat.commet.commetapp/commet "${pkgdir}/usr/bin/commet"
}
