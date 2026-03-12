# Maintainer: zen0x (amanchaitany@proton.me)

pkgname=abyssal-gtk-theme
pkgver=1.0.5
pkgrel=1
pkgdesc="Abyssal GTK theme (multiple palettes)"
arch=(any)
url="https://github.com/zen0x00/abyssal-gtk-theme"
license=(GPL-3.0-or-later)
depends=(gtk3 gtk4 libadwaita)
makedepends=(sassc)
options=(!strip)

source=("$pkgname-$pkgver.tar.gz::https://github.com/zen0x00/abyssal-gtk-theme/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

_palettes=(
  black
  e-ink
  dark
  nord
  everforest
  gruvbox
  tokyonight
  dracula
  catppuccin
  catppuccin-latte
)

build() {
  cd "$srcdir/abyssal-gtk-theme-$pkgver"

  for palette in "${_palettes[@]}"; do
    echo "@import \"../palettes/${palette}\";" > src/sass/_palette.scss

    sassc -M -t expanded src/main/gtk-3.0/gtk.scss "gtk-3.0-${palette}.css"
    sassc -M -t expanded src/main/gtk-4.0/gtk.scss "gtk-4.0-${palette}.css"
    sassc -M -t expanded src/main/libadwaita/libadwaita.scss "libadwaita-${palette}.css"
  done
}

package() {
  cd "$srcdir/abyssal-gtk-theme-$pkgver"

  for palette in "${_palettes[@]}"; do
    theme_name="Abyssal-${palette}"

    install -d "$pkgdir/usr/share/themes/${theme_name}"
    install -d "$pkgdir/usr/share/themes/${theme_name}/gtk-3.0"
    install -d "$pkgdir/usr/share/themes/${theme_name}/gtk-4.0"
    install -d "$pkgdir/usr/share/themes/${theme_name}/libadwaita"

    install -m644 "gtk-3.0-${palette}.css" \
      "$pkgdir/usr/share/themes/${theme_name}/gtk-3.0/gtk.css"

    install -m644 "gtk-4.0-${palette}.css" \
      "$pkgdir/usr/share/themes/${theme_name}/gtk-4.0/gtk.css"

    install -m644 "libadwaita-${palette}.css" \
      "$pkgdir/usr/share/themes/${theme_name}/libadwaita/libadwaita.css"

    install -m644 index.theme \
      "$pkgdir/usr/share/themes/${theme_name}/index.theme"
  done
}
