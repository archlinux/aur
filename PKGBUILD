# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=pkgx
pkgver=2.9.0
pkgrel=1
pkgdesc='Run Anything'
arch=('x86_64')
url='https://pkgx.sh'
license=('Apache-2.0')
depends=('gcc-libs' 'glibc' 'xz')
makedepends=('cargo')
options=('!lto')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/pkgxdev/pkgx/archive/v${pkgver}.tar.gz"
)

sha512sums=('160fb69e4b572d14b944d8d197451307e9771edb5c912f23c0aea366d6be5421a016de32cb85f9f0aeee5f8c6c462b495a57648e8ff30157f49d776b4460a37d')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  echo >&2 'Downloading dependencies'
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  echo >&2 'Building executable'
  cargo build --frozen --release --all-features
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features

  cd "$(mktemp -d)"
  cat > hello.js << 'EOF'
    const middle="llo, w"
    console.log(`he${middle}orld`);
EOF
  stdout="$(
    env -i PKGX_DIR="$(pwd)/.pkgx" \
      "${srcdir}/${pkgname}-${pkgver}/target/release/pkgx" \
      node hello.js
  )"
  [[ "${stdout}" == 'hello, world' ]]
}

package() {
  echo >&2 'Packaging the executable'
  install -D -m 755 -t "${pkgdir}/usr/bin" \
    "${srcdir}/${pkgname}-${pkgver}/target/release/pkgx"

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    "${srcdir}/${pkgname}-${pkgver}/README.md"

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${srcdir}/${pkgname}-${pkgver}/LICENSE.txt"
}
