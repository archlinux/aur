# Maintainer: vlensys (contact me on github for wtv reason)
pkgname=lyricspot
pkgver=1.1.2
pkgrel=1
pkgdesc="Live synced lyrics in your terminal, pulled from Spotify"
arch=('any')
url="https://github.com/vlensys/lyricspot"
license=('MIT')
depends=('python' 'python-pipx')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vlensys/lyricspot/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('342ec482ba2a468451e600f3e18ed9c61d35f3d4fa046920afa383a28a1546a4')

package() {
  cd "${pkgname}-${pkgver}"

  # Install via pipx into the package directory
  PIPX_HOME="$pkgdir/opt/pipx" \
    PIPX_BIN_DIR="$pkgdir/usr/bin" \
    pipx install . \
    --pip-args="spotipy pillow colorthief" \
    --python python3

  # Fix shebangs and symlinks to use absolute paths (strip pkgdir prefix)
  local _shebang_fix="$pkgdir/usr/bin/lyricspot"
  if [ -f "$_shebang_fix" ]; then
    sed -i "s|$pkgdir||g" "$_shebang_fix"
  fi

  # Fix all absolute paths inside pipx venv that contain pkgdir
  find "$pkgdir/opt/pipx" -type f -name "*.py" -o -name "pyvenv.cfg" |
    xargs -I{} sed -i "s|$pkgdir||g" {} 2>/dev/null || true
}
