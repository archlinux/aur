# Maintainer: Josh Dye <jpenguin@duck.com>
pkgname=apple-sf-fonts
pkgver=2026.01.20
pkgrel=1
pkgdesc="Apple San Francisco, SF Compact, SF Mono, NY, and regional fonts"
arch=('any')
url="https://developer.apple.com/fonts/"
license=('custom')
depends=('p7zip' 'cpio')
source=(
  "SF-Pro.dmg::https://devimages-cdn.apple.com/design/resources/download/SF-Pro.dmg"
  "SF-Compact.dmg::https://devimages-cdn.apple.com/design/resources/download/SF-Compact.dmg"
  "SF-Mono.dmg::https://devimages-cdn.apple.com/design/resources/download/SF-Mono.dmg"
  "NY.dmg::https://devimages-cdn.apple.com/design/resources/download/NY.dmg"
  "SF-Arabic.dmg::https://devimages-cdn.apple.com/design/resources/download/SF-Arabic.dmg"
  "SF-Armenian.dmg::https://devimages-cdn.apple.com/design/resources/download/SF-Armenian.dmg"
  "SF-Georgian.dmg::https://devimages-cdn.apple.com/design/resources/download/SF-Georgian.dmg"
  "SF-Hebrew.dmg::https://devimages-cdn.apple.com/design/resources/download/SF-Hebrew.dmg"
)

# No checksums for brevity; add sha256sums in a real PKGBUILD
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
  # Nothing to prepare
  true
}

build() {
  # Helper to extract a font package from a dmg
  extract_font() {
    local dmg=$1
    local pkg_dir=$2
    local pkg_name=$3
    local payload_dir=$4

    # Extract the .pkg from the dmg
    7z e "$dmg" "$pkg_dir/$pkg_name.pkg"

    # Extract the Payload cpio archive from the .pkg
    7z e "$pkg_name.pkg" "$payload_dir/Payload"

    # Extract the actual font files
    7z x "./Payload"
    cpio -idv < "./Payload~"

    # Clean up temporary files
    rm -f ./Payload* ./Pay* "$pkg_name.pkg"
  }

  # SF Pro
  extract_font "SF-Pro.dmg" "SFProFonts" "SF Pro Fonts" "SFProFonts.pkg"

  # SF Compact
  extract_font "SF-Compact.dmg" "SFCompactFonts" "SF Compact Fonts" "SFCompactFonts.pkg"

  # SF Mono
  extract_font "SF-Mono.dmg" "SFMonoFonts" "SF Mono Fonts" "SFMonoFonts.pkg"

  # NY
  extract_font "NY.dmg" "NYFonts" "NY Fonts" "NYFonts.pkg"

  # Regional fonts
  extract_font "SF-Arabic.dmg" "SFArabicFonts" "SF Arabic Fonts" "SFArabicFonts.pkg"
  extract_font "SF-Armenian.dmg" "SFArmenianFonts" "SF Armenian Fonts" "SFArmenianFonts.pkg"
  extract_font "SF-Georgian.dmg" "SFGeorgianFonts" "SF Georgian Fonts" "SFGeorgianFonts.pkg"
  extract_font "SF-Hebrew.dmg" "SFHebrewFonts" "SF Hebrew Fonts" "SFHebrewFonts.pkg"
}

package() {
  # Install all extracted .ttf/.otf files into the package
  mkdir -p "$pkgdir/usr/share/fonts/AppleSF"
  install -Dm644 Library/Fonts/*.ttf Library/Fonts/*.otf "$pkgdir/usr/share/fonts/AppleSF/"

  # Optional: create a fontconfig cache at install time
  # (pacman will run fc-cache automatically)
}
