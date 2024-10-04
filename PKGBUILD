# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=pkgx
pkgver=1.2.2
pkgrel=1
pkgdesc='Run Anything'
arch=('x86_64')
url='https://pkgx.sh'
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('deno')
options=('!strip') # stripping breaks the binary
install="${pkgname}.install"

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/pkgxdev/pkgx/archive/v${pkgver}.tar.gz"
)

sha512sums=('5818ca2914a880064cae9f2c40413b0e41b3f675b4c6164a8a4ba961cdff50ca9d235ba5851a8723c1cf59f3516a5a1a545f3a226867b1edf482b478be803cb9')

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
