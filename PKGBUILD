pkgname=nerd-fonts-apple
pkgver=3.5.1
pkgrel=3
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
  mkdir -p "$srcdir/patched"
  for archive in *.dmg; do
    echo "unpack and patch: $archive"    
    local workdir="$srcdir/work_${archive%.dmg}"
    mkdir -p "$workdir"
    7z x -y "$archive" -o"$workdir" &>/dev/null
    local pkgFile
    pkgFile=$(find "$workdir" -type f -name "*.pkg" | head -n 1)
    
    if [[ -z "$pkgFile" ]]; then
      echo "Kon geen .pkg vinden in $archive"
      return 1
    fi
    mkdir -p "$workdir/extracted"
    bsdtar -xf "$pkgFile" -C "$workdir/extracted"
    local payloadFile
    payloadFile=$(find "$workdir/extracted" -type f -name "Payload" | head -n 1)
    bsdtar -xf "$payloadFile" -C "$workdir/extracted"
    case $archive in
      *Mono* ) 
        find "$workdir/extracted" -type f \( -name "*.ttf" -o -name "*.otf" \) -print0 | \
          parallel -j"$(nproc)" -0 python "$srcdir/font-patcher" -q -c -s {} -out "$srcdir/patched" &>/dev/null
        ;;
      * ) 
        find "$workdir/extracted" -type f \( -name "*.ttf" -o -name "*.otf" \) -print0 | \
          parallel -j"$(nproc)" -0 python "$srcdir/font-patcher" -q -c {} -out "$srcdir/patched" &>/dev/null
        ;;
    esac
  done
}

package() {
  install -d "$pkgdir/usr/share/fonts/apple"
  install -m644 "$srcdir/patched/"*.{otf,ttf} "$pkgdir/usr/share/fonts/apple/" 2>/dev/null || true
}
