# Maintainer: tux_peng <jpenguin@fastmail.com>
# Personal-use packaging recipe for the upstream font archive.
# Check the archive's font-by-font licenses before redistribution.

pkgname=ttf-niek-fonts-mac
pkgver=2.8
pkgrel=1
pkgdesc="Font collection from Niek's fonts-extractor (mac) archive"
arch=('any')
url="https://github.com/Niek/fonts-extractor/releases/tag/v${pkgver}"
license=('custom:upstream-font-licenses')
depends=('fontconfig')
makedepends=('unzip')
source=("https://github.com/Niek/fonts-extractor/releases/download/v${pkgver}/fonts-mac.zip")
sha256sums=('6ae7ff7cfef557675108b7447fab8848497dbadc7a788909feeba234be3701aa')

prepare() {
  mkdir -p archive
  bsdtar -xf "fonts-mac-$pkgver.zip" -C archive
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
