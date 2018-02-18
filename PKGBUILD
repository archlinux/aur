# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor:

pkgname=znapzupport
pkgver=0.0.7
pkgrel=1
pkgdesc='Collection of CLI helpers for ZnapZend'
arch=('any')
url='https://github.com/claui/znapzupport'
license=('custom:ISC')
depends=('bash' 'coreutils' 'sudo' 'zfs')
optdepends=('znapzend')
options=('!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/claui/znapzupport/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  '52db783cf04b70bac1090c00f9bff087674a8b53bbff01205db2b4c9d6b69233a0faa3b6cbdcf5ad66eddb84f5774e7ee2b84e4e3b5e5436465e07a6f5e419f7'
)

noextract=("${pkgname}-${pkgver}.tar.gz")

prepare() {
  mkdir -p "${srcdir}/${pkgname}-${pkgver}"
  tar -x \
    -f "${srcdir}/${pkgname}-${pkgver}.tar.gz" -z \
    -C "${srcdir}/${pkgname}-${pkgver}" \
    --strip-components=1
}


build() {
  # Prepare binstub
  mkdir -p "${srcdir}"
  printf '#!/bin/bash\n%s\n' > "${srcdir}/binstub" \
    'exec "/usr/lib/'"${pkgname}"'/bin/$(basename "${0}")" "$@"'
}

package() {
  msg2 'Installing the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${srcdir}/${pkgname}-${pkgver}/LICENSE.md"

  msg2 'Installing package files'
  mkdir -p "${pkgdir}/usr/lib/${pkgname}"
  cp -r --preserve=mode -t "${pkgdir}/usr/lib/${pkgname}" \
    "${srcdir}/${pkgname}-${pkgver}/"{bin,libexec}

  msg2 'Installing binstubs'
  find "${srcdir}/${pkgname}-${pkgver}/bin" \
    -mindepth 1 \
    -exec bash -c "install -D -m 755 -T \"${srcdir}\"/binstub`
      ` \"${pkgdir}\"/usr/bin/\$(basename '{}')" ';'

  msg2 'Installing documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    "${srcdir}/${pkgname}-${pkgver}/README.md"
}
