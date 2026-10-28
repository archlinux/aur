# Maintainer: tux_peng <jpenguin@fastmail.com>
# Personal-use packaging recipe. Check per-font licenses before redistribution.

pkgname=ttf-niek-fonts-win11
pkgver=2.8
pkgrel=1
pkgdesc="Font collection from Niek's fonts-extractor (win11) archive"
arch=('any')
url="https://github.com/Niek/fonts-extractor"
license=('custom:upstream-font-licenses')
depends=('fontconfig')
source=("fonts-win11-$pkgver.zip::https://github.com/Niek/fonts-extractor/releases/download/v${pkgver}/fonts-win11.zip")
noextract=("fonts-win11-$pkgver.zip")
sha256sums=('0807d2d1cd08a51ff29363b5411ddd4b78854b2a11b92b8b2fad111abcb9ca6e')

prepare() {
  mkdir -p archive
  bsdtar -xf "fonts-win11-$pkgver.zip" -C archive
}

package() {
  cd "$srcdir/archive"
  local font_dir="$pkgdir/usr/share/fonts/$pkgname"

  # Fonts
  while IFS= read -r -d '' f; do
    install -Dm644 "$f" "$font_dir/$f"
  done < <(find . -type f \
    \( -iname '*.ttf' -o -iname '*.otf' -o -iname '*.ttc' -o -iname '*.otc' \) -print0)

  # License/notice files
  while IFS= read -r -d '' f; do
    install -Dm644 "$f" "$pkgdir/usr/share/licenses/$pkgname/$f"
  done < <(find . -type f \
    \( -iname 'license*' -o -iname 'licence*' -o -iname 'copyright*' \
       -o -iname 'notice*' -o -iname 'readme*' \) -print0)

  # Fail if the layout changed and nothing was installed
  if [[ -z $(find "$font_dir" -type f -print -quit 2>/dev/null) ]]; then
    echo "ERROR: no font files found in archive" >&2
    return 1
  fi
}
