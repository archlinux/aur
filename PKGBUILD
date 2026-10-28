# Maintainer: tux_peng <jpenguin@fastmail.com>
# Personal-use packaging recipe. Check per-font licenses before redistribution.

pkgname=ttf-niek-fonts-android
pkgver=2.8
pkgrel=1
pkgdesc="Font collection from Niek's fonts-extractor (android) archive"
arch=('any')
url="https://github.com/Niek/fonts-extractor"
license=('custom:upstream-font-licenses')
depends=('fontconfig')
source=("fonts-android-$pkgver.zip::https://github.com/Niek/fonts-extractor/releases/download/v${pkgver}/fonts-android.zip")
noextract=("fonts-android-$pkgver.zip")
sha256sums=('2a6b28b9a840e3250fa7fa0dee54a5d6b3695533e14c182388caca88cca062c8')

prepare() {
  mkdir -p archive
  bsdtar -xf "fonts-android-$pkgver.zip" -C archive
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
