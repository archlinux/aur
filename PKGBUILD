# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cedilla
pkgver=0.1.6
pkgrel=1
pkgdesc="A markdown text editor for the COSMIC™ desktop"
arch=('x86_64' 'aarch64')
url="https://github.com/mariinkys/cedilla"
license=('GPL-3.0-or-later')
depends=(
  'fontconfig'
  'hicolor-icon-theme'
  'libxkbcommon'
)
makedepends=(
  'cargo'
  'just'
)
checkdepends=(
  'appstream'
  'desktop-file-utils'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e3633eb93760553e008bb11a66ea040489e52984f5e2971320de3630be0cb91c')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver"
  CFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  just build-release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  appstreamcli validate --no-net resources/app.metainfo.xml
  desktop-file-validate resources/app.desktop
}

package() {
  cd "$pkgname-$pkgver"
  just rootdir="$pkgdir" install
}
