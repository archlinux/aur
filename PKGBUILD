# Maintainer: Javier Tia <floss@jetm.me>
_pkgauthor=avocado-linux
pkgname=avocado-cli
pkgver=1.2.0
pkgrel=1
pkgdesc='Command line interface for Avocado Linux'
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${pkgname}"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('rust' 'cmake' 'clang')
provides=('avocado')
# makepkg's LTO appends -flto to CFLAGS; aws-lc-sys then compiles its bundled
# libcrypto into GCC fat-LTO objects, which rustc's lld link can't resolve
# (undefined aws_lc_* symbols). Disabling LTO keeps aws-lc's C symbols real.
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('e5b0860297502d40a52d4159391c7c979401ecdd797c70807dbffb66a2e6ad62')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # avocado-cli commits Cargo.lock; --locked keeps the build reproducible.
  # rustls pulls aws-lc-sys, which needs cmake + a C compiler at build time.
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 target/release/avocado "${pkgdir}/usr/bin/avocado"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=PKGBUILD ts=2 sw=2 et:
