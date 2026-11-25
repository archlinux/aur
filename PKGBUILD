pkgname=strength-coach-for-garmin
pkgver=5.3.0
pkgrel=1
pkgdesc='Sync your devices and track your strength training'
arch=('x86_64')
url="https://github.com/Emiliopg91/${pkgname}"
license=('GPL-3.0-or-later')

source=(
  "git+$url.git#tag=$pkgver"
)
sha256sums=(
  'SKIP'
)

depends=('libnotify' 'sudo' 'webkit2gtk-4.1' 'xdg-utils' 'zlib-ng-compat')
optdepends=('rclone: export to Dropbox and OneDrive')
makedepends=('mold' 'npm' 'pnpm' 'python-toml' 'python-yaml' 'rust' 'sccache')

conflicts=('garmin-tracker-rs' 'strength-tracker-rs')
replaces=('garmin-tracker-rs' 'strength-tracker-rs')

install=${pkgname}.install

build() {
  cd "$srcdir/${pkgname}"

  export RUSTC_WRAPPER=sccache
  export CARGO_BUILD_JOBS=$(nproc)

  if [ -z "$GITHUB_ACTIONS" ] && [ -z "$CI" ]; then
    export RUSTFLAGS="-C target-cpu=native -C link-arg=-fuse-ld=mold"
  else
    export RUSTFLAGS="-C link-arg=-fuse-ld=mold"
  fi

  make build
}

package() {
  cd "$srcdir/${pkgname}/src-tauri/target/release/bundle/deb"
  cp -a Strength\ Coach\ for\ Garmin_${pkgver}_*/data/* "${pkgdir}"

  cd "$srcdir/${pkgname}/resources"
  install -Dm555 strength-coach-for-garmin-launcher.sh "$pkgdir/usr/share/strength-coach-for-garmin/strength-coach-for-garmin-launcher.sh"
}