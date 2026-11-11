# Maintainer: René Preuß <hello@ghostzero.de>
pkgname=gleem-crossfade
_pkgsrc=crossfade
pkgver=0.10.0
pkgrel=1
pkgdesc="Dual-mix virtual audio mixer for PipeWire"
arch=('x86_64' 'aarch64')
url="https://github.com/gleem-gg/crossfade"
license=('Apache-2.0')
depends=('gtk4' 'libadwaita' 'libpulse' 'alsa-lib' 'pipewire-pulse' 'hicolor-icon-theme')
makedepends=('cargo')
checkdepends=('desktop-file-utils')
optdepends=('lilv: LV2 effect plugin browser'
            'carla: VST2/VST3 effect support'
            'python: required by the Carla VST host helper')
# This package was published as "openwave-mixer" before 0.8.0
provides=('openwave-mixer')
conflicts=('openwave-mixer')
replaces=('openwave-mixer')
source=("$_pkgsrc-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('778832ffbe6a4d2ac36798c96af70837a8f46ca9b7dd4c030d814aa040cb7c37')

prepare() {
  cd "$_pkgsrc-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgsrc-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release
}

check() {
  cd "$_pkgsrc-$pkgver"
  desktop-file-validate data/gg.gleem.Crossfade.desktop
}

package() {
  cd "$_pkgsrc-$pkgver"
  install -Dm755 target/release/gleem-crossfade "$pkgdir/usr/bin/gleem-crossfade"
  install -Dm644 data/gg.gleem.Crossfade.desktop \
    "$pkgdir/usr/share/applications/gg.gleem.Crossfade.desktop"
  install -Dm644 data/icons/hicolor/scalable/apps/gg.gleem.Crossfade.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/gg.gleem.Crossfade.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
