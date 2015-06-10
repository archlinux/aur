# Contributor: Giovanni Mazzamati <giovanni@majaglug.net>
# Maintainer: Guidobelix <guidobelix at hotmail dot it>

pkgname=acroread-it
pkgver=8.1.7
pkgrel=4
pkgdesc="Adobe Acrobat Reader for viewing PDF files. Italian version"
arch=('i686' 'x86_64')
url="http://www.adobe.com/products/acrobat/main.html"
license=('custom')
depends=('desktop-file-utils' 'bash')

if [[ "$CARCH" == 'i686' ]]; then
  depends+=('gtk2' 'mesa')
else
  depends+=('lib32'-{'gtk2','mesa'})
fi

makedepends=('rpmextract')
source=(http://ardownload.adobe.com/pub/adobe/reader/unix/8.x/${pkgver}/ita/AdobeReader_ita-${pkgver}-1.i486.rpm \
	acroread-scim.patch)
md5sums=('9d3e0198354830d43ff5feb0ade52306' '8422bddbb8c03535704a245f9858465e')

build() {
  cd "${srcdir}"
  rpmextract.sh AdobeReader_ita-${pkgver}-1.i486.rpm
  cd opt/Adobe/Reader8
  patch -Np3 -i "${srcdir}"/acroread-scim.patch || return 1
}

package() {
  cd "${srcdir}"/opt/Adobe/Reader8
  install -D -m644 Resource/Support/AdobeReader.desktop \
    "${pkgdir}"/usr/share/applications/AdobeReader.desktop
  sed -i 's/AdobeReader8.png/AdobeReader.png/' \
    "${pkgdir}"/usr/share/applications/AdobeReader.desktop
  install -D -m644 Resource/Icons/64x64/AdobeReader8.png \
    "${pkgdir}"/usr/share/pixmaps/AdobeReader.png
  
  install -d "${pkgdir}"/opt/acrobat
  cp -r Reader "${pkgdir}"/opt/acrobat/
  cp -r Resource "${pkgdir}"/opt/acrobat/

  install -D -m755 bin/acroread "${pkgdir}"/opt/acrobat/bin/acroread
  install -d "${pkgdir}"/usr/bin
  ln -sf /opt/acrobat/bin/acroread "${pkgdir}"/usr/bin/acroread

  install -D -m755 Browser/intellinux/nppdf.so \
    "${pkgdir}"/opt/mozilla/lib/plugins/nppdf.so

  install -D -m644 Reader/Legal/en_US/License.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/License.txt
}
