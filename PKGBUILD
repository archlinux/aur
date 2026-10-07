# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=penguin-mail
pkgver=1.0.3
pkgrel=1
pkgdesc="Mail and calendar for Linux. Gmail and IMAP accounts, Google Calendar, contacts, OpenPGP and S/MIME"
arch=('x86_64')
url="https://github.com/c9dev/penguin-mail"
license=('GPL-3.0-or-later')
depends=(glibc libgcc gtk4 libadwaita webkitgtk-6.0 gnupg hicolor-icon-theme)
makedepends=(cargo git gettext)
optdepends=('gnome-shell-extension-appindicator: tray icon on GNOME Shell'
            'bubblewrap: run assistant skill scripts')
options=(!lto)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('8b9599517b0e33365b3c4a1370de3ec14918f393ba490cac422901203b1ba6d5')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target $(rustc --print host-tuple)
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --locked -p mailrs -p mailrs-cli --features mailrs/packaging-arch
}

package() {
  cd "$pkgname-$pkgver"
  id=io.github.c9dev.PenguinMail
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname-cli"

  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  install -Dm644 "app/data/icons/scalable/apps/$id.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$id.svg"
  install -Dm644 "app/data/icons/scalable/apps/$id-symbolic.svg" "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$id-symbolic.svg"
  # A drawing of its own for 16 px, on whole pixels, so menus and lists show a
  # sharp icon rather than the large one scaled down to a blur.
  install -Dm644 "app/data/icons/16x16/apps/$id.svg" "$pkgdir/usr/share/icons/hicolor/16x16/apps/$id.svg"

  # Translations
  mkdir -p "$pkgdir/usr/share/applications" "$pkgdir/usr/share/metainfo"
  for po in po/*.po; do
    lang=$(basename "$po" .po)
    mkdir -p "$pkgdir/usr/share/locale/$lang/LC_MESSAGES"
    msgfmt -o "$pkgdir/usr/share/locale/$lang/LC_MESSAGES/penguin-mail.mo" "$po"
  done

  msgfmt --desktop --template="app/data/$id.desktop" -d po -o "$pkgdir/usr/share/applications/$id.desktop"
  chmod 644 "$pkgdir/usr/share/applications/$id.desktop"
  # msgfmt reads the metainfo through the ITS rules AppStream installs.
  metainfo="$pkgdir/usr/share/metainfo/$id.metainfo.xml"
  if ! msgfmt --xml --template="app/data/$id.metainfo.xml" -d po -o "$metainfo" 2>/dev/null; then
    install -Dm644 "app/data/$id.metainfo.xml" "$metainfo"
  fi
  chmod 644 "$metainfo"
}
