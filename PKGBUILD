# Maintainer azerus.CF <aur@azerus.CF>
pkgname=niri-git-native
_upstream=niri
pkgver=0
pkgrel=1
pkgdesc="Scrollable-tiling Wayland compositor,git version  with native  cpu compilation optimizations"
arch=(x86_64 aarch64)
url="https://github.com/YaLTeR/${_upstream}"
license=(GPL-3.0-or-later)

depends=(
  cairo glib2 libdisplay-info libinput pipewire libxkbcommon
  mesa pango pixman
)
optdepends=(
  'seatd: seat management daemon (alternative to logind via libseat)'
  'fuzzel: application launcher similar to rofi drun mode'
  'waybar: highly customizable Wayland bar'
  'alacritty: a cross-platform OpenGL terminal emulator'
  'mako: notification daemon for Wayland'
  'swaybg: wallpaper tool for Wayland compositors'
  'swaylock: screen locker for Wayland'
  'xdg-desktop-portal-gtk: basic portals'
  'xdg-desktop-portal-gnome: screencasting support'
  'gnome-keyring: secret portal support'
  'polkit-gnome: polkit agent'
)

makedepends=(clang rust cargo git pkgconf pipewire)

provides=("niri")
conflicts=("niri" "niri-bin" "niri-git")


source=("${_upstream}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_upstream}"
  git describe --long --tags --abbrev=7 \
    | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "${srcdir}/${_upstream}"
  export PATH=/usr/bin:$PATH
  export CARGO_HOME="${srcdir}/${_upstream}/.cargo"

  /usr/bin/cargo fetch --locked --target "$(/usr/bin/rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${_upstream}"
  export PATH=/usr/bin:/usr/local/bin
  hash -r
  export CARGO_HOME="${srcdir}/${_upstream}/.cargo"
  export CARGO_TARGET_DIR=target
  unset LDFLAGS CFLAGS CXXFLAGS
  export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=/usr/bin/gcc
  export CARGO_TARGET_AARCH64_UNKNOWN_LINUX_GNU_LINKER=/usr/bin/gcc
  export RUSTFLAGS="-C opt-level=3 -C target-cpu=native -C linker=/usr/bin/gcc"

  /usr/bin/cargo build --frozen --release
}

package() {
  cd "${srcdir}/${_upstream}"

  install -Dm755 "target/release/${_upstream}" -t "${pkgdir}/usr/bin/"
  install -Dm755 "resources/${_upstream}-session" -t "${pkgdir}/usr/bin/"

  install -Dm644 resources/default-config.kdl -t "${pkgdir}/usr/share/doc/${_upstream}/"
  install -Dm644 "resources/${_upstream}.desktop" -t "${pkgdir}/usr/share/wayland-sessions/"
  install -Dm644 "resources/${_upstream}-portals.conf" -t "${pkgdir}/usr/share/xdg-desktop-portal/"
  install -Dm644 "resources/${_upstream}"{.service,-shutdown.target} -t "${pkgdir}/usr/lib/systemd/user/"
}

