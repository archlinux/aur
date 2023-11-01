#Maintainer: Severin Glöckner <severin.gloeckner@stud.htwk-leipzig.de>

pkgname=xmlmind-xmleditor
_pkgname=xxe
pkgver=10.5.0
_pkgver=${pkgver//./_}
pkgrel=1
pkgdesc="IDE for editing XML files"
license=('Custom')
url="https://www.xmlmind.com/xmleditor"
arch=('any')
depends=('java-runtime>=8' 'perl')
optdepends=('cups-pdf: for the ability to print into PDF-files')
makedepends=('libicns' 'icoutils' 'gendesk')
provides=('xxe')
install=${_pkgname}.install
source=("https://www.xmlmind.com/xmleditor/_download/xxe-perso-${_pkgver}.zip"
        "https://www.xmlmind.com/xmleditor/_download/xxe-devdocs-${_pkgver}.zip"
        "xxe.sh"
        "xxeconvert.sh"
        "xmltool.sh"
        "csscheck.sh"
        "authvalue.sh"
        "xmltool.1"
        "icon64x64.png")
sha256sums=('73850366255ed6a257e66c899494978476da1c9c9e446efb0468c2b7b427a310'
            'c50504d1fec3f06994c10e6152c4bc01186be3d11197547d8672b9a6a5b01f34'
            '72d24d6216f0fe5515edb50c38566d3f1f3ce134634a0da04fbb32ac3a216452'
            '3f04f7b1ecb934a96f15ed75e0593e545d7f820a95705710b39a2916377c57fa'
            '40fd7e5f73eaf9f05adabd29715f3dc2d78f4eeddb9440bdd3aece1341308a01'
            '541de90c98dc15d2957834611df41872837144397735c62be67924ce8af2ef84'
            '61251006be3625075958f6257d5eb5eba983115312d7df32e4449a2847c5ca7f'
            'dd1efd7074aef4b28c130a781f21e34ada3f9b15673ad9df61ff77dba4930482'
            '9c97b679944fa57e9aab3e3143fb23f2c4dba5e70d10127bfa99d60233a2d76f')

prepare() {
  # use better icons

  # 16px, 32px, 128px, 256px, 512px
  icns2png -x xxe-perso-${_pkgver}/bin/icon/xxe.icns

  # 24px, 48px
  icotool -x xxe-perso-${_pkgver}/bin/icon/xxe.ico
  mv xxe_4_24x24x32.png xxe_24x24x32.png
  mv xxe_2_48x48x32.png xxe_48x48x32.png

  # 64px
  mv icon64x64.png xxe_64x64x32.png

  # create launcher
  gendesk -f -n \
      --pkgname="$_pkgname" \
      --name="XXE" \
      --genericname="XML IDE" \
      --comment="Edit XML files" \
      --exec="xxe %F" \
      --startupnotify=True \
      --categories='Development;IDE;Java' \
      --mimetypes='text/xml' \
      --custom="Keywords=xmlmind
Comment[de]=XML-Dateien bearbeiten"
}

package() {
  install -dm755             "${pkgdir}"/usr/share/java
  cp -a xxe-perso-${_pkgver} "${pkgdir}"/usr/share/java/${_pkgname}

  # launch scripts
  install -Dm755 xxe.sh        "${pkgdir}"/usr/bin/xxe
  install -Dm755 xxeconvert.sh "${pkgdir}"/usr/bin/xxeconvert
  install -Dm755 xmltool.sh    "${pkgdir}"/usr/bin/xmltool
  install -Dm755 csscheck.sh   "${pkgdir}"/usr/bin/csscheck
  install -Dm755 authvalue.sh  "${pkgdir}"/usr/bin/authvalue

  # place icons
  for size in 16 24 32 48 64 128 256 512; do
      install -Dm644 "xxe_${size}x${size}x32.png" \
          "${pkgdir}"/usr/share/icons/hicolor/${size}x${size}/apps/xxe.png
  done

  # place launcher
  install -Dm644 xxe.desktop -t "${pkgdir}"/usr/share/applications/

  # place license files
  install -dm755                              "${pkgdir}"/usr/share/licenses/${pkgname}
  mv "${pkgdir}"/usr/share/java/xxe/legal     "${pkgdir}"/usr/share/licenses/${pkgname}/
  mv "${pkgdir}"/usr/share/java/xxe/legal.txt "${pkgdir}"/usr/share/licenses/${pkgname}/
  ln -s legal/xxe-perso.LICENSE               "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

  # place documentation
  install -dm755                         "${pkgdir}"/usr/share/doc/${_pkgname}
  mv "${pkgdir}"/usr/share/java/xxe/doc  "${pkgdir}"/usr/share/doc/${_pkgname}/
  mv "${pkgdir}"/usr/share/java/xxe/demo "${pkgdir}"/usr/share/doc/${_pkgname}/
  install -Dm644 xmltool.1               "${pkgdir}"/usr/share/man/man1/xmltool.1

  # remove unneeded stuff
  find  "${pkgdir}"/usr/share/java/xxe/bin/ -name \*.bat -delete
  find  "${pkgdir}"/usr/share/java/xxe/bin/ -name \*.exe -delete
  rm    "${pkgdir}"/usr/share/java/xxe/bin/xxe.jstart
  rm    "${pkgdir}"/usr/share/java/xxe/bin/{xxe,xxeconvert,xmltool,authvalue}
  rm -r "${pkgdir}"/usr/share/java/xxe/bin/icon

  # include devdocs (optional)
  cp -a doc/api "${pkgdir}"/usr/share/doc/xxe/doc/
  cp -a doc/dev "${pkgdir}"/usr/share/doc/xxe/doc/
}
