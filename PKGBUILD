# Maintainer: Marc Mettke <mettke@itmettke.de>
pkgname=jetbrains-mps
_pkgname=mps
_pkgver=2019.3
pkgver=${_pkgver}
pkgrel=1
pkgdesc="JetBrains Meta Programming System"
arch=('any')
url="http://www.jetbrains.com/mps/index.html"
license=('custom: MPS license agreement')
depends=('java-environment' 'libxslt' 'gtk2' 'libglvnd' 'libxtst' 'alsa-lib')
optdepends=('python: support for scripts like restart.py'
            'ffmpeg0.10: Multimedia plugin')

source=("https://download.jetbrains.com/mps/${_pkgver}/MPS-${pkgver}.tar.gz")
sha256sums=(
	'231141ca4809d96d877b362f95ff9f1878eb615cbbe9d448327425d73ed51e17'
)

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
