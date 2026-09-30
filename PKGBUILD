# Maintainer: Hong Shick Pak <hong@hspak.com>

pkgname=zimbr
pkgver=0.3.0
pkgrel=1
pkgdesc="Native Wayland iMessage client using a self-hosted macOS relay"
arch=("x86_64")
url="https://github.com/hspak/zimbr"
license=("MIT" "Zlib")
depends=(
  "cairo"
  "curl"
  "glib2"
  "glibc"
  "harfbuzz"
  "libglvnd"
  "libjpeg-turbo"
  "libpng"
  "libxkbcommon"
  "openssl"
  "openssh"
  "pango"
  "python"
  "python-cryptography"
  "sqlite"
  "wayland"
)
makedepends=("git" "librsvg" "zig>=0.16.0" "zig<0.17")
checkdepends=("desktop-file-utils")
optdepends=(
  "libdecor: client-side window decorations on Wayland"
  "noto-fonts-emoji: emoji rendering"
  "notification-daemon: desktop notifications"
  "ttf-font: text rendering"
)
options=("!debug")
# release.sh pins the version and source checksum before building or publishing.
_ref=0.3.0
source=("$pkgname-$_ref.tar.gz::$url/archive/$_ref.tar.gz")
sha256sums=("03cf090eb9bb8ab6c405849fdd2c4f6c5f09656b1da2330f8791751f397933dd")

prepare() {
  cd "$pkgname-$_ref"
  export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-cache"
  zig build -Dprofile=release client --fetch=all -Doptimize=ReleaseSafe -Dcpu=baseline
}

build() {
  cd "$pkgname-$_ref"
  export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-cache"
  zig build -Dprofile=release client -Doptimize=ReleaseSafe -Dcpu=baseline \
    --system zig-pkg

  # Bake SVG lighting into PNG fallbacks for desktop icon renderers.
  local size
  for size in 16 24 32 48 64 128 256 512; do
    mkdir -p "zig-out/share/icons/hicolor/${size}x${size}/apps"
    rsvg-convert --width "$size" --height "$size" packaging/linux/zimbr.svg \
      --output "zig-out/share/icons/hicolor/${size}x${size}/apps/zimbr.png"
  done
}

check() {
  cd "$pkgname-$_ref"
  export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-cache"
  zig build -Dprofile=release test-client -Doptimize=ReleaseSafe -Dcpu=baseline \
    --system zig-pkg
  desktop-file-validate zig-out/share/applications/zimbr.desktop
  python packaging/linux/provision.py --help >/dev/null
  python packaging/linux/provision.py setup --help >/dev/null
}

package() {
  cd "$pkgname-$_ref"
  install -Dm755 zig-out/bin/zimbr "$pkgdir/usr/bin/zimbr"
  install -Dm755 packaging/linux/provision.py "$pkgdir/usr/bin/zimbr-provision"
  install -Dm644 zig-out/share/applications/zimbr.desktop \
    "$pkgdir/usr/share/applications/zimbr.desktop"
  install -Dm644 packaging/linux/zimbr.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/zimbr.svg"

  local size license_file dependency
  for size in 16 24 32 48 64 128 256 512; do
    install -Dm644 "zig-out/share/icons/hicolor/${size}x${size}/apps/zimbr.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/zimbr.png"
  done
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # Preserve dependency notices alongside the statically linked code.
  for license_file in zig-pkg/*/LICENSE zig-pkg/*/LICENSE.md; do
    [[ -f $license_file ]] || continue
    dependency=${license_file%/*}
    dependency=${dependency##*/}
    install -Dm644 "$license_file" \
      "$pkgdir/usr/share/licenses/$pkgname/dependencies/$dependency/${license_file##*/}"
  done
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -d "$pkgdir/usr/share/doc/$pkgname/docs"
  install -m644 docs/*.md "$pkgdir/usr/share/doc/$pkgname/docs/"
}

# vim: ft=sh syn=sh et
