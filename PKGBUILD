# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=sleipnirgroup-choreo-git
pkgver=2025.0.3.r74.ge9d22fa
pkgrel=1
pkgdesc="A graphical tool for planning time-optimized trajectories for autonomous mobile robots in the FIRST Robotics Competition"
arch=('x86_64')
url='https://github.com/SleipnirGroup/Choreo'
depends=('webkit2gtk-4.1')
makedepends=('cargo' 'cmake' 'pnpm')
license=('BSD')
provides=('sleipnirgroup-choreo')
conflicts=('sleipnirgroup-choreo')
source=("git+https://github.com/SleipnirGroup/Choreo.git")
sha256sums=('SKIP')

pkgver() {
  cd Choreo
  printf "$(git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

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
  cd Choreo

  _pkgver=$(git describe --tags --abbrev=0 | sed 's/^v//g')
  ar x src-tauri/target/release/bundle/deb/Choreo_${_pkgver}_amd64.deb data.tar.gz
  tar -C "$pkgdir" -xf data.tar.gz
}
