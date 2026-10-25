pkgname=nerd-fonts-apple
pkgver=3.5.1
pkgrel=2
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
sha256sums=('968ab3b8b1f92c2d8af61eb0680f5c2224c4e78d59b986bf004502a7fc012918'
            'c1d0e344ebadd66eb62f03f823784cce49f1787f56563fb098fca01fc554135c'
            '6d4a0b78e3aacd06f913f642cead1c7db4af34ed48856d7171a2e0b55d9a7945'
            '2760c62d502b77012c49517c2ea392ec2d4c647fe060985c927df48d105197b9'
            '1c2eedb4526cc0f326f8b7ea978f5a433756476a2c8c56072537608edb88f8f4'
            '42bcb32145499a35732274c7fc48deb434ad0d2e0e118f98527c1479c6fa251a')

build() {
  local pwd="$(pwd)"
  for archive in *.dmg; do
    echo "unpack and patch: $archive"
    7z x $archive &>/dev/null
    local fontDir="$(echo $archive | cut -d. -f1 | tr -d '-')Fonts"
    local pkgArchive="$(echo $archive | cut -d. -f1 | sed -r 's/-/ /g') Fonts.pkg"
    local payload="${fontDir}.pkg/Payload"
    cd -- "$srcdir/"*"$fontDir"
    bsdtar xvPf "$pkgArchive" &>/dev/null
    bsdtar xvPf "$payload" &>/dev/null
    case $archive in
      *Mono* ) find -name *.ttf -o -name *.otf -print0 | parallel -j$(nproc) -0 python "$srcdir/font-patcher" -q -c -s {} -out "$srcdir/patched" &>/dev/null
               ;;
      *      ) find -name *.ttf -o -name *.otf -print0 | parallel -j$(nproc) -0 python "$srcdir/font-patcher" -q -c {} -out "$srcdir/patched" &>/dev/null
               ;;
    esac
    cd -- "$pwd"
  done
}

package() {
  install -d "$pkgdir/usr/share/fonts/apple"
  install -m644 "patched/"*.otf "$pkgdir/usr/share/fonts/apple"
}
