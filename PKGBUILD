# Maintainer: Dan Elkouby <streetwalkermc@gmail.com>
# Contributor: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

_pkgname=sway
pkgname=sway9
pkgver=1.2
epoch=1
pkgrel=2
pkgdesc='Tiling Wayland compositor and replacement for the i3 window manager (personal build)'
arch=(x86_64)
url='https://swaywm.org/'
license=(MIT)
depends=(cairo gdk-pixbuf2 json-c pango pcre swaybg ttf-font wlroots)
makedepends=(git meson ninja scdoc setconf wayland-protocols)
provides=(sway)
conflicts=(sway)
backup=(etc/sway/config)
optdepends=(
  'dmenu: Application launcher'
  'i3status: Status line'
  'grim: Screenshot utility'
  'mako: Lightweight notification daemon'
  'rxvt-unicode: Terminal emulator'
  'slurp: Select a region'
  'swayidle: Idle management daemon'
  'swaylock: Screen locker'
  'wallutils: Timed wallpapers'
  'waybar: Highly customizable bar'
  'xorg-server-xwayland: X11 support'
)
source=("https://github.com/swaywm/sway/releases/download/$pkgver/sway-$pkgver.tar.gz"
        "https://github.com/swaywm/sway/releases/download/$pkgver/sway-$pkgver.tar.gz.sig"
        "10-systemd.conf"
        "0001-Don-t-use-git-to-find-the-version.patch"
        "0002-Don-t-send-wl_pointer_leave-when-hide_cursor-activat.patch")
sha512sums=('e3842e0da58a1678289aa24fc84f6841deeea6e9ffe04407525e5b9d62ed177d890133ff07412317c811f5b07a2e5073d14ff59a30e62111f51fc65af0dddb19'
            'SKIP'
            '122b97f7adb6444c442368c5bbbd3401bcd8420f522fcd6521def5a09cd2989f5f6f555a5a7762e922eaa307077eb26db6508242ee1b835ca73ad65acaeef95b'
            '69d8e1e653a01613772e4a696cb3c17a5f5c47c70a613d2e4cfe260b4eb90c825f3bcc09a13dbe91478ee253211bff31fbd0e513852f5500c08f81148820fca8'
            '10657240f8f4dbc31509c4e38bec35889b47a780873b803e25aaee9496944f8a81fa067e9e52e5a4e0f03680c9eeb76045910f3a2d2967521d00c1969de0a325')
validpgpkeys=('9DDA3B9FA5D58DD5392C78E652CB6609B22DA89A') # Drew DeVault

prepare() {
  cd "$_pkgname-$pkgver"

  # Set the version information to 'Arch Linux' instead of 'makepkg'
  sed -i "s/branch \\\'@1@\\\'/Arch Linux/g" meson.build

  # From the linux-mainline PKGBUILD
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    msg2 "Applying patch $src..."
    patch -Np1 < "../$src"
  done
}

build() {
  mkdir -p build
  arch-meson build "$_pkgname-$pkgver" -D werror=false -D b_ndebug=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 "$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 10-systemd.conf "$pkgdir/etc/sway/conf.d/10-systemd.conf"
}

# vim: ts=2 sw=2 et
