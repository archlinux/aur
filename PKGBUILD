# Maintainer: sfs <sfslinux@gmail.com>

pkgname=lxappearance-wlr
pkgver=0.6.4
pkgrel=11
pkgdesc='Feature-rich GTK3 theme switcher for wlroots-based Wayland compositors'
arch=(x86_64)
url='https://github.com/lxde/lxappearance'
license=(GPL-2.0-or-later)
depends=(
  gdk-pixbuf2
  glib2
  glibc
  gtk3
)
makedepends=(
  git
  intltool
)
provides=(lxappearance)
conflicts=(lxappearance lxappearance-gtk3)
source=(
  "git+https://github.com/lxde/lxappearance.git#tag=$pkgver"
  lxappearance-theme-name.patch
  lxappearance-builtin-themes.patch
  lxappearance-transient-dialog.patch
  lxappearance-notshowin.patch
  lxappearance-wayland-sync.patch
  lxappearance-wayland-ui.patch
  lxappearance-font-tab-layout.patch
  lxappearance-ru-translation.patch
  lxappearance-wlr-sync-gsettings
  CHANGELOG.en.md
  CHANGELOG.ru.md
)
b2sums=(
  6fa7d9f2193c2a2dbfa1e91f75541f4a2facc6f052aacf9d9ad7d703b3f638c7bc13d4d24d945241b714c21898ff12f661ac078eb752ed17611bc03a1bb4bef7
  161ded535844ccf9c116c4197c174416c338fe2837c984b89bba52f1c7813778d5ccf7df0889ec62355199fa2fe667bef5fddbdebb40cb11c62da3ec17432791
  940ea3c526872b9b123746ebe2faa43339ffe60f9d5e0a81883c4abb2fb06d3c7536d9bf58a85cea3378ec20e0b82249d665333991a6dd823e2c0955ac4c3d40
  49da625e9c18b42bb5d0e36b4bae8250ac657765ae529d0a761cf4243b4fdc5671015999bbd0ed028722c6fc1566ecbcc4f43210bcb27dc577d581eee899e317
  a23009e46f227d076e2fd8b488e0ff02c6129eaedd01bca1407787e605907e0406a8ac13e4501a73dc9082f0140386329e542a4db17c6a617300c12031c2a015
  473ac5d32344f4b709150ec67150060987e7956531487cc44a71ca7d6c1ea65cec893d969cdb418b9265e18015585ddf7215e14acebec73658a93649589e4e7b
  5ddbae2e2c05c79187d3f0520af5b27f823ac75f6dce2acdf843891f24923baf0c0e18264c297435b0d8d492a62e877e0ba6bc909f6704a551d3dbcdb90bd4dc
  1d2e6732fecdd65669159f4437148ce02f175cb63819c68e23c087fcaf6312b09829f6bc0db5df5591e0e5659755150a327a8f79f79bafb7afe5992e7a7ba999
  88374b086969750b92899da401459fc564c8a2042cd9d19ecfa4134b81f8eceba62afa13bba670a749a53e638231804b344815c1c6c720a1cfb1d2a44d2a4891
  14d70b6ae687e6d94689e0897c99422ff56cee35b44f407821096551d49e262f2b01455288927c518f16f8c21ec45617d79e0ce9a1937aa5cf21724629523052
  3bcd07c77a1e35d31685fde8bd38da1f3be67be31a3464218de30110f26c0407ec14e94e2a116139e58557cd4d2cd17f88bc049cc687927fa0413ce2a5f185b8
  8ea8a3d902924c46377969950c0e88bba49beb42e7279eb18d1bb0be5956c6b0c8a4d20850bb349d185f59b7f13f7f426839c5f0ec676aa2f6055fba3a7394cb
)

prepare() {
  cd lxappearance

  apply_patch_checked() {
    local patch_file="$1"
    git apply --check "$patch_file"
    git apply "$patch_file"
  }

  # https://github.com/lxde/lxappearance/pull/15
  apply_patch_checked ../lxappearance-theme-name.patch

  # https://github.com/lxde/lxappearance/pull/16
  apply_patch_checked ../lxappearance-builtin-themes.patch

  # https://github.com/lxde/lxappearance/pull/17
  apply_patch_checked ../lxappearance-transient-dialog.patch

  # https://github.com/lxde/lxappearance/pull/20
  apply_patch_checked ../lxappearance-notshowin.patch

  apply_patch_checked ../lxappearance-wayland-sync.patch
  apply_patch_checked ../lxappearance-wayland-ui.patch
  apply_patch_checked ../lxappearance-font-tab-layout.patch
  apply_patch_checked ../lxappearance-ru-translation.patch

  autoreconf -fiv
}

build() {
  cd lxappearance
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-dbus \
    --enable-gtk3
  make
}

check() {
  cd lxappearance

  test -x src/lxappearance

  grep -q 'gtk_window_set_default_size(GTK_WINDOW(app.dlg), 700, -1);' src/lxappearance.c
  grep -q 'remove_wayland_legacy_pages(b);' src/lxappearance.c
  grep -q 'gsettings set org.gnome.desktop.interface cursor-theme' src/lxappearance.c
}

package() {
  cd lxappearance
  make DESTDIR="$pkgdir" install

  install -Dm755 ../lxappearance-wlr-sync-gsettings "$pkgdir/usr/bin/lxappearance-wlr-sync-gsettings"
  install -Dm644 ../CHANGELOG.en.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.en.md"
  install -Dm644 ../CHANGELOG.ru.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.ru.md"
}
