# Maintainer: Josh Dye <jpenguin@duck.com>
#
# Fonts are downloaded from Apple at build time. Apple's license does not
# allow redistributing the font files, so share this recipe, NOT the built
# package.

pkgname=apple-sf-fonts
pkgver=2026.01.20
pkgrel=3
pkgdesc="Apple San Francisco, SF Compact, SF Mono, New York, and regional fonts"
arch=('any')
url="https://developer.apple.com/fonts/"
license=('LicenseRef-Apple-SF-Fonts')
makedepends=('7zip' 'libarchive' 'python-fonttools')

_dl=https://devimages-cdn.apple.com/design/resources/download
_dmgs=(SF-Pro SF-Compact SF-Mono NY SF-Arabic SF-Armenian SF-Georgian SF-Hebrew)

source=("extract-dmg.sh"
        "clean-font-names.py")
noextract=()
sha256sums=('dcd1091cb6a61ef98996aaa9c3025b3b7dd661d1486a39078d0e975264a45bd6'
            '531e909a71e8e04e002c643a03dc8f77d7eff9853a94623329bc3aad4d2b0333')
for _d in "${_dmgs[@]}"; do
  source+=("$_d.dmg::$_dl/$_d.dmg")
  noextract+=("$_d.dmg")
  sha256sums+=('SKIP')   # Apple URLs are unversioned; pin after downloading
done

build() {
  local d
  rm -rf extracted
  for d in "${_dmgs[@]}"; do
    bash "$srcdir/extract-dmg.sh" "$srcdir/$d.dmg" "$srcdir/extracted/$d"
  done

  if [[ -z $(find extracted -type f \( -iname '*.ttf' -o -iname '*.otf' -o -iname '*.ttc' \) -print -quit) ]]; then
    echo "ERROR: no font files found after extraction" >&2
    return 1
  fi

  # Strip leading dots from family/PostScript names (fontconfig and some apps
  # treat dot-prefixed names as hidden)
  python "$srcdir/clean-font-names.py" extracted
}

package() {
  local f
  while IFS= read -r -d '' f; do
    install -Dm644 "$f" "$pkgdir/usr/share/fonts/$pkgname/${f##*/}"
  done < <(find "$srcdir/extracted" -type f \
    \( -iname '*.ttf' -o -iname '*.otf' -o -iname '*.ttc' \) -print0)
}
