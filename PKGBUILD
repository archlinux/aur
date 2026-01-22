# Maintainer: Ezozbek Rasulov <arch@ezozbek.dev>

pkgname=e-imzo-manager
pkgver=1.1.0
pkgrel=1
pkgdesc="E-IMZO key management application for Linux"
url="https://github.com/xinux-org/e-imzo-manager"
arch=(x86_64)
license=(AGPL-3.0-only)
depends=(
  gtk4
  libadwaita
  e-imzo
  polkit
  openssl
  glib2
)
makedepends=(
  rust
  cargo
  desktop-file-utils
  appstream-glib
  gettext
)
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/xinux-org/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5aee2585d86ae2c2e5b6c066e578271d46d3dd4fcc426e804d0187810ecdc1ff')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  local APP_ID="uz.xinux.EIMZOManager"
  local PKGDATADIR="/usr/share/$pkgname"
  local LOCALEDIR="/usr/share/locale"
  local LIBEXECDIR="/usr/libexec/$pkgname"
  local VERSION="$pkgver"
  local PROFILE=""

  cat > src/config.rs << EOF
pub const APP_ID: &str = "$APP_ID";
pub const GETTEXT_PACKAGE: &str = "E-IMZO-Manager";
pub const LOCALEDIR: &str = "$LOCALEDIR";
pub const LIBEXECDIR: &str = "$LIBEXECDIR";
pub const PROFILE: &str = "$PROFILE";
pub const RESOURCES_FILE: &str = concat!("$PKGDATADIR", "/resources.gresource");
pub const VERSION: &str = "$VERSION";
EOF

  cargo build --frozen --release --package E-IMZO-Manager
  cargo build --frozen --release --package e-helper

  glib-compile-resources --sourcedir=data/resources --target=resources.gresource data/resources/resources.gresource.xml

  msgfmt po/uz.po -o uz.mo
  msgfmt po/ru.po -o ru.mo

  sed -e "s|@icon@|$APP_ID|g" -e "s|@app-id@|$APP_ID|g" -e "s|@gettext-package@|E-IMZO-Manager|g" data/$APP_ID.desktop.in.in > data/$APP_ID.desktop.in
  # finalize desktop file
  mv data/$APP_ID.desktop.in data/$APP_ID.desktop
  sed -e "s|@app-id@|$APP_ID|g" -e "s|@gettext-package@|E-IMZO-Manager|g" data/$APP_ID.metainfo.xml.in.in > data/$APP_ID.metainfo.xml.in
  # finalize metainfo
  mv data/$APP_ID.metainfo.xml.in data/$APP_ID.metainfo.xml
  sed -e "s|@app-id@|$APP_ID|g" -e "s|@gettext-package@|E-IMZO-Manager|g" data/$APP_ID.gschema.xml.in > data/$APP_ID.gschema.xml

  sed -e "s|@pkglibexecdir@|$LIBEXECDIR|g" -e "s|@icon@|$APP_ID|g" data/$APP_ID.policy.in.in > data/$APP_ID.policy
}

package() {
  cd "$pkgname-$pkgver"

  local APP_ID="uz.xinux.EIMZOManager"
  local PKGDATADIR="/usr/share/$pkgname"
  local LIBEXECDIR="/usr/libexec/$pkgname"

  install -Dm755 "target/release/E-IMZO-Manager" "$pkgdir/usr/bin/E-IMZO-Manager"
  install -Dm755 "target/release/e-helper" "$pkgdir/$LIBEXECDIR/e-helper"

  install -Dm644 "resources.gresource" "$pkgdir/$PKGDATADIR/resources.gresource"

  install -Dm644 "uz.mo" "$pkgdir/usr/share/locale/uz/LC_MESSAGES/E-IMZO-Manager.mo"
  install -Dm644 "ru.mo" "$pkgdir/usr/share/locale/ru/LC_MESSAGES/E-IMZO-Manager.mo"

  install -Dm644 "data/$APP_ID.desktop" "$pkgdir/usr/share/applications/$APP_ID.desktop"
  install -Dm644 "data/$APP_ID.metainfo.xml" "$pkgdir/usr/share/metainfo/$APP_ID.metainfo.xml"
  install -Dm644 "data/$APP_ID.gschema.xml" "$pkgdir/usr/share/glib-2.0/schemas/$APP_ID.gschema.xml"
  install -Dm644 "data/$APP_ID.policy" "$pkgdir/usr/share/polkit-1/actions/$APP_ID.policy"

  install -Dm644 "data/icons/$APP_ID.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$APP_ID.svg"
  install -Dm644 "data/icons/$APP_ID-symbolic.svg" "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$APP_ID-symbolic.svg"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "LICENSE-AGPL" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-AGPL"
  install -Dm644 "LICENSE-CCBY" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-CCBY"
}
