# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_name='RESTClient'
_pkgname='rest-client'
pkgname="${_pkgname}-bin"

pkgver=3.7.1
pkgrel=2
_commit_icon='bd592d85340958b72776569a67a0d8ebfa4ab15b'

pkgdesc='Tool to test HTTP/RESTful webservices'
arch=('any')
url='https://github.com/wiztools/rest-client'
license=('APACHE')
depends=('hicolor-icon-theme' 'java-runtime')
makedepends=('gendesk' 'imagemagick' 'libicns')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
noextract=("${_pkgname/-/}-cli-fat-${pkgver}.jar"
        "${_pkgname/-/}-ui-fat-${pkgver}.jar")
source=("${url}/releases/download/${pkgver}/${_pkgname/-/}-"{'cli','ui'}"-fat-${pkgver}.jar"
        "${_pkgname}-${pkgver}-icon::${url}/raw/${pkgver}/${_pkgname/-/}-ui/src/main/app-resources/${_pkgname}_30.icns")
sha256sums=('f85f2c0d516f1834745e50567f6f347b30de0531a2aca8f5476f0f973f9fe819'
            'ea575df3f96841fbe6a294c04e0357a75f3541dab8d418e0f49e43a393a3daee'
            '173cfd6c315b7e85dea2d7afb8c1d6ea0c4ece3014a1a7e5b4153bef3156ad77')

prepare() {
  echo -e "#!/bin/sh\nexec java -jar /usr/share/${_pkgname}/${_pkgname}-cli.jar \"\$@\"" > "${_pkgname}-cli"
  echo -e "#!/bin/sh\nexec java -jar /usr/share/${_pkgname}/${_pkgname}-ui.jar \"\$@\"" > "${_pkgname}-ui"
  gendesk -f -n \
    --pkgname="${_pkgname/-/_}" \
    --pkgdesc="${pkgdesc}" \
    --name="${_name}" \
    --comment="${pkgdesc}" \
    --exec="${_pkgname}-ui" \
    --icon="${_pkgname}" \
    --categories='Development'
}

package() {
  install -Dvm755 "${_pkgname}-cli" -t "${pkgdir}/usr/bin"
  install -Dvm755 "${_pkgname}-ui" -t "${pkgdir}/usr/bin"
  install -Dvm644 "${_pkgname/-/_}.desktop" -t "${pkgdir}/usr/share/applications"

  icns2png -xs 1024 -- "${_pkgname}-${pkgver}-icon"
  for i in 16 22 24 32 48 64 96 128 256 512; do
    convert "${_pkgname}-"*'_1024x1024x32.png' -resize "${i}x${i}" "icon${i}.png"
    install -Dvm644 "icon${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_pkgname}.png"
  done

  install -Dvm755 "${_pkgname/-/}-cli-fat-${pkgver}.jar" "${pkgdir}/usr/share/${_pkgname}/${_pkgname}-cli.jar"
  install -Dvm755 "${_pkgname/-/}-ui-fat-${pkgver}.jar" "${pkgdir}/usr/share/${_pkgname}/${_pkgname}-ui.jar"
}

# vim: ts=2 sw=2 et:
