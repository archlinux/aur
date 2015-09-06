# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: TDY <tdy@archlinux.info>

pkgname=foxitreader
pkgver=1.1.0.20090810
pkgrel=2
pkgdesc="A small, fast PDF viewer"
arch=('i686' 'x86_64')
url="http://www.foxitsoftware.com/Secure_PDF_Reader/"
license=('custom:EULA')
depends=('desktop-file-utils')
depends_i686=('gtk2')
depends_x86_64=('lib32-gtk2')
install="${pkgname}.install"
source=("http://cdn04.foxitsoftware.com/pub/foxit/reader/desktop/linux/1.x/${pkgver%.*.*}/enu/FoxitReader-${pkgver%.*}.tar.bz2"
        "http://cdn04.foxitsoftware.com/pub/foxit/reader/desktop/linux/1.x/${pkgver%.*.*}/enu/FoxitReader_${pkgver%.*}_i386.deb"
        "https://www.foxitsoftware.com/products/pdf-reader/eula.html"
        "${pkgname}-i686.sh"
        "${pkgname}-x86_64.sh"
        "desktop-file.patch")
sha256sums=('02f1ad5ad2fd516754254f349c94b8e81b57b9eb2a0315f30debdc5d7fb8dbf4'
            '248eab45cbb8816989d46dc3c3f150273720c69645fbbbc3c06b93983ac50653'
            'a5be3dc1cf27536de2c0fb5a0d640db349be32f48547b3cc56dcb5791fb278be'
            'cd70582074710360cb667d91dd677b4f074f308bc13517a879d2735a08266d96'
            '13856414068d9e374eed86a5a99c665b8450f7d07dd27fd9106b73d20fdd5e87'
            '39a709be8a1c708850834a1b215fadb11331d86404d5422e19c49248afcc6a33')

prepare() {
  bsdtar -x -f data.tar.gz
  patch -p1 -i "desktop-file.patch"
}

package() {
  # Install license file
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" eula.html
  # Install launcher script
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 "${pkgname}-$CARCH.sh" "${pkgdir}/usr/bin/${pkgname}"
  # Install icon and desktop files
  install -m 755 -d "${pkgdir}/usr/share/pixmaps"
  install -m 644 "usr/share/pixmaps/fx-icon.png" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -m 755 -d "${pkgdir}/usr/share/applications"
  install -m 755 "usr/share/applications/Foxit-Reader.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  # Install application files
  cd "${pkgver%.*.*}-release"
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}" FoxitReader
  install -m 644 -t "${pkgdir}/usr/lib/${pkgname}" fum.fhd fpdfcjk.bin
  # Install localization files
  for _lng in po/*; do
    install -m 755 -d "${pkgdir}/usr/share/locale/${_lng#*/}/LC_MESSAGES"
    install -m 644 -t "${pkgdir}/usr/share/locale/${_lng#*/}/LC_MESSAGES" \
      "${_lng}/FoxitReader.mo"
  done
}

