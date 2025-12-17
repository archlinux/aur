# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=keep-me-awake
_app_id=de.swsnr.keepmeawake
pkgver=1.0.5
pkgrel=1
pkgdesc="Inhibit screensaver and suspend in GNOME"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/swsnr/keep-me-awake"
license=('EUPL-1.2')
depends=(
  'gtk4'
  'libadwaita'
)
makedepends=(
  'blueprint-compiler'
  'cargo'
  'git'
  'just'
)
source=("git+https://codeberg.org/swsnr/keep-me-awake.git#tag=v$pkgver")
sha256sums=('0cc1b5c8845a5ced4e34e2494b64e0f4fcdeebc2c81fd56655e25957fcf88d12')

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  just APPID="${_app_id}" compile
  cargo build --frozen --release
}

check() {
  cd "$pkgname"
  appstreamcli validate --no-net "${_app_id}.metainfo.xml"
  desktop-file-validate "${_app_id}.desktop"
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
  ln -s "/usr/bin/$pkgname" "$pkgdir/usr/bin/${_app_id}"
  install -Dm644 "build/${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "build/${_app_id}.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 "build/${_app_id}.service" -t "$pkgdir/usr/share/dbus-1/services/"
  install -Dm644 resources/icons/scalable/actions/*.svg -t \
    "$pkgdir/usr/share/icons/hicolor/scalable/actions/"
  install -Dm644 "resources/icons/scalable/apps/${_app_id}.svg" -t \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -Dm644 "resources/icons/symbolic/apps/${_app_id}-symbolic.svg" -t \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
