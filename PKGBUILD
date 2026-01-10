pkgname=nerd-fonts-apple
pkgver=3.4.0
pkgrel=1
arch=(any)
license=("custom")
pkgdesc="Apple font (San Francisco, NY), patched with the Nerd Fonts Patcher"
url="https://developer.apple.com/fonts/"
makedepends=("p7zip" "python" "parallel" "fontforge")
conflicts=("nerd-fonts-apple" "apple-fonts" "nerd-fonts-sf-mono")
provides=("nerd-fonts-apple" "ttf-font-nerd")
source=(
  "SF-Pro.${pkgver}.dmg::https://devimages-cdn.apple.com/design/resources/download/SF-Pro.dmg"
  "SF-Compact.${pkgver}.dmg::https://devimages-cdn.apple.com/design/resources/download/SF-Compact.dmg"
  "SF-Mono.${pkgver}.dmg::https://devimages-cdn.apple.com/design/resources/download/SF-Mono.dmg"
  "SF-Arabic.${pkgver}.dmg::https://devimages-cdn.apple.com/design/resources/download/SF-Arabic.dmg"
  "NY.${pkgver}.dmg::https://devimages-cdn.apple.com/design/resources/download/NY.dmg"

  "font-patcher-$pkgver::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/FontPatcher.zip"
)
sha256sums=('2e4d7853988b734dc1af33b921d8d4c0e4400eac312924a0eab4b73a51fd69ae'
            '08c34ffac2f99ec8702b4946044469f92dd88a7b1c0864e2d4b559565f8fb8e3'
            '6d4a0b78e3aacd06f913f642cead1c7db4af34ed48856d7171a2e0b55d9a7945'
            '2760c62d502b77012c49517c2ea392ec2d4c647fe060985c927df48d105197b9'
            '1c2eedb4526cc0f326f8b7ea978f5a433756476a2c8c56072537608edb88f8f4'
            'a8f11e511ed7c69e96680858c06b50a643ea7752e26d5cd13dd5e5cc53ab1760')

build() {
  local pwd="$(pwd)"
  for archive in *.dmg; do
    echo "unpack and patch: $archive"
    7z x $archive &>/dev/null
    local fontDir="$(echo $archive | cut -d. -f1 | tr -d '-')Fonts"
    local pkgArchive="$(echo $archive | cut -d. -f1 | sed -r 's/-/ /g') Fonts.pkg"
    local payload="${fontDir}.pkg/Payload"
    cd -- "$srcdir/$fontDir"
    bsdtar xvPf "$pkgArchive" &>/dev/null
    bsdtar xvPf "$payload" &>/dev/null
    case $archive in
      *Mono* ) find -name *.ttf -o -name *.otf -print0 | parallel -j$(nproc) -0 python "$srcdir/font-patcher" -q -c -s {} -out "$srcdir/patched" &>/dev/null
               ;;
      * ) find -name *.ttf -o -name *.otf -print0 | parallel -j$(nproc) -0 python "$srcdir/font-patcher" -q -c {} -out "$srcdir/patched" &>/dev/null
          ;;
    esac
    cd -- "$pwd"
  done
}

package() {
  install -d "$pkgdir/usr/share/fonts/apple"
  install -m644 "patched/"*.otf "$pkgdir/usr/share/fonts/apple"
}
