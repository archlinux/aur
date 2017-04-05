# Maintainer: Marc Mettke <mettke@itmettke.de>

pkgname=jetbrains-mps
_pkgname=mps
_pkgnumber=34
_pkgvermajor=3.4
pkgver=${_pkgvermajor}.4
pkgrel=162.2317
pkgdesc="JetBrains Meta Programming System"
arch=('any')
url="http://www.jetbrains.com/mps/index.html"
license=('custom: MPS license agreement')
depends=('jdk')

source=("http://download.jetbrains.com/mps/${_pkgnumber}/MPS-${pkgver}.tar.gz")
sha256sums=('538966783399dd3b17b9c470c2554bd1eec7c1936305d94e08ccf9c0f9d50601')

build() {
  cd "${srcdir}"
  echo "#!/bin/sh" > mps
  echo "JDK_HOME=/usr/lib/jvm/java-8-jdk /opt/${pkgname}/bin/mps.sh" >> mps
}

package() {
  (
    cat <<EOF
[Desktop Entry]
Type=Application
Version=1.0
Name=${_pkgname}
GenericName=${pkgname}
Comment=${pkgdesc}
Icon=/opt/${pkgname}/bin/MPS_128.png
Exec="/usr/bin/${_pkgname}" %f
Terminal=false
Categories=Development;IDE;
StartupNotify=true
StartupWMClass=jetbrains-${_pkgname}
EOF
    ) > ${startdir}/${pkgname}.desktop

  mkdir -p "${pkgdir}/opt/"
  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/share/applications/"
  mkdir -p "${pkgdir}/usr/share/pixmaps/"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"

  mv "${srcdir}/MPS ${_pkgvermajor}" "${pkgdir}/opt/${pkgname}"
  install -Dm 755 "${srcdir}/mps" "${pkgdir}/usr/bin/mps"
  install -m 644 "${startdir}/jetbrains-${_pkgname}.desktop" "${pkgdir}/usr/share/applications/"
  ln -s "/opt/${pkgname}/license/mps_license.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
}
