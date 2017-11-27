# Maintainer: Marc Mettke <mettke@itmettke.de>
pkgname=jetbrains-mps
_pkgname=mps
_pkgver=2017.2
pkgver=${_pkgver}.3
pkgrel=1
pkgdesc="JetBrains Meta Programming System"
arch=('any')
url="http://www.jetbrains.com/mps/index.html"
license=('custom: MPS license agreement')
depends=('jdk')

source=("https://download.jetbrains.com/mps/${_pkgver}/MPS-${pkgver}.tar.gz")
sha256sums=('a6521769d37071d854ec2ebd6acea6e1bc9d79da91375788f2205678805c8644')

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
StartupWMClass=${pkgname}
EOF
    ) > ${srcdir}/${pkgname}.desktop

  mkdir -p "${pkgdir}/opt/"
  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/share/applications/"
  mkdir -p "${pkgdir}/usr/share/pixmaps/"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"

  mv "${srcdir}/MPS ${_pkgver}" "${pkgdir}/opt/${pkgname}"
  install -Dm 755 "${srcdir}/mps" "${pkgdir}/usr/bin/mps"
  install -m 644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
  ln -s "/opt/${pkgname}/license/mps_license.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
}
