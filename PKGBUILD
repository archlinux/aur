# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor:

pkgname=znapzupport
pkgver=0.1.3
pkgrel=1
pkgdesc='Collection of CLI helpers for ZnapZend'
arch=('any')
url='https://github.com/claui/znapzupport'
license=('custom:ISC')
depends=('bash' 'coreutils' 'procmail' 'sudo' 'zfs')
optdepends=('znapzend')
options=('!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/claui/znapzupport/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  '184015648ba068dc02e93c57f3c3430905474742623779a81d6cb945dfc1e27285ceb8e45e09a057df2c868661aa487e82bd0363471ab34e95ee7b906080ba63'
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
  echo >&2 'Installing the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${srcdir}/${pkgname}-${pkgver}/LICENSE.md"

  echo >&2 'Installing package files'
  mkdir -p "${pkgdir}/usr/lib/${pkgname}"
  cp -r --preserve=mode -t "${pkgdir}/usr/lib/${pkgname}" \
    "${srcdir}/${pkgname}-${pkgver}/"{bin,libexec}

  echo >&2 'Installing binstubs'
  find "${srcdir}/${pkgname}-${pkgver}/bin" \
    -mindepth 1 \
    -exec bash -c "install -D -m 755 -T \"${srcdir}\"/binstub`
      ` \"${pkgdir}\"/usr/bin/\$(basename '{}')" ';'

  echo >&2 'Installing documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    "${srcdir}/${pkgname}-${pkgver}/README.md"
}
