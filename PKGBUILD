# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
pkgname=librivox-checker
_pkgname=${pkgname/-/_}
pkgver=1.2alpha1
_pkgver=${pkgver/alpha/-alpha-}
pkgrel=1
pkgdesc='Validator for LibriVox audio files'
arch=('any')
url='https://cgjennings.ca/projects/checker/'
license=('MIT')
depends=('java-runtime' 'sh')
makedepends=('java-environment' 'ant' 'gendesk' 'desktop-file-utils')
checkdepends=('desktop-file-utils')
source=("${pkgname}-${_pkgver}.tar.gz::https://github.com/CGJennings/${pkgname}/archive/v${_pkgver}.tar.gz")
b2sums=('9944a01941cc9f0891b7bc0a6cd88becc7c18ee9e94f49994fac4de6a480fbeb21cf56f1f402399a1c38efecc34f502be903f9218254bce87d0929e6b0927ab5')

build() {
  cd "${pkgname}-${_pkgver}"
  export GRADLE_USER_HOME="${srcdir}/.gradle"
  ant -nouserlib -silent -quiet jar

  # Generate launcher script and .desktop file

  export _exec="java -jar ${_pkgname}.jar"
  export _name="LibriVox Checker"
  export _path="/usr/share/${pkgname}"
  export _mimetypes='audio/mpeg;audio/x-mp3;audio/x-mpeg;inode/directory;application/x-zip;application/x-zip-compressed;application/zip'
  export _categories='Utility;AudioVideo;Audio;Java'

  echo '#!/bin/sh' > "${_pkgname}.sh"
  echo "cd ${_path}" >> "${_pkgname}.sh"
  echo "exec ${_exec}" >> "${_pkgname}.sh"

  gendesk -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --path "${_path}"
}

package(){
  cd "${pkgname}-${_pkgver}"
  install -Dm644 'dist/librivox_checker.jar' "${pkgdir}/usr/share/${pkgname}/librivox_checker.jar"
  install -Dm644 'README.md' "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 'LICENSE.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

  install -Dm644 "src/resources/pass.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${pkgname}.png"
  install -Dm644 "src/resources/pass@2x.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname}.png"
  install -Dm644 "src/resources/pass@4x.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"

  install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
  ln -s "${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  desktop-file-install --dir="${pkgdir}/usr/share/applications" "${pkgname}.desktop"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

check(){
  cd "${pkgname}-${_pkgver}"
  desktop-file-validate "${pkgname}.desktop"
}
