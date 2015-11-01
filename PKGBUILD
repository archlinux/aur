# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: TDY <tdy@archlinux.info>

pkgname=foxitreader
epoch=1
pkgver=1.0.0.0909
_pkgver=1.00.0909
_pkgrev=186903
pkgrel=1
pkgdesc="A small, fast PDF viewer"
arch=('i686' 'x86_64')
url="http://www.foxitsoftware.com/Secure_PDF_Reader/"
license=('custom:EULA')
makedepends=('qt-installer-framework' 'qt5-tools' 'p7zip')
depends=('desktop-file-utils')
install="${pkgname}.install"
source=("https://www.foxitsoftware.com/products/pdf-reader/eula.html"
        "${pkgname}.patch")
source_i686=("http://cdn01.foxitsoftware.com/pub/foxit/reader/desktop/linux/1.x/${pkgver%.*.*}/en_us/FoxitReader${_pkgver}_Server_x86_enu_Setup.run.tar.gz")
source_x86_64=("http://cdn01.foxitsoftware.com/pub/foxit/reader/desktop/linux/1.x/${pkgver%.*.*}/en_us/FoxitReader${_pkgver}_Server_x64_enu_Setup.run.tar.gz")
sha256sums=('a5be3dc1cf27536de2c0fb5a0d640db349be32f48547b3cc56dcb5791fb278be'
            '95dfbe05398dffbbfd31302f15e1707545512a4abb4b78d0ce843e19759d8586')
sha256sums_i686=('b3a50f96f7310d2f319b321252a1423cf5b537789127e0cfd75358f23a8d9c73')
sha256sums_x86_64=('1f4a6b97456049c7f2d4103a3828a52109a9e1a85e502099373632908579c67c')

build() {
  # Clean installer dir
  if [ -d "${pkgname}-installer" ]
  then
    rm -rf "${pkgname}-installer"
  fi
  # Decompress .run installer
  if [ "${CARCH}" = 'x86_64' ]
  then
    _file_run="FoxitReader.enu.setup.${pkgver}(r${_pkgrev}).run"
  else
    _file_run="FoxitReader.enu.setup.x86.${pkgver}(r${_pkgrev}).run"
  fi
  devtool --dump "${pkgname}-installer" "${_file_run}"
}

package() {
  cd "${pkgname}-installer/metadata/Install FxoitReader"
  # Decompress files
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}"
  for file in *.7z
  do
    7z x -o"${pkgdir}/usr/lib/${pkgname}" ${file} > /dev/null
  done

  # Remove useless files
  cd "${pkgdir}/usr/lib/${pkgname}"
  rm "lib/.directory" "Activation.desktop" "Activation.sh" "installUpdate" \
     "maintenancetool.sh" "Uninstall.desktop" "Update.desktop" "updater" \
     "updater.sh"
  # These files won't exist in every installer
  [ -e "Foxit Reader Startup.Log" ] && rm "Foxit Reader Startup.Log"
  # Install icon and desktop files
  install -m 755 -d "${pkgdir}/usr/share/pixmaps"
  install -m 644 "images/FoxitReader-64x64.png" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -m 755 -d "${pkgdir}/usr/share/applications"
  install -m 755 "FoxitReader.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  # Install license file
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/eula.html"
  # Install launcher script
  cd "${pkgdir}"
  install -m 755 -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/FoxitReader.sh" "${pkgdir}/usr/bin/${pkgname}"
  # Apply final patches
  cd "${pkgdir}"
  patch -p2 -i "${srcdir}/${pkgname}.patch"
}

