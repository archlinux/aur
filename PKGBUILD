# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor:

pkgname=znapzupport
pkgver=0.0.13
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
  '2fbf81631907e216d4b8292c1b02f0207de5c16b8cf0bd6ce57be670294b995f070818c341b54ba8344755da0d7196b1f183d21cf88d4bc9838c321d04b453ff'
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
