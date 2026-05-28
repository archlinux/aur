# Maintainer: zapret-gui maintainers
pkgname=zapret-gui
pkgver=1.0.0
pkgrel=4
pkgdesc="GUI for zapret DPI bypass with Linux NFQUEUE/nftables runtime"
arch=("x86_64")
url="https://github.com/Mechtaatel/zapret-gui"
license=("GPL3")
depends=(
  "python"
  "python-pyqt6"
  "python-pyqt6-fluent-widgets"
  "python-psutil"
  "python-requests"
  "python-urllib3"
  "python-pysocks"
  "python-cryptography"
  "python-aiohttp"
  "python-websockets"
  "python-qtawesome"
  "python-httpx"
  "qt6-svg"
  "nftables"
  "polkit"
  "luajit"
  "libnetfilter_queue"
  "libnfnetlink"
  "libmnl"
  "zlib"
  "libcap"
)
makedepends=(
  "base-devel"
  "git"
)
optdepends=(
  "sudo: fallback elevation if pkexec is unavailable"
)
source=(
  "zapret-gui::git+https://github.com/Mechtaatel/zapret-gui.git"
  "zapret2::git+https://github.com/bol-van/zapret2.git"
)
sha256sums=("SKIP" "SKIP")

build() {
  cd "$srcdir/zapret2/nfq2"
  make nfqws2
}

package() {
  cd "$srcdir/zapret-gui"

  install -dm755 "$pkgdir/usr/lib/zapret-gui"
  cp -a src "$pkgdir/usr/lib/zapret-gui/src"
  rm -rf "$pkgdir/usr/lib/zapret-gui/src/dist"
  # Генерируем build_info.py (gitignored, нет в репозитории)
  cat > "$pkgdir/usr/lib/zapret-gui/src/config/build_info.py" << 'EOF'
CHANNEL='stable'
APP_VERSION='1.0.0'
EOF
  if [[ -d src/lists ]]; then
    cp -a src/lists "$pkgdir/usr/lib/zapret-gui/lists"
  fi
  if [[ -d src/lua ]]; then
    cp -a src/lua "$pkgdir/usr/lib/zapret-gui/lua"
  fi
  if [[ -d src/presets ]]; then
    cp -a src/presets "$pkgdir/usr/lib/zapret-gui/presets"
  fi

  install -Dm755 "$srcdir/zapret2/nfq2/nfqws2" \
    "$pkgdir/usr/lib/zapret-gui/exe/nfqws2"

  if [[ -x "$srcdir/zapret2/nfq/nfqws" ]]; then
    install -Dm755 "$srcdir/zapret2/nfq/nfqws" \
      "$pkgdir/usr/lib/zapret-gui/exe/nfqws"
  elif [[ -x "$srcdir/zapret2/nfq2/nfqws2" ]]; then
    install -Dm755 "$srcdir/zapret2/nfq2/nfqws2" \
      "$pkgdir/usr/lib/zapret-gui/exe/nfqws"
  fi

  install -Dm755 "$srcdir/zapret-gui/packaging/linux/zapret-gui" \
    "$pkgdir/usr/bin/zapret-gui"
  install -Dm644 "$srcdir/zapret-gui/packaging/linux/zapret-gui.desktop" \
    "$pkgdir/usr/share/applications/zapret-gui.desktop"
}
