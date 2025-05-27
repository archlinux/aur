# Maintainer: yuf <yuf at yufarch dot com>

_electronver=34
pkgname='siki'
pkgver=0.34.7
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
sha512sums=('66eed0cc5f23de4e2d6559f39d91e98904bda1a9902324ca13045fdf3f73ef61675a59e34500917414b5159d022bbd556f0fcdea96746e93cdbac6df98a698f5'
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
