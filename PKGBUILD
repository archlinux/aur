# Maintainer: Card38753 <cccc38753@gmail.com>
pkgname=lazytyper-bin
_pkgname=LazyTyper
pkgver=1.8.4
pkgrel=1
pkgdesc="LazyTyper 桌面客户端（官方 AppImage 重打包，含内置依赖）"
arch=('x86_64')
url="https://lazytyper.com"
_ghurl="https://github.com/oldcai/LazyTyper-releases"
license=('proprietary')
depends=()
provides=("lazytyper=${pkgver}")
conflicts=('lazytyper' 'lazytyper-git' 'lazytyper-appimage')
options=(!strip)
source=("${_pkgname}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}-linux/LazyTyper-x86_64.AppImage")
sha256sums=('3407ba1def04dde0534e67c253a78f34b0ba3f738d10f43a17d04d3570fac7f5')

build() {
  cd "$srcdir"
  rm -rf squashfs-root
  chmod +x "${_pkgname}-${pkgver}.AppImage"
  "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
  cd "$srcdir"

  install -d "$pkgdir/opt/$pkgname"
  cp -a squashfs-root/* "$pkgdir/opt/$pkgname/"

  install -d "$pkgdir/usr/bin"
  cat >"$pkgdir/usr/bin/lazytyper" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
APPDIR="/opt/lazytyper-bin"
export APPDIR
export WEBKIT_EXEC_PATH="${APPDIR}/usr/lib/x86_64-linux-gnu/webkit2gtk-4.1"
export LD_LIBRARY_PATH="${APPDIR}/usr/lib:${APPDIR}/usr/lib/x86_64-linux-gnu:${LD_LIBRARY_PATH:-}"
exec "${APPDIR}/AppRun" "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/lazytyper"

  install -Dm644 squashfs-root/usr/share/applications/LazyTyper.desktop \
    "$pkgdir/usr/share/applications/lazytyper.desktop"
  sed -i 's|^Exec=.*|Exec=/usr/bin/lazytyper|' \
    "$pkgdir/usr/share/applications/lazytyper.desktop"
  sed -i 's|^Icon=.*|Icon=lazytyper|' \
    "$pkgdir/usr/share/applications/lazytyper.desktop"
  if ! grep -q '^Categories=' "$pkgdir/usr/share/applications/lazytyper.desktop"; then
    echo 'Categories=Utility;' >>"$pkgdir/usr/share/applications/lazytyper.desktop"
  fi

  if [ -f squashfs-root/usr/share/icons/hicolor/128x128/apps/LazyTyper.png ]; then
    install -Dm644 squashfs-root/usr/share/icons/hicolor/128x128/apps/LazyTyper.png \
      "$pkgdir/usr/share/icons/hicolor/128x128/apps/lazytyper.png"
  fi
  if [ -f squashfs-root/usr/share/icons/hicolor/256x256@2/apps/LazyTyper.png ]; then
    install -Dm644 squashfs-root/usr/share/icons/hicolor/256x256@2/apps/LazyTyper.png \
      "$pkgdir/usr/share/icons/hicolor/512x512/apps/lazytyper.png"
  fi

  install -d "$pkgdir/usr/lib/x86_64-linux-gnu"
  ln -sf "/opt/$pkgname/usr/lib/x86_64-linux-gnu/webkit2gtk-4.1" \
    "$pkgdir/usr/lib/x86_64-linux-gnu/webkit2gtk-4.1"
}
