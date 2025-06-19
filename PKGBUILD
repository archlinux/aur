# Maintainer:     Jaja <jaja@mailbox.org>
# Co-maintainer:  alisoftware <admin@situsali.com>
#

pkgname=jsignpdf
pkgver=2.3.0
_releasedate="2025git -01-06"
pkgrel=1
pkgdesc="Digitally sign PDF files with X.509 certificates in GUI and CLI."
arch=('any')
url="http://jsignpdf.sourceforge.net/"
license=('LGPL' 'MPL' 'CCPL' 'Apache' 'custom')
depends=('java-runtime>=8'
         'bash')
optdepends=('hicolor-icon-theme: icon for launcher'
            'desktop-file-utils: MIME cache update')
source=(
  ${pkgname}-${pkgver}.zip::"https://github.com/intoolswetrust/jsignpdf/releases/download/JSignPdf_${pkgver//./_}/JSignPdf-${pkgver}.zip"
  jsignpdf_48.png::"https://raw.githubusercontent.com/intoolswetrust/jsignpdf/master/distribution/doc/icon/iconverticons.com/signedpdf_48x48x32.png"
  jsignpdf_128.png::"https://raw.githubusercontent.com/intoolswetrust/jsignpdf/master/distribution/doc/icon/iconverticons.com/signedpdf_128x128x32.png"
  supplementary.tar.zst)
md5sums=('d239658ea50a39eb35169d8392feaffb'
         'a44ef91da28d94fb949e361d19adbbd5'
         'bf2d11e38c706fe183900cce1fab0e38'
         'e45374c55c83559e1f66f09e8fd0cd1a')
changelog=changelog
backup=('usr/share/java/jsignpdf/conf/conf.properties'
        'usr/share/java/jsignpdf/conf/pkcs11.cfg')

build() {
  sed -i "s/<pkgver>/$pkgver/g" ${srcdir}/manpages/de/man1/*
  sed -i "s/<pkgver>/$pkgver/g" ${srcdir}/manpages/man1/*
  sed -i "s/<date>/$_releasedate/g" ${srcdir}/manpages/de/man1/*
  sed -i "s/<date>/$_releasedate/g" ${srcdir}/manpages/man1/*
}

package() {
  ## file and directory permissions for mv and cp: u=rwx,g=rx,o=rx
  umask 022
  ## licenses
  install -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
  mv "${srcdir}/${pkgname}-${pkgver}"/licenses/ThirdPartyLicenses/* "${pkgdir}"/usr/share/licenses/"${pkgname}"
  ## documentation
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}"/docs/JSignPdf.pdf "${pkgdir}"/usr/share/doc/"${pkgname}"/Quickstart.pdf
  #install -Dm644 "${srcdir}/${pkgname}-${pkgver}"/docs/ReleaseNotes.txt "${pkgdir}"/usr/share/doc/"${pkgname}"/ReleaseNotes
  install -d "${pkgdir}"/usr/share/man
  mv "${srcdir}"/manpages/* "${pkgdir}"/usr/share/man
  ## programm files
  install -Dm644 "${srcdir}"/pictures/splash1.png "${pkgdir}"/usr/share/java/"${pkgname}"/splash.png
  rm -r "${srcdir}/${pkgname}-${pkgver}"/docs
  mv "${srcdir}/${pkgname}-${pkgver}"/* "${pkgdir}"/usr/share/java/"${pkgname}"
  ## executable scripts
  install -Dm755 "${srcdir}"/launchers/jsignpdf.sh "${pkgdir}"/usr/bin/jsignpdf
  install -Dm755 "${srcdir}"/launchers/jsignpdf-installcert.sh "${pkgdir}"/usr/bin/jsignpdf-installcert
  ## .icon and .desktop files
  install -Dm644 "${srcdir}"/jsignpdf_48.png "${pkgdir}"/usr/share/icons/hicolor/48x48/apps/"${pkgname}".png
  install -Dm644 "${srcdir}"/jsignpdf_128.png "${pkgdir}"/usr/share/icons/hicolor/128x128/apps/"${pkgname}".png
  install -Dm644 "${srcdir}"/launchers/jsignpdf.desktop "${pkgdir}"/usr/share/applications/"${pkgname}".desktop
}
