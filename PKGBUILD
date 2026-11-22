# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=thom-cameron-isw
pkgver=0.3.8
pkgrel=1
_srcdir="isw-${pkgver}"
pkgdesc="A simple terminal stopwatch application for pomodoro etc"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/thom-cameron/isw"
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc')
makedepends=('cargo')
conflicts=('isw' 'isw-git')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/${pkgver}/isw-${pkgver}.tar.gz")
sha256sums=('f07cb24ba626889f4f0ed0c8049c5b74ce5370312f02ad01e31761445855e992')

prepare() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "${_srcdir}"
  install -Dm755 "target/release/isw" -t "${pkgdir}/usr/bin"
  install -Dm644 "license.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "readme.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
