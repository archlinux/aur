# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="aescrypt"
pkgname="${_pkgname}-bin"
pkgver=4.3.0
pkgrel=1
pkgdesc="A file encryption software that uses the Advanced Encryption Standard (AES)"
arch=('x86_64')
url="https://www.aescrypt.com"
_url="https://github.com/terrapane/aescrypt_cli"
license=('custom:Commercial')
depends=('gcc-libs' 'glibc')
makedepends=('gzip')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-CHANGELOG.md::${_url}/raw/refs/tags/v${pkgver}/CHANGELOG.md"
        "${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/download/v${pkgver%%.*}/linux/${_pkgname}_cli-${pkgver}-Linux-x86_64.tar.gz"
               "${_pkgsrc}-x86_64.tar.gz.sig::${url}/download/v${pkgver%%.*}/linux/${_pkgname}_cli-${pkgver}-Linux-x86_64.tar.gz.sig")
sha256sums=('ef51e9845693fdacb2b0f8d9bfab21b109a3e2a88b326410f71471465a79d308'
            'c9b06b56f152e47f66302282998ae8939024f1db27280cf22840b1c49ef204bb')
sha256sums_x86_64=('acbe31532219b85763743d6c8c6a735c3fc6fcc328f921fbaf5cd9813e4bc4c3'
                   'SKIP')
validpgpkeys=('C264DC0F1C13A4BB18CAAF1BE7BE982BCD50DDF4') # Terrapane Support <support@terrapane.com> (https://www.aescrypt.com/download/)

prepare() {
  cd "${srcdir}/${_pkgname}_cli-${pkgver}-Linux-${CARCH}"
  find . -type f -name '*.gz' -exec \
    gzip -fd "{}" \;

  cd "share/licenses"
  rm -rf "${_pkgname}" 
  mv "${_pkgname}_cli" "${_pkgname}" 
}

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}-CHANGELOG.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
  install -vDm644 "${_pkgsrc}-README.md"    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  
  cd "${_pkgname}_cli-${pkgver}-Linux-${CARCH}"
  find "bin"   -type f -exec install -vDm755 "{}" "${pkgdir}/usr/{}" \;
  find "share" -type f -exec install -vDm644 "{}" "${pkgdir}/usr/{}" \;
}
