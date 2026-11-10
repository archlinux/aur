# Maintainer: tioguda <guda.flavio@gmail.com>
# Maintainer: Pedro Henrique Quitete Barreto <pedrohqb@gmail.com>

pkgname=softplan-websigner
_pkgver=2.15.0
pkgver=${_pkgver}.1
pkgrel=3
pkgdesc="The Web Signer native application.. An easy solution for using digital certificates in Web applications."
arch=('x86_64')
url="https://www.softplan.com.br"
license=('custom')
depends=('desktop-file-utils' 'glib2' 'gtk3>=3.6' 'hicolor-icon-theme' 'xdg-utils')
options=('!strip' '!emptydirs')
# websigner.softplan.com.br sends an incomplete certificate chain (hence the
# old curl -k). It is a CloudFront distribution, whose own address serves the
# same file with a valid certificate. Softplan's server sends its current
# package whatever version the path names.
source=("${pkgname}-${pkgver}-64.deb::https://d1qzl0w4epswjx.cloudfront.net/Downloads/${_pkgver}/webpki-chrome-64-deb")
sha512sums=('54bb4dd51f3ea442db2789f15bde5ee3e5fb92a7b8dc269198b700f75a731918c8eaefa7c7aa3a6c08086e7d0efc133f55b6f112fc8213b7401cc850e250f6de')

package(){

# Extract package data
tar xf data.tar.* -C "${pkgdir}"

# Fix directory structure differences
rm -rf "${pkgdir}"/usr/lib/*
mv "${pkgdir}"/usr/lib64/* "${pkgdir}"/usr/lib
rm -rf "${pkgdir}"/usr/lib64

# The native messaging manifests of Chrome, Chromium and Edge, owned by the
# package (the vendor's postinst copies them by hand, which leaves them
# unowned)
install -Dm644 "${pkgdir}/opt/softplan-websigner/manifest.json" \
  "${pkgdir}/etc/opt/chrome/native-messaging-hosts/br.com.softplan.webpki.json"
install -Dm644 "${pkgdir}/opt/softplan-websigner/manifest.json" \
  "${pkgdir}/etc/chromium/native-messaging-hosts/br.com.softplan.webpki.json"
install -Dm644 "${pkgdir}/opt/softplan-websigner/manifest-edge.json" \
  "${pkgdir}/etc/opt/edge/native-messaging-hosts/br.com.softplan.webpki.json"

# Archify folder permissions
find "${pkgdir}" -type d -exec chmod 755 {} +

}
