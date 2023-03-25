# Maintainer: Funami
# Contributor: Nathan <ndowens@artixlinux.org>
# Contributor: Maxim Baz <$pkgname at maximbaz dot com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: tomKPZ <tomKPZ@gmail.com>
pkgname=sway-wlroots-no-systemd-git
pkgver=r7096.f21090f9.r6176.12e28c34
epoch=1
pkgrel=1
pkgdesc='sway with wlroots statically linked (no systemd)'
arch=(x86_64)
url='https://swaywm.org/'
license=(MIT)
depends=(
  'cairo'
  'gdk-pixbuf2'
  'libevdev.so'
  'libinput'
  'libjson-c.so'
  'libudev.so'
  'libwayland-server.so'
  'libxcb'
  'libxkbcommon.so'
  'pango'
  'pcre2'
  'ttf-font'
  # additional for wlroots
  'libglvnd'
  'libpixman-1.so'
  'libseat.so'
  'libvulkan.so'
  'libwayland-client.so'
  'opengl-driver'
  'xcb-util-errors'
  'xcb-util-renderutil'
  'xcb-util-wm'
)
makedepends=(
  'meson'
  'ninja'
  'scdoc'
  'setconf'
  'wayland-protocols'
  'elogind'
  # additional for wlroots
  'glslang'
  'vulkan-headers'
  'xorg-xwayland'
)
backup=(
  etc/sway/config
)
optdepends=(
  'bemenu: Wayland-native alternative to dmenu'
  'dmenu: Application launcher used in default config'
  'foot: Terminal emulator used in the default configuration'
  'i3status: Status line generation'
  'mako: Lightweight notification daemon'
  'polkit: System privilege control. Required if not using seatd service'
  'swaybg: Wallpaper tool for sway'
  'swayidle: Idle management daemon'
  'swaylock: Screen locker'
  'waybar: Highly customizable bar'
  'xorg-xwayland: X11 support'
)
provides=('sway')
conflicts=('sway')
source=('git+https://github.com/swaywm/sway.git'
        'git+https://gitlab.freedesktop.org/wlroots/wlroots.git')
sha512sums=('SKIP'
            'SKIP')

pkgver() {
  printf "r%s.%s.r%s.%s" \
    "$(git -C sway rev-list --count HEAD)" \
    "$(git -C sway rev-parse --short HEAD)" \
    "$(git -C wlroots rev-list --count HEAD)" \
    "$(git -C wlroots rev-parse --short HEAD)"
}

prepare() {
  cd "sway"
  # Set the version information to 'Arch Linux' instead of 'makepkg'
  sed -i "s/branch \\\'@1@\\\'/Arch Linux/g" meson.build
}

build() {
  mkdir -p sway/subprojects
  ln -sf ../../wlroots sway/subprojects/wlroots
  mkdir -p build
  arch-meson build "sway" --default-library=static -D sd-bus-provider=libelogind -D werror=false -D wlroots:b_ndebug=false -D wlroots:examples=false
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build --skip-subprojects wlroots
  install -Dm644 "sway/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.sway"
  install -Dm644 "wlroots/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.wlroots"

  for util in autoname-workspaces.py inactive-windows-transparency.py grimshot; do
    install -Dm755 "sway/contrib/$util" -t \
                   "$pkgdir/usr/share/sway/scripts"
  done
}
