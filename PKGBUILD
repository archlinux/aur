# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ttf-adwaita-mono-nerd
pkgver=3.3.0
pkgrel=1
pkgdesc="Adwaita Mono patched with Nerd Fonts iconics"
arch=('any')
url="https://github.com/ryanoasis/nerd-fonts"
license=('GPL-3.0-or-later')
makedepends=(
  'fontforge'
  'parallel'
  'python'
  'ttf-adwaita-fonts'
)
source=("FontPatcher-$pkgver.zip::$url/releases/download/v$pkgver/FontPatcher.zip")
sha256sums=('ce4284e7d1a8816d29bb3a358e33a44e55804792e7925ed0022ba1b3ab1a9d34')

prepare() {
  mkdir -p "$srcdir/patched"
  mkdir -p "$srcdir/AdwaitaMono"
  cp -f /usr/share/fonts/Adwaita/AdwaitaMono-{Bold,BoldItalic,Italic,Regular}.ttf "$srcdir/AdwaitaMono"
}

build() {
  parallel -j$(nproc) python "$srcdir/font-patcher" -c {} -out "$srcdir/patched" ::: "$srcdir/AdwaitaMono"/*.ttf 
}

package() {
  install -Dm644 "$srcdir"/patched/*.ttf -t "$pkgdir/usr/share/fonts/Adwaita/"
}
