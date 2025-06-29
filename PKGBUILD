# Maintainer: Dwi Asmoro Bangun <dwiaceromo@gmail.com>
_pkgname=cwc
pkgname="$_pkgname-git"
pkgver=r165.fca88d9
pkgrel=1
pkgdesc='Extensible Wayland compositor with dynamic window management'
arch=('x86_64')
url="https://github.com/Cudiph/cwcwm"
license=('GPL-3.0-or-later')
depends=(
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'hyprcursor'
  'libdrm'
  'libinput'
  'libwlroots-0.19.so'
  'libxcb'
  'libxkbcommon'
  'luajit-lgi'
  'luajit'
  'pango'
  'wayland'
  'xorg-xwayland'
  'xxhash'
)
makedepends=(
  'git'
  'ldoc'
  'meson'
  'ninja'
  'wayland-protocols'
)
optdepends=(
  'brightnessctl: Default brightness controller in the configuration'
  'copyq: Default clipboard manager'
  'rofi-wayland: Default application launcher'
  'playerctl: Default media player controller'
  'swaybg: Default wallpaper'
  'swayidle: Default idle daemon'
  'waybar: Default bar'
  'xdg-desktop-portal-gtk: Default portal for file picker'
  'xdg-desktop-portal-wlr: Portal for screen sharing'
)
provides=('cwc' 'wayland-compositor')
conflicts=('cwc')
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$_pkgname" || exit 1
  meson setup build -Dplugins=true --buildtype=release --prefix /usr --reconfigure
  ninja -C build
  make docs
}

package() {
  cd "$_pkgname" || exit 1
  DESTDIR="$pkgdir" make install
}
