# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=boxbuddy
_app_id=io.github.dvlv.boxbuddyrs
pkgver=2.5.7
pkgrel=1
pkgdesc="A Graphical Interface for Distrobox"
arch=('x86_64')
url="https://www.dvlv.co.uk/BoxBuddyRS"
license=('MIT')
depends=(
  'distrobox'
  'gtk4'
  'libadwaita'
)
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Dvlv/BoxBuddyRS/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('614ad5fc36f730bcf75f0f9de16f20220e85e2ab60bfa3d6e6b11fe913b56c27')

prepare() {
  cd "BoxBuddyRS-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"

  # Correct paths
  sed -i 's|{data_home}/locale|/usr/share/locale|g' src/utils.rs
  sed -i "s|{data_home}/icons/$pkgname|/usr/share/icons/hicolor/symbolic/actions|g" src/utils.rs
}

build() {
  cd "BoxBuddyRS-$pkgver"

  # Use system gettext as gettext-sys crate fails with LTO enabled
  export GETTEXT_SYSTEM=true

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release

  # Make sure translations are compiled
  make translate
}

check() {
  cd "BoxBuddyRS-$pkgver"
  appstreamcli validate --no-net "${_app_id}.metainfo.xml"
  desktop-file-validate "${_app_id}.desktop"
}

package() {
  cd "BoxBuddyRS-$pkgver"
  install -Dm755 "target/release/$pkgname-rs" -t "$pkgdir/usr/bin/"
  install -Dm644 "${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "${_app_id}.gschema.xml" -t "$pkgdir/usr/share/glib-2.0/schemas/"
  install -Dm644 "${_app_id}.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 "icons/${_app_id}.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -Dm644 icons/build-alt-{symbolic,symbolic-light}.svg -t \
    "$pkgdir/usr/share/icons/hicolor/symbolic/actions/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

  cd po
  for lang in $(ls -d */); do
    install -Dm644 "${lang%%/}/LC_MESSAGES/${pkgname}rs.mo" -t \
      "$pkgdir/usr/share/locale/${lang%%/}/LC_MESSAGES/"
  done
}
