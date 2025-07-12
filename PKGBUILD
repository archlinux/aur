# Maintainer: yuf <yuf at yufarch dot com>

_electronver=36
pkgname='siki'
pkgver=0.36.0
pkgrel=1
pkgdesc='An Electrom-based application for browsing and posting to message boards'
arch=('x86_64')
url='https://sikiapp.net'
license=('MIT')
depends=(
  "electron${_electronver}"
)
options=(!debug)
_archive="${pkgname}-${pkgver}"
source=(
  "${_archive}-amd64.deb::${url}/archives/${pkgver}/${pkgname^}-${pkgver}-amd64.deb"
  "${pkgname}.sh"
)
noextract=("${_archive}-amd64.deb")
sha512sums=('465f442499396b823aa075b3b3f259c12f141add2dbe1f053573f3adc839ca9b8514ac9ec2ef7bc0fe6fbc7dc3fd0ae972192e3eeda302d12b021624281f337a'
            'd7548b3f81e5fbac18470c96a998fc73657c7d6a659d56b82a68291407c07ebe448dfc318f507b8ad6da831bc73d47336248484da7f05642875e994c7e42803e')

prepare() {
  sed -i "s/@ELECTRON_VERSION@/${_electronver}/" "${pkgname}".sh

  # Extract
  mkdir -p "${_archive}"
  bsdtar -xf "${_archive}"-amd64.deb -C "$_archive"
  bsdtar -xf "${_archive}"/data.tar.xz

  sed -e "
    s/\/opt\/${pkgname^}\/${pkgname}/${pkgname}/g
    s/\(Comment=\).*/\1${pkgdesc}/g
  " -i "${srcdir}/usr/share/applications/${pkgname}.desktop"
}

package() {
  install -vDm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "${srcdir}/opt/${pkgname^}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
  install -vDm755 "${srcdir}/opt/${pkgname^}/locales/"* -t "${pkgdir}/usr/lib/${pkgname}/locales"
  install -vDm644 "${srcdir}/usr/share/applications/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -vDm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # Install licenses
  install -vDm644 "${srcdir}/opt/${pkgname^}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
  _copyright=$(curl -sL ${url}/license | sed -n 's/<p>\(Copyright.*\)<\/p>/\1/p')
  sed "1i ${_copyright}\n" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt" > LICENSE
  install -vDm644 "${srcdir}"/LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"
}
