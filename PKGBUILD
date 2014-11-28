# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=omegat
pkgver=2.6.3_11
pkgrel=1
pkgdesc="Multiplatform CAT tool application, written in Java"
arch=('i686' 'x86_64')
url="http://www.omegat.org/en/omegat.html"
license=('GPL')
depends=('java-runtime' 'desktop-file-utils')
conflicts=('omegat-beta')
install=$pkgname.install
options=('!strip')
source=(http://downloads.sourceforge.net/$pkgname/OmegaT_${pkgver}_Without_JRE.zip \
        http://www.omegat.org/resources/icons.zip \
        $pkgname.desktop)
sha256sums=('1d46864449c36dcf98915117276a4c40547a215a3a0a314e794e79bb8fb30b7e'
            'e8b14887f513a505def059903348b5a06c0d016450711cf0f235802213a3dbbb'
            'ac480a8244c1a5171b7f2d5892585360067d78e3113ccb45aad6afe7ed69aec5')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/java/$pkgname \
             ${pkgdir}/usr/bin

  find . -type f -exec chmod 644 "{}" \;
  mv *.txt ${srcdir}/docs
  cp -r * ${pkgdir}/usr/share/java/$pkgname
  chmod 755 ${pkgdir}/usr/share/java/$pkgname/OmegaT

#.desktop file + icon
  install -D -m644 ${srcdir}/$pkgname.desktop \
    ${pkgdir}/usr/share/applications/$pkgname.desktop
  install -D -m644 ${srcdir}/icons/OmegaT_Icon.png \
    ${pkgdir}/usr/share/pixmaps/$pkgname.png

#more images
  install -m644 ${pkgdir}/usr/share/java/$pkgname/icons/*.png \
    ${pkgdir}/usr/share/java/$pkgname/images/

#removing obsolete files
  rm -rf ${pkgdir}/usr/share/java/$pkgname/{*.{zip,desktop},OmegaT,OmegaT.bat,icons}

#making executable file
  echo "#!/bin/sh" > ${pkgdir}/usr/bin/$pkgname
  echo "cd /usr/share/java/$pkgname/" >> ${pkgdir}/usr/bin/$pkgname
  echo "java -jar OmegaT.jar \$*" >> ${pkgdir}/usr/bin/$pkgname
  chmod 755 ${pkgdir}/usr/bin/$pkgname
}
