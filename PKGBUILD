# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=launcher-studio
_app_id=fr.arnaudmichel.launcherstudio
pkgver=0.1.2
pkgrel=1
pkgdesc="A GTK4 desktop application for creating and managing .desktop files"
arch=('x86_64')
url="https://arnaudmichel.fr/projects/launcher-studio"
license=('MIT')
depends=(
  'gtk4'
  'libadwaita'
)
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MrArnaudMichel/launcher_studio/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('871e926ecd4e8349f17f8c226292f06fe6a8b9df1252d30008fb727fc6e58359')

prepare() {
  cd "launcher_studio-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "launcher_studio-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "launcher_studio-$pkgver"
  appstreamcli validate --no-net "data/${_app_id}.metainfo.xml"
  desktop-file-validate "data/${_app_id}.desktop"
}

package() {
  cd "launcher_studio-$pkgver"
  install -Dm755 target/release/launcher_studio -t "$pkgdir/usr/bin/"
  install -Dm644 "data/${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "data/${_app_id}.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 "assets/icons/${_app_id}.png" -t \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/"
  install -Dm644 assets/icons/"$pkgname"-weather-{night,sunny}-symbolic.svg -t \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
