# Maintainer: secureNqwer
pkgname=zerolink
pkgver=1.2.0
pkgrel=1
pkgdesc="Secure P2P Messenger with ZeroTier network"
arch=("x86_64" "aarch64")
url="https://github.com/secureNqwer/zerolink"
license=("MIT")
depends=("glibc" "gcc-libs" "hicolor-icon-theme")
makedepends=("go" "git" "cmake" "make" "base-devel")
optdepends=("webkit2gtk: for native desktop GUI (zerolink -gui)")
provides=("zerolink")
conflicts=("zerolink-bin")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=("SKIP")

build() {
  cd "$srcdir/zerolink-$pkgver"
  bash scripts/build_libzt.sh
  # Create webkit2gtk-4.0 alias if only 4.1 is available
  if ! pkg-config --exists webkit2gtk-4.0 2>/dev/null; then
    export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$(pwd)/.pkgconfig"
    mkdir -p .pkgconfig
    pc=$(pkg-config --path webkit2gtk-4.1 2>/dev/null)
    [ -n "$pc" ] && ln -sf "$pc" .pkgconfig/webkit2gtk-4.0.pc
  fi
  make client 2>/dev/null || make client
}

package() {
  cd "$srcdir/zerolink-$pkgver"
  install -Dm755 bin/zerolink "$pkgdir/usr/bin/zerolink"
  install -Dm644 icons/zerolink.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/zerolink.png"
  install -Dm644 zerolink.desktop.in "$pkgdir/usr/share/applications/zerolink.desktop"
  sed -i "s|EXEC|/usr/bin/zerolink|g; s|ICON|zerolink|g" "$pkgdir/usr/share/applications/zerolink.desktop"
}
