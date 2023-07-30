# Maintainer: Cauê Souza <souzacaue@proton.me>
pkgname=otf-commitmono-nerd-font
pkgdesc="Commit Mono Font, patched with the Nerd Fonts Patcher"
url=https://commitmono.com/
_interver=1.132
_nfver=v3.0.2
pkgver="${_interver}_${_nfver/-/_}"
pkgrel=1
sha256sums=("572b2c28d4d993ffe7323830fcab521e49a5db79fee1813debe5bdbe2b7cfcdb")
arch=('any')
license=('custom:OTF')
makedepends=('fontforge' 'parallel' 'python')

source=(
   "https://github.com/eigilnikolajsen/commit-mono/releases/download/$_interver/CommitMono-$_interver.zip"
   "https://github.com/ryanoasis/nerd-fonts/releases/download/$_nfver/FontPatcher.zip"
)
sha256sums=(
  "572b2c28d4d993ffe7323830fcab521e49a5db79fee1813debe5bdbe2b7cfcdb"
  "f52d7a5aecb88919fff54196845809861c41c6b0c742ccbabcd48e1c7686878e"
)

build() {
   cd "$srcdir"
   mkdir -p "$srcdir/patched"
   printf "%b" "\e[1;33m==> WARNING: \e[0mNow patching all fonts. This will take very long...\n"
   parallel -j$(nproc) fontforge --script "$srcdir/font-patcher" -q -c -out "$srcdir/patched" &> /dev/null ::: "$srcdir"/*.otf
}

package() {
    install -dm755 "$pkgdir/usr/share/fonts/OTF/"
    install -m644 "$srcdir/patched/"*.otf "$pkgdir/usr/share/fonts/OTF/"
}

