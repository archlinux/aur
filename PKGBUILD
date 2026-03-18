# Maintainer: zen0x (amanchaitany@proton.me)

pkgname=abyssal-gtk-theme
pkgver=1.0.5
pkgrel=2
pkgdesc="Abyssal GTK theme (multiple palettes)"
arch=(any)
url="https://github.com/zen0x00/abyssal-gtk-theme"
license=(GPL-3.0-or-later)
depends=(gtk3 gtk4 libadwaita)
makedepends=(sassc)
install=abyssal-gtk-theme.install
options=(!strip)

source=("$pkgname-$pkgver.tar.gz::https://github.com/zen0x00/abyssal-gtk-theme/archive/refs/tags/v$pkgver.tar.gz"
        "abyssal-theme")
sha256sums=('SKIP'
            'SKIP')

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

    sassc -M -t expanded src/main/gtk-3.0/gtk.scss        "gtk-3.0-${palette}.css"
    sassc -M -t expanded src/main/gtk-4.0/gtk.scss           "gtk-4.0-${palette}.css"
    sassc -M -t expanded src/main/libadwaita/libadwaita.scss   "libadwaita-${palette}.css"
    sassc -M -t expanded src/main/gnome-shell/gnome-shell.scss "gnome-shell-${palette}.css"

    sed "s/^Name=.*/Name=Abyssal-${palette}/" index.theme > "index-${palette}.theme"
  done
}

package() {
  cd "$srcdir/abyssal-gtk-theme-$pkgver"

  for palette in "${_palettes[@]}"; do
    theme_name="Abyssal-${palette}"
    theme_dir="$pkgdir/usr/share/themes/${theme_name}"

    install -d "${theme_dir}/gtk-3.0"
    install -d "${theme_dir}/gtk-4.0"
    install -d "${theme_dir}/gnome-shell"

    install -m644 "gtk-3.0-${palette}.css"    "${theme_dir}/gtk-3.0/gtk.css"
    install -m644 "gtk-4.0-${palette}.css"    "${theme_dir}/gtk-4.0/gtk.css"
    install -m644 "gnome-shell-${palette}.css" "${theme_dir}/gnome-shell/gnome-shell.css"
    install -m644 "libadwaita-${palette}.css" "${theme_dir}/gtk-4.0/libadwaita.css"

    # Assets (shared, not palette-specific)
    if [[ -d src/assets/gtk/assets ]]; then
      cp -r src/assets/gtk/assets "${theme_dir}/gtk-3.0/"
      cp -r src/assets/gtk/assets "${theme_dir}/gtk-4.0/"
    fi

    install -m644 "index-${palette}.theme" "${theme_dir}/index.theme"
  done

  install -Dm755 "$srcdir/abyssal-theme" "$pkgdir/usr/bin/abyssal-theme"
}
