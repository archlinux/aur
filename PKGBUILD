# Maintainer: Il Tuo Nome <tua-email@example.com>
# Nota: sostituisci TUO_UTENTE con il tuo username GitHub prima di pubblicare su AUR.

pkgname=wallcycle
pkgver=0.1.0
pkgrel=1
pkgdesc="Cross-platform wallpaper slideshow with real-time clock overlay and BT.709 luminance filter (Lazarus/FPC)"
arch=('x86_64' 'aarch64')
url="https://github.com/nightranger73/WallCycle"
license=('Apache-2.0')
depends=('curl' 'qt6pas')
makedepends=('git' 'fpc' 'lazarus-qt6')
optdepends=(
  'awww: Wayland wallpaper backend for Niri, Umbriel, Hyprland and generic Wayland'
  'hyprpaper: native wallpaper daemon for Hyprland'
  'sway: Sway wallpaper support via swaymsg'
  'feh: X11 wallpaper backend for i3/Openbox/BSPWM'
  'nitrogen: X11 wallpaper backend fallback'
)
provides=('wallcycle')
conflicts=('wallcycle')
source=(
  "wallcycle::git+https://github.com/nightranger73/WallCycle.git"
  "luipack::git+https://github.com/blikblum/luipack.git"
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/wallcycle"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  local lazcfg="$srcdir/lazarus-cfg"
  mkdir -p "$lazcfg"

  # 1. Compila e registra il pacchetto TUniqueInstance (senza --add-package-link)
  lazbuild --pcp="$lazcfg" --lazarusdir=/usr/lib/lazarus "$srcdir/luipack/uniqueinstance/uniqueinstance_package.lpk"

  # 2. Compila il tuo progetto principale
  lazbuild --pcp="$lazcfg" --lazarusdir=/usr/lib/lazarus -B "$srcdir/wallcycle/WallCycle.lpi"

  cd "$srcdir/wallcycle"
  lazbuild --pcp="$lazcfg" --widgetset=qt6 --build-mode=Release WallCycle.lpi
}

package() {
  cd "$srcdir/wallcycle"
  install -Dm755 "bin/WallCycle" "$pkgdir/usr/bin/wallcycle"
  install -Dm644 "wallcycle.desktop" "$pkgdir/usr/share/applications/wallcycle.desktop"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
