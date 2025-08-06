# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=sleipnirgroup-choreo
pkgver=2025.0.3
pkgrel=3
pkgdesc="A graphical tool for planning time-optimized trajectories for autonomous mobile robots in the FIRST Robotics Competition"
arch=('x86_64')
url='https://github.com/SleipnirGroup/Choreo'
depends=('webkit2gtk')
makedepends=('cargo' 'cmake' 'pnpm')
license=('BSD')
source=("git+https://github.com/SleipnirGroup/Choreo.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd Choreo

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  # Fix beforeBundleCommand command
  sed -i 's!node copy-sidecar.cjs choreo-cli ./target!cp ./src-tauri/target/release/choreo-cli ./src-tauri/target/release/choreo-cli-x86_64-unknown-linux-gnu!' src-tauri/tauri.conf.json

  # Remove unwanted bundle targets
  sed -i 's/\"appimage\", //' src-tauri/tauri.conf.json
  sed -i 's/, \"rpm\"//' src-tauri/tauri.conf.json

  # Fix externalBin name
  sed -i 's!../target/choreo-cli!./target/release/choreo-cli!' src-tauri/tauri.conf.json

  pnpm install
}

build() {
  cd Choreo

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  pnpm run tauri build -- --frozen --all-features --workspace
}

package() {
  ar x Choreo/src-tauri/target/release/bundle/deb/choreo_${pkgver}_amd64.deb data.tar.gz
  tar -C "$pkgdir" -xf data.tar.gz
}
