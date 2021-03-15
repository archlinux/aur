#Maintainer: Severin Glöckner <severin.gloeckner@stud.htwk-leipzig.de>

pkgname=xmlmind-xmleditor
_pkgname=xxe
pkgver=9.5.0
_pkgver=${pkgver//./_}
pkgrel=1
pkgdesc="IDE for editing XML files"
license=('Custom')
url="https://www.xmlmind.com/xmleditor"
arch=('any')
depends=('java-runtime>=8' 'bash' 'perl')
optdepends=('cups-pdf: for the ability to print into PDF-files')
makedepends=('libicns' 'icoutils' 'gendesk')
provides=('xxe')
install=${_pkgname}.install
source=("http://www.xmlmind.com/xmleditor/_download/xxe-perso-${_pkgver}.zip"
        "http://www.xmlmind.com/xmleditor/_download/xxe-devdocs-${_pkgver}.zip"
        "xxe.sh"
        "xxetool.sh"
        "xmltool.sh"
        "csscheck.sh"
        "authvalue.sh"
        "deployxxe.sh"
        "xmltool.1")
sha256sums=('540494c9461fbc15724a6cc2e55581ae45f80f283bb6a54a1968d1a8a0b05fd9'
            'ef814536d19c0781fdd481977e5abd08d39c616c8f5bf7ddfa287e0ab4cadaee'
            'e79534cc119fbf63afea0375ca8159294f3821e32b339f517acddb872c81a8ca'
            'c28c54c62aff121c84cfcda399ff21bd914a4e2757f29358e91c6f4865208fcf'
            '40fd7e5f73eaf9f05adabd29715f3dc2d78f4eeddb9440bdd3aece1341308a01'
            '541de90c98dc15d2957834611df41872837144397735c62be67924ce8af2ef84'
            '61251006be3625075958f6257d5eb5eba983115312d7df32e4449a2847c5ca7f'
            'cda6355dfc122b862694126affd50852ae8470ff1927c3af94b1e16c33140e58'
            'dd1efd7074aef4b28c130a781f21e34ada3f9b15673ad9df61ff77dba4930482')

prepare() {
  # use better icons 

  # 16px, 32px, 128px, 256px, 512px
  icns2png -x xxe-perso-${_pkgver}/bin/icon/xxe.icns

  # 24px, 48px
  icotool -x xxe-perso-${_pkgver}/bin/icon/xxe.ico
  mv xxe_4_24x24x32.png xxe_24x24x32.png
  mv xxe_2_48x48x32.png xxe_48x48x32.png

  # 64px
  jar -xf xxe-perso-${_pkgver}/bin/xxe_tool.jar com/xmlmind/xmledittool/deploy/icon64x64.png
  mv com/xmlmind/xmledittool/deploy/icon64x64.png xxe_64x64x32.png

  # create launcher
  gendesk -f -n \
      --pkgname="$_pkgname" \
      --name="XXE" \
      --genericname="XML IDE" \
      --comment="Edit XML files" \
      --exec=xxe \
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
  install -Dm755 xxe.sh       "${pkgdir}"/usr/bin/xxe
  install -Dm755 xxetool.sh   "${pkgdir}"/usr/bin/xxetool
  install -Dm755 xmltool.sh   "${pkgdir}"/usr/bin/xmltool
  install -Dm755 csscheck.sh  "${pkgdir}"/usr/bin/csscheck
  install -Dm755 authvalue.sh "${pkgdir}"/usr/bin/authvalue
  install -Dm755 deployxxe.sh "${pkgdir}"/usr/bin/deployxxe

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
  rm    "${pkgdir}"/usr/share/java/xxe/bin/{xxe,xxetool,xmltool,csscheck,authvalue,deployxxe}
  rm -r "${pkgdir}"/usr/share/java/xxe/bin/icon

  # include devdocs (optional)
  cp -a doc/api "${pkgdir}"/usr/share/doc/xxe/doc/
  cp -a doc/dev "${pkgdir}"/usr/share/doc/xxe/doc/
}
