# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cedilla
pkgver=0.1.3
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
  'setconf'
  'just'
)
checkdepends=(
  'appstream'
  'desktop-file-utils'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('71d437e39e88fee85ff2e012d43d329f3291b6432de629125bc4143964538357')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"

  # Fix icon-svg-dst path in justfile
  setconf justfile icon-svg-dst " := icons-dst / 'scalable' / 'apps' / icon-svg"
}

build() {
  cd "$pkgname-$pkgver"
  CFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable

  # https://github.com/aws/aws-lc-rs/issues/1008#issuecomment-3774105038
  export AWS_LC_SYS_NO_JITTER_ENTROPY=1

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
