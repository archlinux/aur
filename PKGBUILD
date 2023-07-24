# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=mission-center
pkgver=0.2.5
pkgrel=2
pkgdesc="Monitor your CPU, Memory, Disk, Network and GPU usage"
arch=('x86_64')
url="https://gitlab.com/mission-center-devs/mission-center"
license=('GPL3')
depends=('dmidecode' 'libadwaita')
makedepends=('blueprint-compiler' 'cargo' 'meson')
checkdepends=('appstream-glib')
options=('!lto')
_commit=9a8458b541a195a0c5cadafb66e240962c852b39
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz"
        "nvtop-$_commit.tar.gz::https://github.com/Syllo/nvtop/archive/$_commit.tar.gz")
sha256sums=('81bdc5245b23f0d1e9c8e9321894c1dee5f3c6cf5f2388bbf04785a692087923'
            '290542e3c2203613e18faaa769dcc5479b170c39acbe71c976a7e86ff03ea1a7')

prepare() {
  cd "$pkgname-v$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"

  cp -rf "$srcdir/nvtop-$_commit" subprojects/
  cd "subprojects/nvtop-$_commit"
  find ../packagefiles -type f -name 'nvtop-*' -exec sh -c 'patch -p1 < {}' \;
}

build() {
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "$pkgname-v$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
