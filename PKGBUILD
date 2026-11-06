# Maintainer: sTiKyt <stikyt@proton.me>

pkgname=ttf-nanum
pkgver=20241017
pkgrel=1
pkgdesc="Naver Nanum fonts (TrueType)"
arch=('any')
url="https://hangeul.naver.com/font"
license=('OFL-1.1')
provides=('ttf-font')
conflicts=(
  'ttf-nanum-meta'
  'ttf-nanumgothic'
  'ttf-nanumgothic-eco'
  'ttf-nummyeongjo'
  'ttf-nummyeongjo-eco'
  'ttf-nummyeongjo-yethangul'
  'ttf-nanumbarungothic'
  'ttf-nanumbarungothic-yethangul'
  'ttf-nanumbarunpen'
  'ttf-nanumbrush'
  'ttf-nanumpen'
  'ttf-nanumsquare'
  'ttf-nanumsquareround'
  'ttf-nanumsquareneo'
  'ttf-nanumsquareneo-variable'
  'ttf-nanumhuman'
  'ttf-nanum-yethangul'
)

source=(
  "https://hangeul.pstatic.net/hangeul_static/webfont/zips/nanum-all_new.zip"
  "OFL.txt"
)
sha256sums=(
  '173fd24bf38914f385401f602572dca3481f7669966e91ad289066f719f6cc56'
  '65c23f0be72b06e4e77f273a399c24cb57a310fbe273cf4bd6dc10d4dff9c2ba'
)

package() {
  local fontdir="$pkgdir/usr/share/fonts/TTF"
  local count=0

  # The archive is nested per family and ships OTF/TTC variants, Apple
  # bookkeeping directories, and D2Coding, which has its own non-OFL license
  # and is packaged separately as ttf-d2coding. Install the Nanum TTFs only.
  while IFS= read -r -d '' file; do
    install -Dm644 "$file" "$fontdir/$(basename "$file")"
    count=$((count + 1))
  done < <(find "$srcdir" -type f -name '*.ttf' ! -path '*__MACOSX*' ! -path '*D2coding*' -print0)

  if (( count == 0 )); then
    echo "no Nanum TTF files found in \$srcdir - archive layout changed" >&2
    return 1
  fi

  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
