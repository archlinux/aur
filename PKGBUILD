# Maintainer: tux_peng <jpenguin@fastmail.com>
# Personal-use packaging recipe. Check per-font licenses before redistribution.

pkgname=ttf-niek-fonts-office
pkgver=2.8
pkgrel=1
pkgdesc="Font collection from Niek's fonts-extractor (office) archive"
arch=('any')
url="https://github.com/Niek/fonts-extractor"
license=('custom:upstream-font-licenses')
depends=('fontconfig')
source=("fonts-office-$pkgver.zip::https://github.com/Niek/fonts-extractor/releases/download/v${pkgver}/fonts-office.zip")
noextract=("fonts-office-$pkgver.zip")
sha256sums=('cd8c1877f24996a1451686d4841a3b13f0445b7bd194484d6ad1b42af1720e16')

prepare() {
  mkdir -p archive
  bsdtar -xf "fonts-office-$pkgver.zip" -C archive
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
