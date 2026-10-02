# Maintainer: Hong Shick Pak <hong@hspak.com>

pkgname=zimbr
pkgver=0.4.1
pkgrel=1
pkgdesc="Native Wayland iMessage client using a self-hosted macOS relay"
arch=("x86_64")
url="https://github.com/hspak/zimbr"
license=("MIT" "Zlib")
depends=(
  "cairo"
  "curl"
  "dbus"
  "glib2"
  "glibc"
  "harfbuzz"
  "libjpeg-turbo"
  "libglvnd"
  "libpng"
  "libxkbcommon"
  "openssl"
  "openssh"
  "pango"
  "python"
  "python-cryptography"
  "sqlite"
  "vulkan-icd-loader"
  "wayland"
)
makedepends=("libdecor" "libibus" "librsvg" "patch" "pkgconf" "zig>=0.16.0" "zig<0.17")
checkdepends=("desktop-file-utils")
optdepends=(
  "ibus: input method support"
  "ibus-hangul: Korean input through IBus"
  "libdecor: client-side window decorations on Wayland"
  "noto-fonts-emoji: emoji rendering"
  "notification-daemon: desktop notifications"
  "ttf-font: text rendering"
  "vulkan-driver: hardware Vulkan rendering"
)
options=("!debug")
# release.sh pins the version and source checksum before building or publishing.
_ref=0.4.1
source=("$pkgname-$_ref.tar.gz::$url/archive/$_ref.tar.gz")
sha256sums=("58c387592b14d63320c9c1b09978dae54ec25dbc1a6b3f1d2642dada5347fbba")

prepare() {
  cd "$pkgname-$_ref"
  export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-cache"
  # --fetch=needed skips lazy dependencies without evaluating the build graph.
  # Help configures that graph and fetches its dependencies without running build steps.
  zig build -Dprofile=release client --help -Doptimize=ReleaseSafe -Dcpu=baseline \
    -Dibus=true >/dev/null
}

build() {
  cd "$pkgname-$_ref"
  export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-cache"
  zig build -Dprofile=release client -Doptimize=ReleaseSafe -Dcpu=baseline \
    -Dibus=true --system zig-pkg

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
    -Dibus=true --system zig-pkg
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

  local size license_file
  for size in 16 24 32 48 64 128 256 512; do
    install -Dm644 "zig-out/share/icons/hicolor/${size}x${size}/apps/zimbr.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/zimbr.png"
  done
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # Install only notices for dependencies linked into the client.
  for license_file in zig-out/share/zimbr/licenses/{SDL,SDL-yuv2rgb,gemoji}.txt; do
    install -Dm644 "$license_file" "$pkgdir/usr/share/licenses/$pkgname/${license_file##*/}"
  done
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -d "$pkgdir/usr/share/doc/$pkgname/docs"
  install -m644 docs/*.md "$pkgdir/usr/share/doc/$pkgname/docs/"
}

# vim: ft=sh syn=sh et
