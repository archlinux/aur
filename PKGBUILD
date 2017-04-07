# Maintainer: Samuel Fernando Mesa <samuelmesa@linuxmail.org> 
# Based on script of KaOS: https://github.com/KaOS-Community-Packages/gvsig-desktop

pkgname=gvsig-desktop
_pkgname=gvSIG-desktop
pkgver=2.3.1
_pkgrel=2501
pkgrel=1
pkgdesc="A powerful, user-friendly and interoperable GIS."
arch=('x86_64')
url="http://www.gvsig.com/en/products/gvsig-desktop"
license=('GPL')
depends=('java-environment>=6' 'hicolor-icon-theme' 'libidn' 'libldap' 'libjpeg-turbo' 'proj' 'geos' 'openssl')
source=("http://downloads.gvsig.org/download/gvsig-desktop-testing/dists/${pkgver}/builds/${_pkgrel}/gvSIG-desktop-${pkgver}-${_pkgrel}-final-lin_ubuntu_16.04-x86_64.zip"
        "$pkgname.desktop" "gvSIG.config" "001-patch_x64bits.patch")
sha256sums=('987ec4e47e9d9dec43d588c07693b04f438049b8ce5b73372290e1108b45431e'
            'f3bfca96b53572799aad64092b30ece4cec3b67db0062efada79a48d60d00ea0'
            'd5dd810d2492486af38b2d8079dbd24554b4f7dd6fd43d1af860ae6667239bb2'
            '212ed4c8223c18239ca10d4e78b6cc5fbbea8631157313b51cdaf8c55bd91316')


prepare() {
  cd ${srcdir}/${_pkgname}-${pkgver}-${_pkgrel}-final-lin_ubuntu_16.04-x86_64/

  # Patch for x64bits java
  patch -Np0 -i "${srcdir}/001-patch_x64bits.patch"
}

package() {
  cd $srcdir
  mkdir -p ${pkgdir}/opt/${pkgname}
  cp -R ${srcdir}/${_pkgname}-${pkgver}-${_pkgrel}-final-lin_ubuntu_16.04-x86_64/* ${pkgdir}/opt/${pkgname}

  sed -i  's:"$HOME/$GVSIG_APPLICATION_NAME":$HOME"/.gvsig":' "${pkgdir}/opt/${pkgname}/gvSIG.sh"

  install -Dm644 "gvSIG.config"  ${pkgdir}/opt/${pkgname}/gvSIG.config

  install -Dm644 "$pkgname.desktop" \
        ${pkgdir}/usr/share/applications/${pkgname}.desktop

  install -dm755 ${pkgdir}/usr/bin

  echo "#!/bin/sh" > ${pkgdir}/usr/bin/$pkgname
  echo "/opt/${pkgname}/gvSIG.sh" >> ${pkgdir}/usr/bin/${pkgname}
  chmod +x ${pkgdir}/usr/bin/${pkgname}

  for s in 16 22 48; do
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/${s}x${s}/apps
    cp "${pkgdir}/opt/${pkgname}/gvsig-icon${s}x${s}.png" "${pkgdir}/usr/share/icons/hicolor/${s}x${s}/apps/${pkgname}.png"
  done

  rm ${pkgdir}/opt/${pkgname}/home/gvSIG/plugins/org.gvsig.app.mainplugin/Symbols/Geology/"Neotectonic, Earthquake-Hazard"/Fault-plane*.*
}
