# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=boxbuddy
_app_id=io.github.dvlv.boxbuddyrs
pkgver=2.1.0
pkgrel=1
pkgdesc="A Graphical Interface for Distrobox"
arch=('x86_64')
url="https://github.com/Dvlv/BoxBuddyRS"
license=('MIT')
depends=('distrobox' 'libadwaita')
makedepends=('cargo')
checkdepends=('appstream-glib')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('5da670913cb3424dc61d2e5a5b5abe563c5c570beed873d5a666081042083361')

prepare() {
  cd "BoxBuddyRS-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "BoxBuddyRS-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "BoxBuddyRS-$pkgver"
  appstream-util validate-relax --nonet "${_app_id}.metainfo.xml"
  desktop-file-validate "${_app_id}.desktop"
}

package() {
  cd "BoxBuddyRS-$pkgver"
  install -Dm755 "target/release/$pkgname-rs" -t "$pkgdir/usr/bin/"
  install -Dm644 "${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "${_app_id}.gschema.xml" -t "$pkgdir/usr/share/glib-2.0/schemas/"
  install -Dm644 "${_app_id}.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 "icons/${_app_id}.svg" -t \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/"

  for lang in de_DE it_IT pt_BR ru_RU uk_UA; do
    install -Dm644 "po/${lang}/LC_MESSAGES/${pkgname}rs.mo" -t \
      "$pkgdir/usr/share/locale/${lang}/LC_MESSAGES/"
  done

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
