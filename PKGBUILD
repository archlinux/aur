# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor:

pkgname=znapzupport
pkgver=0.0.8
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
  '1490cbb44a4ea96439a9ed6de3012324ac3f4fc1b2efe530e996c7dc1071b0c209f17f25f7e9baf19a9d4a41b8380a1e65384506cc1d8acc88fe63c8ffc8125e'
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
