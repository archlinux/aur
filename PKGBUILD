# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_name='RESTClient'
_pkgname='rest-client'
pkgname="${_pkgname}-bin"
pkgver=3.7.1
pkgrel=1
pkgdesc='Tool to test HTTP/RESTful webservices'
arch=('any')
url='https://github.com/wiztools/rest-client'
license=('APACHE')
depends=('hicolor-icon-theme' 'java-runtime')
makedepends=('imagemagick')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
noextract=("${_pkgname/-/}-cli-fat-${pkgver}.jar"
        "${_pkgname/-/}-ui-fat-${pkgver}.jar")
source=("${url}/releases/download/${pkgver}/${_pkgname/-/}-cli-fat-${pkgver}.jar"
        "${url}/releases/download/${pkgver}/${_pkgname/-/}-ui-fat-${pkgver}.jar"
        "${_pkgname}.png")
sha256sums=('f85f2c0d516f1834745e50567f6f347b30de0531a2aca8f5476f0f973f9fe819'
            'ea575df3f96841fbe6a294c04e0357a75f3541dab8d418e0f49e43a393a3daee'
            '6a00823d6a558919ff9c003546d09acab7f0b5b85bc003ebca9694618925e23d')

prepare() {
  echo -e "#!/bin/sh\ncd /usr/share/${_pkgname} && java -jar ./${_pkgname}-cli.jar" > "${_pkgname}-cli"
  echo -e "#!/bin/sh\ncd /usr/share/${_pkgname} && java -jar ./${_pkgname}-ui.jar" > "${_pkgname}-ui"
  cat << EOF > "${_pkgname}.desktop"
[Desktop Entry]
Name=${_name}
Comment=${pkgdesc}
Icon=${_pkgname}
Type=Application
Exec=${_pkgname}-ui
Categories=Development;
Encoding=UTF-8
EOF
}

package() {
  install -Dvm755 "${_pkgname}-cli" -t "${pkgdir}/usr/bin"
  install -Dvm755 "${_pkgname}-ui" -t "${pkgdir}/usr/bin"
  install -Dvm644 "${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"

  for i in 16 22 24 32 48 64 96 128 256 512; do
    convert "${_pkgname}.png" -resize "${i}x${i}" "icon${i}.png"
    install -Dvm644 "icon${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_pkgname}.png"
  done

  install -Dvm755 "${_pkgname/-/}-cli-fat-${pkgver}.jar" "${pkgdir}/usr/share/${_pkgname}/${_pkgname}-cli.jar"
  install -Dvm755 "${_pkgname/-/}-ui-fat-${pkgver}.jar" "${pkgdir}/usr/share/${_pkgname}/${_pkgname}-ui.jar"
}

# vim: ts=2 sw=2 et:
