# Maintainer: Brett Cornwall <ainola@archlinux.org>
# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=sway
pkgver=1.5.1
epoch=1
pkgrel=2
pkgdesc='Tiling Wayland compositor and replacement for the i3 window manager'
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
source=("https://github.com/swaywm/sway/releases/download/$pkgver/sway-$pkgver.tar.gz"
        "https://github.com/swaywm/sway/releases/download/$pkgver/sway-$pkgver.tar.gz.sig"
        "50-systemd-user.conf"
        "https://github.com/swaywm/sway/commit/cf03185561e919f1c337f087194fec150425eef5.patch"
        "https://github.com/swaywm/sway/commit/e2ec65d0a32797edd0846758bc24cf685e2d19d5.patch"
        "https://github.com/swaywm/sway/commit/c06a926e0d89e952e5a3892b63f07d5b802b34ef.patch")
sha512sums=('3b937249db2875100bc22e99f955a3300d3294a296fb37006fa1468a3986bf4fa8e5197279e3587bd8dc29f31adff8fbdc9ddc840e7be982b73331a05cd06ba5'
            'SKIP'
            '57590bc0d14c87289a4a9cd67991c6a841e54244d2a6186b5da5a08e633de2e8631959fa8c77ede211b0a5f315d920f2c1350951a53d6f2e9e81859056cb3c9e'
            'ba973381dac6880004414b46a482b45fe285efd37ee6d406ac0c7dd39254671fa462b021dd30cf7ce12c1bcf108188f4ecd2e76d902af69bccffc07bf380522c'
            'a8fba2b93b9abd5e21e5c2467b98ff9e55050118355ab8a5d3039625d2e18b03eee419adfb9804552a96b3fb1802113aa24d52f7ee099d33404f760412727831'
            '634d52d4ef1bde400d43bd96a278a321f2ae735058fff49ace7bbd420db489edf6ee2aafa1ce44894a319a6113cde46749a297ae003daa77c7edf2a25eec2b0f')
validpgpkeys=('34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48'  # Simon Ser
              '9DDA3B9FA5D58DD5392C78E652CB6609B22DA89A') # Drew DeVault

prepare() {
  cd "$pkgname-$pkgver"

  # Set the version information to 'Arch Linux' instead of 'makepkg'
  sed -i "s/branch \\\'@1@\\\'/Arch Linux/g" meson.build

  # Fix subsurface corruption on e.g. Firefox
  patch -p1 < ../cf03185561e919f1c337f087194fec150425eef5.patch
  patch -p1 < ../e2ec65d0a32797edd0846758bc24cf685e2d19d5.patch
  patch -p1 < ../c06a926e0d89e952e5a3892b63f07d5b802b34ef.patch
}

build() {
  mkdir -p build
  arch-meson build "$pkgname-$pkgver" -D werror=false -D b_ndebug=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 50-systemd-user.conf -t "$pkgdir/etc/sway/config.d/"

  for util in autoname-workspaces.py inactive-windows-transparency.py grimshot; do
    install -Dm755 "$pkgname-$pkgver/contrib/$util" -t \
                   "$pkgdir/usr/share/$pkgname/scripts"
  done
}

# vim: ts=2 sw=2 et
