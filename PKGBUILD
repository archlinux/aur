# Maintainer: Serge <arch@phnx47.net>

# Auto Upgrade: https://github.com/phnx47/pkgbuilds

pkgname=proto
pkgver=0.63.1
pkgrel=1
pkgdesc='Pluggable multi-language version manager'
arch=('x86_64' 'aarch64')
url='https://github.com/moonrepo/proto'
license=('MIT')
depends=('glibc' 'libgcc' 'git' 'unzip' 'gzip' 'xz')
optdepends=('rustup: support for Rust toolchains')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e37ff82eebcecd23c36818ffcbe54f10d2e28c924cfe3d55b24512573dce0520')

prepare() {
  cd "${pkgname}-${pkgver}"

  cargo fetch --locked --target host-tuple
  mkdir -p completions
}

build() {
  cd "${pkgname}-${pkgver}"

  if [[ ${CARCH} == x86_64 ]]; then
    CFLAGS+=' -ffat-lto-objects'
    CXXFLAGS+=' -ffat-lto-objects'
  fi

  # jitterentropy in aws-lc-sys fails with -O2 from CFLAGS
  export AWS_LC_SYS_CMAKE_BUILDER=1

  cargo build --release --frozen

  "./target/release/${pkgname}" completions --shell bash >"completions/bash"
  "./target/release/${pkgname}" completions --shell zsh >"completions/zsh"
  "./target/release/${pkgname}" completions --shell fish >"completions/fish"
  "./target/release/${pkgname}" completions --shell nushell >"completions/nushell"
  "./target/release/${pkgname}" completions --shell elvish >"completions/elvish"
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 755 "target/release/${pkgname}-shim" "${pkgdir}/usr/bin/${pkgname}-shim"

  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm 644 "completions/bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm 644 "completions/zsh" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -Dm 644 "completions/fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -Dm 644 "completions/nushell" "${pkgdir}/usr/share/nushell/vendor/autoload/${pkgname}.nu"
  install -Dm 644 "completions/elvish" "${pkgdir}/usr/share/elvish/lib/${pkgname}.elv"
}
