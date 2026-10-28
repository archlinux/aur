# Maintainer: tux_peng <jpenguin@fastmail.com>
# Personal-use packaging recipe. Check per-font licenses before redistribution.

pkgname=ttf-niek-fonts-mac
pkgver=2.8
pkgrel=2
pkgdesc="Font collection from Niek's fonts-extractor (mac) archive"
arch=('any')
url="https://github.com/Niek/fonts-extractor"
license=('custom:upstream-font-licenses')
depends=('fontconfig')
makedepends=('python-fonttools')
source=("fonts-mac-$pkgver.zip::https://github.com/Niek/fonts-extractor/releases/download/v${pkgver}/fonts-mac.zip"
        'clean-font-names.py')
noextract=("fonts-mac-$pkgver.zip")
sha256sums=('6ae7ff7cfef557675108b7447fab8848497dbadc7a788909feeba234be3701aa'
            'SKIP')

prepare() {
  rm -rf archive
  mkdir -p archive
  bsdtar -xf "fonts-mac-$pkgver.zip" -C archive
}

build() {
  cd "$srcdir/archive"

  # Fail early if the archive layout changed
  if [[ -z $(find . -type f \( -iname '*.ttf' -o -iname '*.otf' \
        -o -iname '*.ttc' -o -iname '*.otc' \) -print -quit) ]]; then
    echo "ERROR: no font files found in archive" >&2
    return 1
  fi

  # Remove dot-prefixed family-name records from font metadata
  python "$srcdir/clean-font-names.py" .
}

package() {
  cd "$srcdir/archive"
  local font_dir="$pkgdir/usr/share/fonts/$pkgname"
  local f dir base

  # Fonts. Leading dots are stripped from file names too, since fontconfig
  # ignores hidden files.
  while IFS= read -r -d '' f; do
    dir=${f%/*}
    base=${f##*/}
    while [[ $base == .* ]]; do base=${base#.}; done
    [[ -n $base ]] || continue
    install -Dm644 "$f" "$font_dir/$dir/$base"
  done < <(find . -type f \
    \( -iname '*.ttf' -o -iname '*.otf' -o -iname '*.ttc' -o -iname '*.otc' \) -print0)

  # License/notice files
  while IFS= read -r -d '' f; do
    install -Dm644 "$f" "$pkgdir/usr/share/licenses/$pkgname/$f"
  done < <(find . -type f \
    \( -iname 'license*' -o -iname 'licence*' -o -iname 'copyright*' \
       -o -iname 'notice*' -o -iname 'readme*' \) -print0)
}
