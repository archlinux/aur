# Maintainer: Nick Milosevic <nick000 at gmail dot com>
# Contributor: Igor Mosyagin <c6h10o5 at gmail dot com>
pkgname=brother-mfc-7840w
pkgver=2.0.2
pkgrel=3
pkgdesc="CUPS driver for Brother MFC-7840W printer"
arch=('i686' 'x86_64')
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
license=('GPL')
depends=('cups' 'ghostscript' 'gsfonts' 'foomatic-filters')
depends_x86_64=('lib32-glibc')
install="brother-mfc-7840w.install"
source=(http://www.brother.com/pub/bsc/linux/dlf/brmfc7840wlpr-$pkgver-1.i386.rpm
        http://www.brother.com/pub/bsc/linux/dlf/cupswrapperMFC7840W-$pkgver-1.i386.rpm
        brother-mfc-7840w.patch)

sha256sums=('334c492d26abf59e83db4f0d16297956f53e5c71eb4ae315d59ded562f883fb1'
            '1d8f4c17f6ec3bdfe5940afc703856b16e78e4e72e4c9452a8529f337ae7ad27'
            '136b48610f92661dcad54698d3e09707b820f55fd6c076d02ef075c726864849')

prepare() {
  # patch files to adhere arch packaging standard
  patch -p0 < "${srcdir}"/brother-mfc-7840w.patch
}

build() {
  # generate ppd and wrapper file
  "${srcdir}"/usr/local/Brother/cupswrapper/cupswrapperMFC7840W-$pkgver
}

package() {
  mkdir -p "${pkgdir}"/usr/share
  cp -r "${srcdir}"/usr/bin "${pkgdir}"/usr
  cp -r "${srcdir}"/usr/lib "${pkgdir}"/usr
  cp -r "${srcdir}"/usr/local/Brother "${pkgdir}"/usr/share/brother
  cp -r "${srcdir}"/var "${pkgdir}"/

  install -Dm644 ppd_file "${pkgdir}"/usr/share/cups/model/MFC7840W.ppd
  install -Dm755 wrapper  "${pkgdir}"/usr/lib/cups/filter/brlpdwrapperMFC7840W

  rm "${pkgdir}"/usr/share/brother/cupswrapper/cupswrapperMFC7840W-$pkgver
  rm "${pkgdir}"/usr/share/brother/inf/setupPrintcap
}
