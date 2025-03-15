pkgname=screenshot-gui
pkgver=1.0.0
pkgrel=1
pkgdesc="Screenshot app gui for Hyprland"
arch=('x86_64')
url="https://gitlab.com/ricardoca/screenshot-gui/"
license=('GPL')
depends=('gtk3' 'hyprshot')
makedepends=('git' 'gcc' 'pkg-config')
source=("git+https://gitlab.com/ricardoca/screenshot-gui.git")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  mkdir -p "$HOME/.config/screenshot-gui"
}

build() {
  cd "$srcdir/$pkgname"
  gcc $(pkg-config --cflags gtk+-3.0) -o screenshot-gui screenshot-gui.c $(pkg-config --libs gtk+-3.0)
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 screenshot-gui "$HOME/.config/screenshot-gui/screenshot-gui"

  # Adiciona as linhas ao arquivo hyprland.conf
  hyprland_conf="$HOME/.config/hypr/hyprland.conf"
  if [[ -f "$hyprland_conf" ]]; then
    echo -e "\nbind = , Print, exec, $HOME/.config/screenshot-gui/screenshot-gui" >>"$hyprland_conf"
    echo "windowrulev2 = float, class:^(screenshot-gui)$" >>"$hyprland_conf"
  else
    echo "File hyprland.conf not located in $HOME/.config/hypr/"
    echo "Please, add lines in your hyprland.conf:"
    echo "bind = , Print, exec, $HOME/.config/screenshot-gui/screenshot-gui"
    echo "windowrulev2 = float, class:^(screenshot-gui)$"
  fi
}
