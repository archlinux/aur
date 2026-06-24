# Maintainer: sfs <sfslinux@gmail.com>

pkgname=lxappearance-wlr
pkgver=0.6.4
pkgrel=12
pkgdesc='Feature-rich GTK3 theme switcher for wlroots-based Wayland compositors'
arch=(x86_64)
url='https://github.com/lxde/lxappearance'
license=(GPL-2.0-or-later)
depends=(
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  libxcursor
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
  lxappearance-cursor-wayland-preview.patch
  lxappearance-wlr-sync-gsettings
  CHANGELOG.en.md
  CHANGELOG.ru.md
  README.en.md
  README.ru.md
  AGENTS.md
)
b2sums=(
  6fa7d9f2193c2a2dbfa1e91f75541f4a2facc6f052aacf9d9ad7d703b3f638c7bc13d4d24d945241b714c21898ff12f661ac078eb752ed17611bc03a1bb4bef7
  161ded535844ccf9c116c4197c174416c338fe2837c984b89bba52f1c7813778d5ccf7df0889ec62355199fa2fe667bef5fddbdebb40cb11c62da3ec17432791
  940ea3c526872b9b123746ebe2faa43339ffe60f9d5e0a81883c4abb2fb06d3c7536d9bf58a85cea3378ec20e0b82249d665333991a6dd823e2c0955ac4c3d40
  49da625e9c18b42bb5d0e36b4bae8250ac657765ae529d0a761cf4243b4fdc5671015999bbd0ed028722c6fc1566ecbcc4f43210bcb27dc577d581eee899e317
  d46dd0e3b6adb3abe3d6dc9470fd7b32bac9cf4e1316665d2339404e039ba478179db1961282232a2861451b942a6c25f402ac5683f6f06aa2b71283e86e22ab
  ce767be83759e166c1e3658da344a6a19863f885694ce9a7d0c1583fe3f31a4dacfafa588abaf5bbb6c2b3f58e5fd026c4b70fe95cf9b5a0335285d4e26113ac
  5ddbae2e2c05c79187d3f0520af5b27f823ac75f6dce2acdf843891f24923baf0c0e18264c297435b0d8d492a62e877e0ba6bc909f6704a551d3dbcdb90bd4dc
  1d2e6732fecdd65669159f4437148ce02f175cb63819c68e23c087fcaf6312b09829f6bc0db5df5591e0e5659755150a327a8f79f79bafb7afe5992e7a7ba999
  9a07bad56081f8c06883bd679969c59073085393a08168ac948905cf1e6a99a34563cbfa9a147ec62094264415dc31d6e8584c7efb9d9c63abf2fe4bd888df3b
  8bd88ee0f2ea1c5e2592dc4d66f89e68290c6b6ed1f8a7b9891f079867b39808737d2f8e4e6717239de09f04715f1e284f6120a4a2020c420a6f4857e4a88c29
  14d70b6ae687e6d94689e0897c99422ff56cee35b44f407821096551d49e262f2b01455288927c518f16f8c21ec45617d79e0ce9a1937aa5cf21724629523052
  5f51a4a8355253e167e54aaa4de407088db7de88d07713843ac61b60a3a006efd8cb1ccd36b3bf9cf843edf1599797a4499f3dd9b61ca443091f4e03cb9425b0
  3d00fc7a3284e818d9e5a913c715405433844c99e35019497163091c44d39ffa0c84e6a1cbf8962c150c4ad7c16cef54ddfeb2604a6ed1e12dcf0cbb972e7d31
  bf35b807fba8abaaaa11d159e9dd932b68d3f909fee53f40c83c83df290d68c93fc7fba4067ff944dcdd325173d4c539754194d9d3c257c4e311e9f0a4907562
  2df9c0872427f61c5a724cfbd2481268acafda8d8e481a7860d09a806cf83be689de58674d9efac06582c12e62ddcc25b84ad4bde25d2490d2d5ada0381309d0
  c4ab1a654f152764ba1f223edf2935983adc4dcd8192c68e87061ab411f445d9483758fc0df2a3ed21b376ca5fb76dccd8d0e92110ce450e2ff9d8e8148cecee
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
  apply_patch_checked ../lxappearance-cursor-wayland-preview.patch

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
  grep -q 'XcursorLibraryLoadImages' src/cursor-theme.c
  grep -q 'gtk_range_set_range(GTK_RANGE(app.cursor_size_range), 8, 96)' src/cursor-theme.c
  grep -q 'sync_labwc_environment' src/lxappearance.c
  ! grep -q 'NotShowIn' data/lxappearance.desktop.in
}

package() {
  cd lxappearance
  make DESTDIR="$pkgdir" install

  install -Dm755 ../lxappearance-wlr-sync-gsettings "$pkgdir/usr/bin/lxappearance-wlr-sync-gsettings"
  install -Dm644 ../CHANGELOG.en.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.en.md"
  install -Dm644 ../CHANGELOG.ru.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.ru.md"
  install -Dm644 ../README.en.md "$pkgdir/usr/share/doc/$pkgname/README.en.md"
  install -Dm644 ../README.ru.md "$pkgdir/usr/share/doc/$pkgname/README.ru.md"
  install -Dm644 ../AGENTS.md "$pkgdir/usr/share/doc/$pkgname/AGENTS.md"
}
