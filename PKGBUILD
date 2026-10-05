# Maintainer: Serge <arch@phnx47.net>

# Auto Upgrade: https://github.com/phnx47/pkgbuilds

pkgname=moon
pkgver=2.6.0
pkgrel=1
pkgdesc='Task runner and repo management tool for the web ecosystem'
license=('MIT')
url="https://github.com/moonrepo/moon"
arch=('x86_64' 'aarch64')
depends=('glibc' 'libgcc')
makedepends=('cargo' 'cmake' 'protobuf')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('89bd2d1edf7552f7ab1b1d4c817b69a7f0d778dfe2a220799a6e96a4f4b03e76')

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

  install -Dm 755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm 755 "target/release/${pkgname}x" -t "${pkgdir}/usr/bin"

  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm 644 "completions/bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm 644 "completions/zsh" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -Dm 644 "completions/fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -Dm 644 "completions/nushell" "${pkgdir}/usr/share/nushell/vendor/autoload/${pkgname}.nu"
  install -Dm 644 "completions/elvish" "${pkgdir}/usr/share/elvish/lib/${pkgname}.elv"
}
