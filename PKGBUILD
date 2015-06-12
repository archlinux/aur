# Maintainer: John Lane <archlinux at jelmail dot com>
pkgname=clamassassin
pkgver=1.2.4
pkgrel=6
pkgdesc="A simple virus filter wrapper for ClamAV."
url="http://jameslick.com/clamassassin/"
arch=('any')
license=('BSD')
depends=('procmail' 'clamav' 'sh')
source=(http://jameslick.com/clamassassin/clamassassin-${pkgver}.tar.gz
        clamassassin-clamd.patch)
sha256sums=('63bae3963d27548d0fc7bbf76eb6bc5506291e9e1cb95aa13390497c4c17a100'
            '0904dccc934b86fbcde982e8ba21aeed2a1db8aeb6df1e2a6403358f161a6222')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --enable-clamdscan  

  # Clamassassin adds a header containing version information. When clamd isn't
  # running, the clamdscan version output contains an error message making the
  # text multi-line. This alters the body of the message which breaks base64
  # message decoding. This patch fixes this (also reported upstream:
  # http://lists.jameslick.com/pipermail/clamassassin-discuss/2015-June/000055.html)
  patch < ../clamassassin-clamd.patch

  make
  }
package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -d ${pkgdir}/usr/bin
  make bindir=${pkgdir}/usr/bin install 
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 README ${pkgdir}/usr/share/doc/${pkgname}/README
}
