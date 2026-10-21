# Maintainer: AuthenticSm1les <khidarlaminehamdi@gmail.com>
pkgname=tasks
_app_id=dev.edfloreshz.Tasks
pkgver=0.3.1
pkgrel=1
pkgdesc="A simple task management application for the COSMIC desktop"
arch=('x86_64' 'aarch64')
url="https://github.com/cosmic-utils/tasks"
license=('GPL-3.0-only')
depends=(
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'libxkbcommon'
)
makedepends=(
  'cargo'
  'git'
  'just'
)
checkdepends=(
  'appstream'
  'desktop-file-utils'
)
conflicts=('cosmic-tasks')
source=("git+https://github.com/cosmic-utils/tasks.git#tag=$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"
  CFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  just build-release --frozen
}

check() {
  cd "$pkgname"
  appstreamcli validate --no-net "res/${_app_id}.metainfo.xml"
  desktop-file-validate "res/${_app_id}.desktop"
}

package() {
  cd "$pkgname"
  just rootdir="$pkgdir" install
}
