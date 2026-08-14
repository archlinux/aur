# Maintainer: Pouria Rezaei <Pouria.rz@outlook.com>

pkgname=noto-fonts-full
pkgver=2026.08.01
pkgrel=1
pkgdesc='Google Noto TTF fonts, additional variants, CJK collections, and color emoji'
arch=(any)
url='https://fonts.google.com/noto'
license=(OFL-1.1-no-RFN OFL-1.1)
makedepends=(tar unzip)
provides=(
  ttf-font
  emoji-font
  "noto-fonts=1:$pkgver"
  "noto-fonts-extra=1:$pkgver"
  'noto-fonts-cjk=20240730'
  'noto-fonts-emoji=1:2.051'
  'noto-fonts-main=2:20241122'
)
conflicts=(
  noto-fonts
  noto-fonts-extra
  noto-fonts-cjk
  noto-fonts-emoji
)
replaces=(
  noto-fonts
  noto-fonts-extra
  noto-fonts-cjk
  noto-fonts-emoji
)

_cjk_serif_ver=2.003
_cjk_sans_ver=2.004
_emoji_ver=2.051

source=(
  "notofonts.tar.gz::https://github.com/googlefonts/noto-emoji/archive/refs/tags/v${_emoji_ver}.tar.gz"
  "noto-emoji.tar.gz::https://github.com/notofonts/notofonts.github.io/archive/refs/tags/noto-monthly-release-${pkgver}.tar.gz"
  "noto-serif-cjk.zip::https://github.com/notofonts/noto-cjk/releases/download/Serif${_cjk_serif_ver}/04_NotoSerifCJKOTC.zip"
  "noto-sans-cjk.zip::https://github.com/notofonts/noto-cjk/releases/download/Sans${_cjk_sans_ver}/03_NotoSansCJK-OTC.zip"
  46-noto-mono.conf
  46-noto-sans.conf
  46-noto-serif.conf
  58-noto-mono-default-monospace.conf
  59-noto-sans-default-sans.conf
  59-noto-serif-default-serif.conf
  66-noto-color-emoji.conf
)
noextract=(
  notofonts.tar.gz
  noto-emoji.tar.gz
  noto-serif-cjk.zip
  noto-sans-cjk.zip
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'f5c09b37280d7569b6c99a78511639be4ae25b8c5406464422fe0421fe13a884'
  '83a8faf6a47954075f97a2d555048e2a6689c38603b2ca00150157bf645f4593'
  'c94368b24506770767d003e5bcba589a8e402e489c240ee52453bf3ac7e9b5fa'
  '4526289f59654e2a81dc734669a1ae4e416f9a56d0896ec3741c6bf065baf8a8'
  '52684bebf6447be22618d2a04ff37623ec92f9d8ccf6b6f972e5bcbcfee90d69'
  '4459944b63dc083107280f5d7375c69746bf80a09416a4a4909a100e58e5a33a'
  '3e78745e1979cbfc965f249d34c65bb0f077d044af6b231c1ae8293b697353cb'
)

prepare() {
  rm -rf \
    "$srcdir/notofonts-source" \
    "$srcdir/noto-emoji-source" \
    "$srcdir/noto-serif-cjk" \
    "$srcdir/noto-sans-cjk"

  mkdir -p \
    "$srcdir/notofonts-source" \
    "$srcdir/noto-emoji-source" \
    "$srcdir/noto-serif-cjk" \
    "$srcdir/noto-sans-cjk"

  tar -xzf "$srcdir/notofonts.tar.gz" --strip-components=1 -C "$srcdir/noto-emoji-source"
  tar -xzf "$srcdir/noto-emoji.tar.gz" --strip-components=1 -C "$srcdir/notofonts-source"

  unzip -q "$srcdir/noto-serif-cjk.zip" -d "$srcdir/noto-serif-cjk"
  unzip -q "$srcdir/noto-sans-cjk.zip" -d "$srcdir/noto-sans-cjk"
}

package() {
  # Base Noto fonts plus the variants formerly split into noto-fonts-extra.
  install -Dm644 "$srcdir"/notofonts-source/fonts/*/hinted/ttf/*.tt[fc] \
    -t "$pkgdir"/usr/share/fonts/noto

  # Unique aggregate Noto families shipped by the monthly release outside
  # fonts/*/hinted/ttf. These are not duplicate hinted/unhinted/variable builds.
  install -Dm644 "$srcdir"/notofonts-source/megamerge/*.ttf \
    -t "$pkgdir"/usr/share/fonts/noto

  # CJK Serif and Sans OTC collections.
  install -Dm644 "$srcdir"/noto-serif-cjk/OTC/*.ttc \
    "$srcdir"/noto-sans-cjk/*.ttc \
    -t "$pkgdir"/usr/share/fonts/noto-cjk

  # Noto Emoji.
  install -Dm644 "$srcdir"/noto-emoji-source/fonts/NotoColorEmoji.ttf \
    -t "$pkgdir"/usr/share/fonts/noto

  # Licenses from every bundled upstream source.
  install -Dm644 "$srcdir"/notofonts-source/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 "$srcdir"/noto-serif-cjk/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-CJK-Serif
  install -Dm644 "$srcdir"/noto-sans-cjk/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-CJK-Sans
  install -Dm644 "$srcdir"/noto-emoji-source/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-Emoji

  # Fontconfig aliases and defaults for Sans, Serif, Mono, and Emoji.
  install -Dm644 "$srcdir"/*.conf \
    -t "$pkgdir"/usr/share/fontconfig/conf.avail
  install -d "$pkgdir"/usr/share/fontconfig/conf.default
  ln -rs "$pkgdir"/usr/share/fontconfig/conf.avail/* \
    "$pkgdir"/usr/share/fontconfig/conf.default
}
