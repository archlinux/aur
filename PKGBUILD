# Maintainer: Hyeon Kim <simnalamburt@gmail.com>
# Contributor: Brett Cornwall <ainola@archlinux.org>
# Contributor: Maxim Baz <$pkgname at maximbaz dot com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=sway-im
_pkgname=sway
pkgver=1.5.1.r2.ec36e113
_pkgver=1.5.1
epoch=1
pkgrel=1
pkgdesc='sway Wayland compositor with input method keyboard grab support'
arch=(x86_64)
url='https://swaywm.org/'
license=(MIT)
depends=(
  'cairo'
  'gdk-pixbuf2'
  'json-c'
  'pango'
  'polkit'
  'pcre'
  'swaybg'
  'ttf-font'
  'wlroots'
)
makedepends=(git meson ninja scdoc setconf wayland-protocols)
backup=(etc/sway/config)
optdepends=(
  'alacritty: Terminal emulator used by the default config'
  'dmenu: Application launcher'
  'grim: Screenshot utility'
  'i3status: Status line'
  'mako: Lightweight notification daemon'
  'slurp: Select a region'
  'swayidle: Idle management daemon'
  'swaylock: Screen locker'
  'wallutils: Timed wallpapers'
  'waybar: Highly customizable bar'
  'xorg-xwayland: X11 support'
)
source=("https://github.com/swaywm/sway/releases/download/$_pkgver/sway-$_pkgver.tar.gz"
        "https://github.com/swaywm/sway/releases/download/$_pkgver/sway-$_pkgver.tar.gz.sig"
        "0001-Implement-input-method-keyboard-grab.patch"
        "0002-im-Handle-text-disable-on-focus-lost-properly.patch"
        "50-systemd-user.conf")
sha512sums=('3b937249db2875100bc22e99f955a3300d3294a296fb37006fa1468a3986bf4fa8e5197279e3587bd8dc29f31adff8fbdc9ddc840e7be982b73331a05cd06ba5'
            'SKIP'
            'd1cad32660f7a39cac423808f96c3253355a657ffc466617a68e574d02b2d47016bdeb32a3a496a95fe5a75fb132903f4b551b55eae7641cc881be68be2e52e9'
            '3bbdef63985980ce52caf51aa141cdd619fb055c2ba199e783666da779e4ae38c4338ddad37ba29ea8a0c11b0c692834c1c4a00d5260c4dc09c041b5d6bc6253'
            '57590bc0d14c87289a4a9cd67991c6a841e54244d2a6186b5da5a08e633de2e8631959fa8c77ede211b0a5f315d920f2c1350951a53d6f2e9e81859056cb3c9e')
validpgpkeys=('34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48'  # Simon Ser
              '9DDA3B9FA5D58DD5392C78E652CB6609B22DA89A') # Drew DeVault
provides=('sway')
conflicts=('sway')

prepare() {
  cd "$_pkgname-$_pkgver"

  patch -p1 <"$srcdir"/0001-Implement-input-method-keyboard-grab.patch
  patch -p1 <"$srcdir"/0002-im-Handle-text-disable-on-focus-lost-properly.patch

  # Set the version information to 'Arch Linux' instead of 'makepkg'
  sed -i "s/branch \\\'@1@\\\'/Arch Linux/g" meson.build
}

build() {
  mkdir -p build
  arch-meson build "$_pkgname-$_pkgver" -D werror=false -D b_ndebug=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 "$_pkgname-$_pkgver/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 50-systemd-user.conf -t "$pkgdir/etc/sway/config.d/"

  for util in autoname-workspaces.py inactive-windows-transparency.py grimshot; do
    install -Dm755 "$_pkgname-$_pkgver/contrib/$util" -t \
                   "$pkgdir/usr/share/$_pkgname/scripts"
  done
}

# vim: ts=2 sw=2 et
