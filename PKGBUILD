# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=pkgx
pkgver=1.1.0
pkgrel=1
pkgdesc='Run Anything'
arch=('x86_64')
url='https://pkgx.sh'
license=('Apache')
depends=('gcc-libs' 'glibc')
makedepends=('deno')
options=('!strip') # stripping breaks the binary
install="${pkgname}.install"

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/pkgxdev/pkgx/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  'ca96b6f5379a7497be83839da6188800c74e4375b776b67cbe06ba2e29bc58fbf7f5db5c0d82aab110e2ce87cdcada4c62fbaf163f8577f3839e65528d4e427d'
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # See also:
  # https://github.com/pkgxdev/pkgx/blob/b25a84479b82daaa61f064306ae7ea8e56249587/.github/workflows/cd.yml#L33-L34
  cat > src/modes/version.ts << EOF
    export default function() {
      return '${pkgver}'
    }
EOF
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  /usr/bin/deno task compile
}

check() {
  cd "$(mktemp -d)"
  cat > hello.js << 'EOF'
    const middle="llo, w"
    console.log(`he${middle}orld`);
EOF
  stdout="$(
    PKGX_DIR="$(pwd)/.pkgx" "${srcdir}/${pkgname}-${pkgver}/pkgx" hello.js
  )"
  [[ "${stdout}" == 'hello, world' ]]
}

package() {
  echo >&2 'Packaging the executable'
  install -D -m 755 -t "${pkgdir}/usr/bin" \
    "${srcdir}/${pkgname}-${pkgver}/pkgx"

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    "${srcdir}/${pkgname}-${pkgver}/README.md"

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${srcdir}/${pkgname}-${pkgver}/LICENSE.txt"
}
