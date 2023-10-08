# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=pkgx
pkgver=1.0.1
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
  'a8b210ee6473ca71906f76536877aaf8045caeceeb6a743aa45a37d06262ad79feae6d21cc26984db6a982c7825051c4444a6f94370ba73ac52d44a31084dc86'
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
