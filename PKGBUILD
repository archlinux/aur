# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributors: bepebe, cconrad, ZeroBit, treborz
# Parts adapted from: Muflone/freeoffice@aur

pkgname=softmaker-office-2016-bin
pkgver=2016.765
pkgrel=2
pkgdesc="Softmaker Office 2016, proprietary office suite; word processing, spreadsheets, presentations"
url="http://softmaker.com"
arch=('x86_64' 'i686')
license=('custom')
depends=('desktop-file-utils' 'shared-mime-info' 'hicolor-icon-theme')
depends_i686=('libxmu' 'libidn11' 'libgl' 'libxrandr')
depends_x86_64=('lib32-libxmu' 'lib32-libidn11' 'lib32-libgl' 'lib32-libxrandr')

source=("http://www.softmaker.net/down/softmaker-office-${pkgver//./-}.tgz"
        "planmaker16"
        "presentations16"
        "textmaker16"
        "planmaker-2016.desktop"
        "presentations-2016.desktop"
        "textmaker-2016.desktop")
md5sums=('83369f5d044a81732e67ab37a87ca324'
         'a6349cf7ec9495cb13bb7bdcc9fdbd13'
         '57766d7d252f42ce3bcb2ecc28dd97e9'
         '5508d9a7a4750084b104bdb4dd51a1d9'
         '60bab207799f6f92192d158840f3e5aa'
         '86b058133c52201abd98a2594849e77e'
         'b0cb162e83fb4f186b1fb458f12ddc00')
sha512sums=('6cb0b2de4f2d5d187688a53f0a23b8447b13b5b31a2daa8d0daef7d8c0ff52e229c4df6d33627bd80cf825466c40d236aa501862da93602ff916fe62a47f0685'
            '926b18535157563be086d13bc555bfcb80176685f831efe8a263d045808f993c8abff9b5feecebf1923a6957a4e7064876e229fe7ab7b49c4806e5abaac7ed38'
            '44d7c55d69a1de7b665a507808618dc9ac81b8938f73cf63ad74cde6725d151e9322b4b25b48798d9f0c76d955e52de6fb97ef86b1c7c2adea56bc95dcd65c82'
            'e40f7eefb706cf7d6f1956bb6f11c70a7b2cbf9ec3e8acf4dba1dd7d59dca138e2c44e55174f337d7a389f9e07690744e12de75238cdd6004de5a0d62375dc3f'
            '1f8b3c475f4a53fd57e279a68bcf02b8c2dc3c081cae378c5ea009550e7cd09d56c297249a8eb86b9ab770b7683e7427df52cdb98a0acb67bfe55da59962f11f'
            'd347cb1bd87273b87e283a64ea7d78265dbb524f18f783840cb7d560e402acfc4cba1e6d7fb5fae83314c70fea1d47334f9615592021513fd6e3b8ce7550cdeb'
            '94224fb084136441c1855e86247f6882017eab4648928e1bbbc4691b1b50f41b29a0945ab4056c774d1fc0dfb0edcddb6fffea758023de71877f62b1c545289c')

_langvar=`echo $LANG|cut -f 1 -d"_" 2>/dev/null`
case "${_langvar}" in
  de) ;;
  es) ;;
  *) _langvar="en" ;;
esac

package() {
  mkdir -p "${pkgdir}/opt/smoffice2016"
  tar -xzf "${srcdir}/office.tgz" -C "${pkgdir}/opt/smoffice2016"

  mv "${pkgdir}/opt/smoffice2016/usr/lib/dpf" "${pkgdir}/opt/smoffice2016"
  rm -rf "${pkgdir}/opt/smoffice2016/usr"
  ln -s "libdpf.so.2.8.0" "${pkgdir}/opt/smoffice2016/dpf/libdpf.so.2"

  mv "${pkgdir}/opt/smoffice2016/spell/langenscheidt_${_langvar}.thn" "${pkgdir}/opt/smoffice2016/spell/langenscheidt.thn"
  rm "${pkgdir}/opt/smoffice2016/spell/langenscheidt_"*".thn"

  install -d "${pkgdir}/usr/bin"
  install -m 755 -t "${pkgdir}/usr/bin" "${srcdir}/planmaker16"
  install -m 755 -t "${pkgdir}/usr/bin" "${srcdir}/presentations16"
  install -m 755 -t "${pkgdir}/usr/bin" "${srcdir}/textmaker16"
  for size in 16 32 48 64 128
    do
      install -d "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
      ln -s "/opt/smoffice2016/icons/pml_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/smoffice2016-planmaker.png"
      ln -s "/opt/smoffice2016/icons/prl_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/smoffice2016-presentations.png"
      ln -s "/opt/smoffice2016/icons/tml_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/smoffice2016-textmaker.png"

      install -d "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes"
      ln -s "/opt/smoffice2016/icons/pmd_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-pmd16.png"
      ln -s "/opt/smoffice2016/icons/prd_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-prd16.png"
      ln -s "/opt/smoffice2016/icons/tmd_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-tmd16.png"
    done

  install -d "${pkgdir}/usr/share/mime/packages"

  # Set the mime types to use generic icons
  sed "s/icon/generic-icon/g;s/application-x-tmd/x-office-document/g;s/application-x-pmd/x-office-spreadsheet/g;s/application-x-prd/x-office-presentation/g" "${pkgdir}/opt/smoffice2016/mime/softmaker-office-2016.xml" > "${pkgdir}/usr/share/mime/packages/softmaker-office-2016.xml" 
  # The line below would set generic icons for various file types to the Softmaker style, to use it, uncomment it and comment the line above.
  #sed -r "s/icon/generic-icon/g;s/application-x-(tmd|pmd|prd)/&16/g" "${pkgdir}/opt/smoffice2016/mime/softmaker-office-2016.xml" > "${pkgdir}/usr/share/mime/packages/softmaker-office-2016.xml"

  install -d "${pkgdir}/usr/share/applications"
  install -m 644 -t "${pkgdir}/usr/share/applications" "${srcdir}/planmaker-2016.desktop"
  install -m 644 -t "${pkgdir}/usr/share/applications" "${srcdir}/presentations-2016.desktop"
  install -m 644 -t "${pkgdir}/usr/share/applications" "${srcdir}/textmaker-2016.desktop"
}
