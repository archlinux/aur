# Maintainer: Yo'av Moshe <aur@yoavmoshe.com>

pkgname=hylki
pkgver=1.42.0
pkgrel=1
pkgdesc="A clean, fast GNOME-native email client"
arch=('x86_64' 'aarch64')
url="https://hylki.hyprlab.co"
license=('AGPL-3.0-or-later')
depends=(
  'cairo'
  'dbus'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'graphene'
  'gtk4'
  'libadwaita'
  'openssl'
  'pango'
  'poppler-glib'
  'wayland'
  'webkitgtk-6.0'
)
makedepends=(
  'cargo'
  'gettext'
  'glib2-devel'
  'pkgconf'
)
optdepends=(
  'gnome-keyring: Secret Service provider to store passwords and OAuth tokens'
  'nautilus-python: GNOME Files right-click attachment integration'
)
provides=("vireo=$pkgver" "veem=$pkgver")
conflicts=('vireo' 'veem')
replaces=('vireo' 'veem')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hyprlab/hylki/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5c653af17319354bc07f0a6d800d59a693143f485cad29d51bb4d05e41ad15bc')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release

  # Compile gettext translations
  for po in po/*.po; do
    [ -e "$po" ] || continue
    lang=$(basename "$po" .po)
    mkdir -p "locale/$lang/LC_MESSAGES"
    msgfmt -o "locale/$lang/LC_MESSAGES/hylki.mo" "$po"
  done

  # Generate translated desktop file and metainfo
  msgfmt --desktop --template=data/co.hyprlab.Hylki.desktop -d po -o co.hyprlab.Hylki.desktop
  msgfmt --xml --template=data/co.hyprlab.Hylki.metainfo.xml -d po -o co.hyprlab.Hylki.metainfo.xml
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"

  # Binary
  install -Dm755 target/release/hylki "$pkgdir/usr/bin/hylki"

  # Desktop file and AppStream metadata
  install -Dm644 co.hyprlab.Hylki.desktop "$pkgdir/usr/share/applications/co.hyprlab.Hylki.desktop"
  install -Dm644 co.hyprlab.Hylki.metainfo.xml "$pkgdir/usr/share/metainfo/co.hyprlab.Hylki.metainfo.xml"

  # Icons
  for size in 256x256 512x512; do
    install -Dm644 "data/icons/hicolor/$size/apps/co.hyprlab.Hylki.png" \
      "$pkgdir/usr/share/icons/hicolor/$size/apps/co.hyprlab.Hylki.png"
  done
  install -Dm644 data/icons/hicolor/scalable/apps/co.hyprlab.Hylki.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/co.hyprlab.Hylki.svg"
  install -Dm644 data/icons/hicolor/symbolic/apps/co.hyprlab.Hylki-symbolic.svg \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/co.hyprlab.Hylki-symbolic.svg"

  # Translations
  for mo in locale/*/LC_MESSAGES/hylki.mo; do
    [ -e "$mo" ] || continue
    install -Dm644 "$mo" "$pkgdir/usr/share/$mo"
  done

  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
