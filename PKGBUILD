# Maintainer: Samuel Fernando Mesa <samuelmesa@linuxmail.org> 
# Based on script of KaOS: https://github.com/KaOS-Community-Packages/gvsig-desktop

pkgname=gvsig-desktop-bin
_pkgname=gvSIG-desktop
_pkgname_lower=gvsig-desktop
pkgver=2.6.0
_pkgrel=3335
pkgrel=1
pkgdesc="A powerful, user-friendly and interoperable GIS."
arch=('x86_64')
url="http://www.gvsig.com/en/products/gvsig-desktop"
license=('GPL')
depends=('java-environment>=6' 'hicolor-icon-theme' 'libidn' 'libldap' 'libjpeg-turbo' 'proj' 'geos' 'openssl')
source=("http://downloads.gvsig.org/download/gvsig-desktop-testing/dists/${pkgver}/builds/${_pkgrel}/gvSIG-desktop-${pkgver}-${_pkgrel}-final-lin-x86_64.zip"
        "$_pkgname.desktop" "gvSIG.config")
sha256sums=('546372a967ed5ba7e38fa1709ff87b1b261863b94a2370e6226fbacc52f1dbd5'
            '28488fdddfcba0b6af7dd37356dad81d3bdcc08e97cb6422aaddabfe7c68add4'
            'd5dd810d2492486af38b2d8079dbd24554b4f7dd6fd43d1af860ae6667239bb2')

#if   [ "$CARCH" = "i686"   ]; then _arch="x86"
#elif [ "$CARCH" = "x86_64" ]; then _arch="x86_64"
#fi

package() {
  cd $srcdir
  mkdir -p ${pkgdir}/opt/${_pkgname_lower}
  cp -R ${srcdir}/${_pkgname}-${pkgver}-${_pkgrel}-final-lin-x86_64/* ${pkgdir}/opt/${_pkgname_lower}

  sed -i  's:"$HOME/$GVSIG_APPLICATION_NAME":$HOME"/.gvsig":' "${pkgdir}/opt/${_pkgname_lower}/gvSIG.sh"

  install -Dm644 "gvSIG.config"  ${pkgdir}/opt/${_pkgname_lower}/gvSIG.config

  install -Dm644 "${_pkgname}.desktop" \
        ${pkgdir}/usr/share/applications/${_pkgname}.desktop

  install -dm755 ${pkgdir}/usr/bin

  echo "#!/bin/sh" > ${pkgdir}/usr/bin/$pkgname
  echo "/opt/${_pkgname_lower}/gvSIG.sh" >> ${pkgdir}/usr/bin/${pkgname}
  chmod +x ${pkgdir}/usr/bin/${pkgname}
  chmod -Rfv 755 ${pkgdir}/opt/${_pkgname_lower}/gvSIG

  for s in 16 22 48; do
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/${s}x${s}/apps
    cp "${pkgdir}/opt/${_pkgname_lower}/gvsig-icon${s}x${s}.png" "${pkgdir}/usr/share/icons/hicolor/${s}x${s}/apps/${_pkgname_lower}.png"    
  done

  mkdir -p ${pkgdir}/usr/share/pixmaps
  cp "${pkgdir}/opt/${_pkgname_lower}/gvsig-icon48x48.png" "${pkgdir}/usr/share/pixmaps/${_pkgname_lower}.png"  
}
