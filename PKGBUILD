# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=scoredate
pkgver=3.2
_jarname=scoredate.jar
pkgrel=2
pkgdesc="Software to learn music reading and ear training"
arch=('any')
url="http://scoredate.sourceforge.net/"
license=('GPL')
depends=('java-runtime')
makedepends=('convmv' 'gendesk')
install='scoredate.install'
source=("https://sourceforge.net/projects/scoredate/files/latest/download"
        "scoredate.png")

prepare() {
  cd "${srcdir}/ScoreDate-${pkgver}"
  convmv -rf cp858 -t utf8 --notest --replace .
  rm -r ScoreDate.exe libs
  mv ScoreDate-${pkgver}.jar scoredate.jar
  cd "${srcdir}" 
  gendesk -f -n --pkgname scoredate --pkgdesc "${pkgdesc}" --exec "scoredate" --categories "Education;Music"
}

package() {
  install -dm755 "${pkgdir}/usr/share/java/scoredate"
  cd "${srcdir}/ScoreDate-${pkgver}"
  cp -R . "${pkgdir}/usr/share/java/scoredate"


  install -Dm644 "${srcdir}/scoredate.desktop" "$pkgdir/usr/share/applications/scoredate.desktop"
  install -Dm644 "${srcdir}/scoredate.png" "$pkgdir/usr/share/pixmaps/scoredate.png"

  install -d "${pkgdir}"/usr/bin
  chgrp games "${pkgdir}/usr/share/java/scoredate"
  chmod g+rwx "${pkgdir}/usr/share/java/scoredate"
  cat <<"EOF" >"${pkgdir}"/usr/bin/scoredate
#!/bin/sh
cd /usr/share/java/scoredate
java -jar scoredate.jar
EOF
  chmod 755 "${pkgdir}"/usr/bin/$pkgname
}
md5sums=('ede639b1a790b29f5f0bcb7425a194f8'
         'b6bd72ec7253f68fbdffe759441371fc')

