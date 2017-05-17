# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=omegat
pkgver=3.6.0_05
pkgrel=1
pkgdesc="Multiplatform CAT tool application, written in Java"
arch=('any')
url="http://www.omegat.org/en/omegat.html"
license=('GPL')
depends=('java-runtime' 'desktop-file-utils')
conflicts=('omegat-beta')
options=('!strip')
source=(http://downloads.sourceforge.net/$pkgname/OmegaT_${pkgver}_Without_JRE.zip
        $pkgname.desktop)
sha256sums=('12731ddcaa1ef9f774d56f25a7b45a933cbf6f51ab83e7aa7d83ea1ffa5b12a4'
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
  install -Dm644 images/OmegaT.svg \
    "${pkgdir}"/usr/share/pixmaps/${_realname}.svg

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
