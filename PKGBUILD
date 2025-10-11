# Maintainer: teraflops <cprieto.ortiz@gmail.com>
_pkgname=cliui
pkgname=nodejs-${_pkgname}
pkgver=9.0.1
pkgrel=1
pkgdesc="Easily create complex multi-column command-line interfaces (cliui library)"
arch=('any')
url="https://github.com/yargs/cliui"
license=('ISC')
depends=('nodejs')
makedepends=('npm')
source=("${_pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_pkgname}/-/${_pkgname}-${pkgver}.tgz")
sha256sums=('SKIP') 

prepare() {
  rm -rf "${srcdir}/pkgsrc"
  mkdir -p "${srcdir}/pkgsrc"
  tar -xzf "${srcdir}/${_pkgname}-${pkgver}.tgz" -C "${srcdir}/pkgsrc" --strip-components=1 package
}

package() {
  local dest="${pkgdir}/usr/lib/node_modules/${_pkgname}"
  install -d "${dest}"

  cp -a "${srcdir}/pkgsrc/." "${dest}/"

  find "${dest}" -type f -name "*.md" -o -name "*.markdown" -o -name "*.map" -print0 | xargs -0r rm -f -- || true

  if [[ -f "${dest}/LICENSE" ]]; then
    install -Dm644 "${dest}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  else
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    printf 'ISC\n' > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}

