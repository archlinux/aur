# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=omegat-beta
_pkgname=omegat
pkgver=3.1.7
pkgrel=1
pkgdesc="Beta version of a multiplatform CAT tool application, written in Java"
arch=('i686' 'x86_64')
url="http://www.omegat.org/en/omegat.html"
license=('GPL')
depends=('java-runtime' 'desktop-file-utils')
conflicts=('omegat')
provides=('omegat')
install=${_pkgname}.install
options=('!strip')
source=(http://downloads.sourceforge.net/${_pkgname}/OmegaT_${pkgver}_Beta_Without_JRE.zip \
        http://www.omegat.org/resources/icons.zip \
        ${_pkgname}.desktop)
sha256sums=('3444b0f79b24ddcf990a917608802603bec8cabfd2cc1cf5e9c6dbd33a0aff59'
            'e8b14887f513a505def059903348b5a06c0d016450711cf0f235802213a3dbbb'
            '595de7433e91788e15fa7714e6a65188ccf56eeac824b4a48d50a6752b989700')

package() {
  cd "${srcdir}"
  install -d "${pkgdir}"/usr/share/java/${_pkgname} \
             "${pkgdir}"/usr/bin

  find . -type f -exec chmod 644 "{}" \;
  mv *.txt "${srcdir}"/docs
  cp -r * "${pkgdir}"/usr/share/java/${_pkgname}
  chmod 755 "${pkgdir}"/usr/share/java/${_pkgname}/OmegaT

#.desktop file + icon
  install -D -m644 "${srcdir}"/${_pkgname}.desktop \
    "${pkgdir}"/usr/share/applications/${_pkgname}.desktop
  install -D -m644 "${srcdir}"/icons/OmegaT_Icon.png \
    "${pkgdir}"/usr/share/pixmaps/${_pkgname}.png

#more images
  install -m644 "${pkgdir}"/usr/share/java/${_pkgname}/icons/*.png \
    "${pkgdir}"/usr/share/java/${_pkgname}/images/

#removing obsolete files
  rm -rf "${pkgdir}"/usr/share/java/${_pkgname}/{*.{zip,desktop},OmegaT,OmegaT.bat,icons}

#making executable file
  echo "#!/bin/sh" > "${pkgdir}"/usr/bin/${_pkgname}
  echo "cd /usr/share/java/${_pkgname}/" >> "${pkgdir}"/usr/bin/${_pkgname}
  echo "java -jar OmegaT.jar \$*" >> "${pkgdir}"/usr/bin/${_pkgname}
  chmod 755 "${pkgdir}"/usr/bin/${_pkgname}
}
