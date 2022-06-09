# Maintainer: Marc Schreiber <info@schrieveslaach.de>
pkgname=nerd-fonts-dm-mono
pkgdesc="DM Mono Font, patched with the Nerd Fonts Patcher"
url=https://github.com/googlefonts/dm-mono
_interver=1.000r5.57fadab
_nfver=2.2.0-RC
pkgver="${_interver}_${_nfver/-/_}"
pkgrel=1
source=()
sha256sums=()
arch=('any')
license=('custom:OTF')
makedepends=('fontforge' 'parallel' 'python')

source=(
   "https://raw.githubusercontent.com/googlefonts/dm-mono/main/exports/DMMono-Italic.ttf"
   "https://raw.githubusercontent.com/googlefonts/dm-mono/main/exports/DMMono-Light.ttf"
   "https://raw.githubusercontent.com/googlefonts/dm-mono/main/exports/DMMono-LightItalic.ttf"
   "https://raw.githubusercontent.com/googlefonts/dm-mono/main/exports/DMMono-Medium.ttf"
   "https://raw.githubusercontent.com/googlefonts/dm-mono/main/exports/DMMono-MediumItalic.ttf"
   "https://raw.githubusercontent.com/googlefonts/dm-mono/main/exports/DMMono-Regular.ttf"
   "https://github.com/ryanoasis/nerd-fonts/releases/download/$_nfver/FontPatcher.zip"
   "99-scale-nerd-fonts-dm-mono.conf"
)
sha256sums=(
   '32b5bad9cbce64eac6d05c8abbeb619317f7e4cb354e1c33db761adbfaae1b16'
   'c7b3645dc8d28237317b4d017bc47b9ff09a7660758122dacb694a5a82552c24'
   '90216192555d56cd40857250bbd6d0e8130ddbd015992d584225d7f390849544'
   'fd327daf461db87b44a87def475d251bf03b997f7c07d9680592d75dbbfaad0b'
   'a3b2211bb9cf5c4fc1a0b487553e673a737c2270c59b86bf1e0b48c77e587aa2'
   '55b4c98f123daebb3ed27947ba47b2af00554fc6284d639a540bcef5e6258ad2'
   '69df3545b86dbea1702b9ec078920211463ebe0d30a3c693d616f24112796914'
   '725ac8f7ca26da83359e5795fb5958e4f22b5025aa1aa6b7d1b925992c66ecdf'
)
build() {
   cd "$srcdir"
   mkdir -p "$srcdir/patched"
   printf "%b" "\e[1;33m==> WARNING: \e[0mNow patching all fonts. This will take very long...\n"
   parallel -j$(nproc) python "$srcdir/font-patcher" -q -c {} -out "$srcdir/patched" &> /dev/null ::: "$srcdir"/*.ttf
}

package() {
   install -d "$pkgdir/usr/share/fonts/nerd-fonts-dm-mono"
   install -m644 "$srcdir/patched/"*.ttf "$pkgdir/usr/share/fonts/nerd-fonts-dm-mono/"

   install -d "$pkgdir/usr/share/fontconfig/conf.avail/"
   install -d "$pkgdir/usr/share/fontconfig/conf.default/"
   install -m644 "$srcdir/99-scale-nerd-fonts-dm-mono.conf" "$pkgdir/usr/share/fontconfig/conf.avail/"
   cd "$pkgdir/usr/share/fontconfig/conf.default/"
   ln -s ../conf.avail/99-scale-nerd-fonts-dm-mono.conf
}

