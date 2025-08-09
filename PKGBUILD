# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=mago
pkgver=1.0.0.alpha.2
_pkgver=1.0.0-alpha.2
pkgrel=1
pkgdesc="A CLI text viewer tool that works interactively like less command on small pane within the terminal window."
url="https://github.com/carthage-software/mago"
arch=('x86_64')
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'openssl' 'pkgconf')
source=("${pkgname}-${_pkgver}.tar.gz::https://github.com/carthage-software/mago/archive/refs/tags/${_pkgver}.tar.gz")
b2sums=('8df91c02dc8b24eae9ba6a32820536349f1a05314f269a9b1c4d883ffa8cf8d7a817efef7c09deca7d59fe0b8f99b61fee897b96eba2f2f970682ff6cf00502b')

prepare() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix $srcdir=src"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE-MIT
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE-APACHE
}
