# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
pkgname=librivox-checker
_pkgname=${pkgname/-/_}
pkgver=1.1
pkgrel=1
pkgdesc='Validator for LibriVox audio files'
arch=('any')
url='https://cgjennings.ca/projects/checker/'
license=('MIT')
depends=('java-runtime' 'sh')
makedepends=('java-environment' 'ant' 'gendesk' 'desktop-file-utils')
checkdepends=('desktop-file-utils')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/CGJennings/${pkgname}/archive/v${pkgver}.tar.gz")
b2sums=('c914571e85d62d6bae495fc369f040500d01383c98a041f30c971c6b3235e5a26a8a62f5c2d4efd613005cd1c1fc57ce519fbdae1a839bcb4b3c3d6df164ef01')

build() {
  cd "${pkgname}-${pkgver}"
  export GRADLE_USER_HOME="${srcdir}/.gradle"
  ant -nouserlib -silent -quiet jar

  # Generate launcher script and .desktop file

  export _exec="java -jar ${_pkgname}.jar"
  export _name="LibriVox Checker"
  export _path="/usr/share/${pkgname}"
  # librivox-checker doesn’t currently support being started with file arguments
  # See https://github.com/CGJennings/librivox-checker/issues/4
  #export _mimetypes='audio/mpeg;audio/x-mp3;audio/x-mpeg;inode/directory;application/x-zip;application/x-zip-compressed;application/zip'
  export _categories='Utility;AudioVideo;Audio;Java'

  echo '#!/bin/sh' > "${_pkgname}.sh"
  echo "cd ${_path}" >> "${_pkgname}.sh"
  echo "exec ${_exec}" >> "${_pkgname}.sh"

  gendesk -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --path "${_path}"
}

package(){
  cd "${pkgname}-${pkgver}"
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
  cd "${pkgname}-${pkgver}"
  desktop-file-validate "${pkgname}.desktop"
}
