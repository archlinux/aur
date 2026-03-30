# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=pkgx
pkgver=2.10.3
pkgrel=2
pkgdesc='Run Anything'
arch=('x86_64')
url='https://pkgx.sh'
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'xz')
makedepends=('cargo')
options=('!lto')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/pkgxdev/pkgx/archive/v${pkgver}.tar.gz"
)

sha512sums=('01be6cf9284718348682f568600dd9dd46dd331fca757d030c79ab3f80e9649770703ed33eebed8020807b9ff42ad0433eca5962773e6ef4dd7babede2d5eb1f')

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
