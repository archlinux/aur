# Maintainer: Antonio Voza <vozaanthony {at} gmail {dot} com>
pkgname=nerd-fonts-noto-sans-mono
pkgver=3.2.1
pkgrel=1
pkgdesc="Noto Sans Mono fonts, patched with Nerd Fonts Patcher"
arch=('any')
url='https://github.com/ryanoasis/nerd-fonts'
license=('OFL-1.1')
makedepends=('python' 'fontforge' 'parallel')
source=("https://github.com/notofonts/latin-greek-cyrillic/releases/download/NotoSansMono-v2.014/NotoSansMono-v2.014.zip"
        "font-patcher-$pkgver::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/FontPatcher.zip")
sha512sums=('a7bda86990d13cfffbb8bd3edadb19348a1db20349af3cbaedf478e4cb8e30f486c24f40d8f9e3b690267295e882909420bae3c34edc8cb2e693f61f55e74f4d'
            '1def6b9fd7802fba21fb7c56757272facc967fffa7391ccbd21113d457185bf1005769b611ba419797f262a5ec89ae3b9c266f858a68221a1ed73e52fc0b98fc')

build() {
  # patch fonts
  mkdir -p "$srcdir/patched"
  printf "%b" "\e[1;33m==> WARNING: \e[0mNow patching all fonts. This will take very long...\n"
  # patch fonts quiet with complete single-width glyphs
  parallel -j$(nproc) python font-patcher --glyphdir "$srcdir/src/glyphs/" -q -c -s {} -out "$srcdir/patched" ::: "$srcdir/NotoSansMono/hinted/ttf"/*.ttf
}

package() {
  # install fonts
  install -d "$pkgdir/usr/share/fonts/NotoSansMono"
  install -m644 "patched"/*.ttf "$pkgdir/usr/share/fonts/NotoSansMono/"
}
