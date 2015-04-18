# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=omegat
pkgver=3.1.9_01
pkgrel=1
pkgdesc="Multiplatform CAT tool application, written in Java"
arch=('any')
url="http://www.omegat.org/en/omegat.html"
license=('GPL')
depends=('java-runtime' 'desktop-file-utils')
conflicts=('omegat-beta')
install=$pkgname.install
options=('!strip')
source=(http://downloads.sourceforge.net/$pkgname/OmegaT_${pkgver}_Without_JRE.zip
        http://www.omegat.org/resources/icons.zip
        $pkgname.desktop)
sha256sums=('68f500a5173395fb7e35b31c17d0c5fddfe819d50076d25c8e526c96217abd84'
            'e8b14887f513a505def059903348b5a06c0d016450711cf0f235802213a3dbbb'
            'ac480a8244c1a5171b7f2d5892585360067d78e3113ccb45aad6afe7ed69aec5')

package() {
  cd "${srcdir}"
  install -d "${pkgdir}"/usr/share/java/$pkgname \
             "${pkgdir}"/usr/bin

  find . -type f -exec chmod 644 "{}" \;
  mv *.txt "${srcdir}"/docs
  cp -r * "${pkgdir}"/usr/share/java/$pkgname

#.desktop file + icon
  install -Dm644 "${srcdir}"/$pkgname.desktop \
    "${pkgdir}"/usr/share/applications/$pkgname.desktop
  install -Dm644 "${srcdir}"/icons/OmegaT_Icon.png \
    "${pkgdir}"/usr/share/pixmaps/$pkgname.png

#more images
  install -m644 "${pkgdir}"/usr/share/java/$pkgname/icons/*.png \
    "${pkgdir}"/usr/share/java/$pkgname/images/

#executable file
  echo "#!/bin/sh" > "${pkgdir}"/usr/bin/$pkgname
  echo "cd /usr/share/java/$pkgname/" >> "${pkgdir}"/usr/bin/$pkgname
  echo "java -jar -Xmx512M OmegaT.jar \$*" >> "${pkgdir}"/usr/bin/$pkgname
  chmod 755 "${pkgdir}"/usr/bin/$pkgname

#removing obsolete files
  rm -rf "${pkgdir}"/usr/share/java/$pkgname/{*.{zip,desktop,sh,kaptn},OmegaT,OmegaT.bat,icons}
  rm "${pkgdir}"/usr/share/java/$pkgname/native/*.{dll,dylib}

if [[ "$CARCH" == "x86_64" ]]; then
  rm "${pkgdir}"/usr/share/java/$pkgname/native/libhunspell-linux32.so
else
  rm "${pkgdir}"/usr/share/java/$pkgname/native/libhunspell-linux64.so
fi
}
