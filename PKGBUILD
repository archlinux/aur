# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributors: bepebe, cconrad
# Parts adapted from: Muflone/freeoffice@aur

pkgname=softmaker-office-2016-bin
pkgver=2016.752
pkgrel=1
pkgdesc="Softmaker Office 2016, proprietary office suite; word processing, spreadsheets, presentations"
url="http://softmaker.com"
arch=('x86_64' 'i686')
license=('custom')
install=smoffice2016.install

depends=('desktop-file-utils' 'shared-mime-info' 'hicolor-icon-theme')
depends_i686=('libxmu' 'libidn' 'libgl' 'libxrandr')
depends_x86_64=('lib32-libxmu' 'lib32-libidn' 'lib32-libgl' 'lib32-libxrandr')

source=("http://www.softmaker.net/down/softmaker-office-${pkgver//./-}.tgz"
        "planmaker16"
        "presentations16"
        "textmaker16"
        "planmaker-2016.desktop"
        "presentations-2016.desktop"
        "textmaker-2016.desktop")
md5sums=('1f9e0e7d83c59d369e619b870d225e62'
         '5e698160b69670b71ca1306457e95fe0'
         '57766d7d252f42ce3bcb2ecc28dd97e9'
         'eb2bde093b83afb2b4cd5c479531d4fb'
         '60bab207799f6f92192d158840f3e5aa'
         '86b058133c52201abd98a2594849e77e'
         'b0cb162e83fb4f186b1fb458f12ddc00')
sha512sums=('556867c8f783192b9dcdce7aae6c7b5c42bc86d14bafb15a7a8df192be9e3f4bacd866c81bffc2efefe903d3397e2a10b3e4436956386459414adf81f35d8c53'
            '47e08e91734692b77d17999ce32b974a7f3cede5082f0884b2d1546d6ce7204bfcf67d713de9148398834aca28626d033855703fa3e0e375879fb085a89a2251'
            '44d7c55d69a1de7b665a507808618dc9ac81b8938f73cf63ad74cde6725d151e9322b4b25b48798d9f0c76d955e52de6fb97ef86b1c7c2adea56bc95dcd65c82'
            '504a95d3a6c129608a81b7bcd5e382fc3b542f02ca950dfc6aba1761664721cad51d304613adf6ea5c92ccc5b94a32f12bc2843925cd624de58986f3d71f5770'
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
