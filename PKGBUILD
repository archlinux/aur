# Maintainer: Rafael Silva <perigoso@riseup.net>

pkgname='bmputil'
pkgver=0.1.2
pkgrel=1
pkgdesc='A management utility for debuggers running the Black Magic Debug firmware'
arch=('any')
url='https://github.com/blackmagic-debug/bmputil'
license=('MIT OR Apache-2.0')
makedepends=('rust' 'cargo')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz"
        '0001-fix-cargo-lock-version.patch')
b2sums=('0caf23592a8d7d9da594e2362679f9fdcf188a8dfd231b3c2449a49a530eedb44e43cb823fcd9db49463f5cc913bd8d895ea8ca1de2e543b624702dccdaff75f'
        '703be7fdf02fccc79f95acda8fc06746c5239debeb28856ede64ab1c85fecab6acda132323863e5927816cd580a919de8c933b04a0e9d8c58729f9383322b86e')

prepare() {
  cd "${pkgname}-${pkgver}"

  patch --forward --strip=1 --input="${srcdir}/0001-fix-cargo-lock-version.patch"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --no-default-features
}

# No tests implemented
# check() {
#   cd "${pkgname}-${pkgver}"

#   export RUSTUP_TOOLCHAIN=stable
#   cargo test --frozen --no-default-features
# }

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm 755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
