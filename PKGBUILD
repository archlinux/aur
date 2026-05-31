# Maintainer: Toria <ninetailedtori@uwu.gal
# Maintainer: Marc Schreiber <info@schrieveslaach.de>

pkgname=ttf-dm-mono-nerd-font-git
pkgdesc="DM Mono Font, patched with the Nerd Fonts Patcher"
url='https://github.com/googlefonts/dm-mono'
pkgver=1
pkgrel=1
arch=('any')
license=('OFL-1.1')
makedepends=('fontforge' 'parallel' 'python')
source=(
   "git+https://github.com/googlefonts/dm-mono.git"
   "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FontPatcher.zip"
   "99-scale-nerd-fonts-dm-mono.conf"
   "OFL-1.1.md"
)

pkgver() {
   cd       "${srcdir}/dm-mono"
   git      describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
   cd       "$srcdir"
   unzip    FontPatcher.zip -d font-patcher
}

build() {
   cd       "$srcdir"
   mkdir    -p "$srcdir/patched"
   printf   "%b" "\e[1;33m==> WARNING: \e[0mNow patching all fonts. This will take very long...\n"
   parallel -j$(nproc) python "$srcdir/font-patcher" -q -c {} -out "$srcdir/patched" &> /dev/null ::: "$srcdir"/*.ttf
}

package() {
   install  -d "$pkgdir/usr/share/fonts/nerd-fonts-dm-mono"
   install  -m644 "$srcdir/patched/"*.ttf "$pkgdir/usr/share/fonts/nerd-fonts-dm-mono/"

   install  -d "$pkgdir/usr/share/fontconfig/conf.avail/"
   install  -d "$pkgdir/usr/share/fontconfig/conf.default/"
   install  -m644 "$srcdir/99-scale-nerd-fonts-dm-mono.conf" "$pkgdir/usr/share/fontconfig/conf.avail/"
   cd       "$pkgdir/usr/share/fontconfig/conf.default/"
   ln       -s ../conf.avail/99-scale-nerd-fonts-dm-mono.conf
   install  -m644 "$srcdir/OFL-1.1.md" "$pkgdir/usr/share/$pkgname/LICENSE.md"
}

b2sums=('SKIP'
        'SKIP'
        'dd4c3c25322eed24889ce3e52737d0b309191d0f6306e576c1038c6b540774d753c3ba96a8060ec8d93550008b4b5cc3b6192c461b7b1506b78a829718e28ab1'
        '2a7c548714f95a2c0259ccdf14711838cd9e27a715ea3ee7be40e5a398f812fa7ed9c0b6621f01df60d59911bd13dccfb50a1e238f5edfb19d0695554c08111f')
sha512sums=('SKIP'
            'SKIP'
            'c3a2695d7d2de5fd0d53aa002db64ba921db9a2add7cc80b9b985bca18385c7e23e94d4a16d20368c2824835e53d3684e5c063bfaac9ca3817a9b0782bbc04ee'
            '4ceec46e1e4678eac5867fc4c705cd43933986f422de171118dddf1e3976374fcbe27a976626ee9e5e3b943ec19b48ebfcaab62f87a3ffd02741d31057706c68')
sha384sums=('SKIP'
            'SKIP'
            '20dddcd6b2dc010c9284c0e148e24287ff748a6e0dd97f901845eea747b7b3c6db7957871126eb7c0f0dc244ea1b14be'
            '09171982c2f7253acd3ea86bb4de6bab97dfcb101468efbe25d154497364639a2ecc9dca0e5b08379f9a163afbb802e9')
sha256sums=('SKIP'
            'SKIP'
            '725ac8f7ca26da83359e5795fb5958e4f22b5025aa1aa6b7d1b925992c66ecdf'
            '81e8d5af1bc349fb2f62fdfac449910109b2b6c659051f03988b4269fd535069')
