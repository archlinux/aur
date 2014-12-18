# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=omegat-beta
_pkgname=omegat
pkgver=3.1.8
pkgrel=1
pkgdesc="Beta version of a multiplatform CAT tool application, written in Java"
arch=('any')
url="http://www.omegat.org/en/omegat.html"
license=('GPL')
depends=('java-runtime' 'desktop-file-utils')
conflicts=('omegat')
provides=('omegat')
install=${_pkgname}.install
options=('!strip')
source=(http://downloads.sourceforge.net/${_pkgname}/OmegaT_${pkgver}_Beta_Without_JRE.zip
        http://www.omegat.org/resources/icons.zip
        ${_pkgname}.desktop)
sha256sums=('9aea374d14c343301959cf10dbb102dc7f36fa210151702315264eeb690eacf4'
            'e8b14887f513a505def059903348b5a06c0d016450711cf0f235802213a3dbbb'
            '595de7433e91788e15fa7714e6a65188ccf56eeac824b4a48d50a6752b989700')

package() {
  cd "${srcdir}"
  install -d "${pkgdir}"/usr/share/java/${_pkgname} \
             "${pkgdir}"/usr/bin

  find . -type f -exec chmod 644 "{}" \;
  mv *.txt "${srcdir}"/docs
  cp -r * "${pkgdir}"/usr/share/java/${_pkgname}

#.desktop file + icon
  install -Dm644 "${srcdir}"/${_pkgname}.desktop \
    "${pkgdir}"/usr/share/applications/${_pkgname}.desktop
  install -Dm644 "${srcdir}"/icons/OmegaT_Icon.png \
    "${pkgdir}"/usr/share/pixmaps/${_pkgname}.png

#more images
  install -m644 "${pkgdir}"/usr/share/java/${_pkgname}/icons/*.png \
    "${pkgdir}"/usr/share/java/${_pkgname}/images/

#executable file
  echo "#!/bin/sh" > "${pkgdir}"/usr/bin/${_pkgname}
  echo "cd /usr/share/java/${_pkgname}/" >> "${pkgdir}"/usr/bin/${_pkgname}
  echo "java -jar -Xmx512M OmegaT.jar \$*" >> "${pkgdir}"/usr/bin/${_pkgname}
  chmod 755 "${pkgdir}"/usr/bin/${_pkgname}

#removing obsolete files
  rm -rf "${pkgdir}"/usr/share/java/$pkgname/{*.{zip,desktop,sh,kaptn},OmegaT,OmegaT.bat,icons}
  rm "${pkgdir}"/usr/share/java/$pkgname/native/*.{dll,dylib}
[[ "$CARCH" = "i686" ]] && rm "${pkgdir}"/usr/share/java/$pkgname/native/libhunspell-linux64.so
[[ "$CARCH" = "x86_64" ]] && rm "${pkgdir}"/usr/share/java/$pkgname/native/libhunspell-linux32.so
}
