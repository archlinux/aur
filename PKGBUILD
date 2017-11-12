# Maintainer: Luke R. <g4jc@bulletmail.org> GPG:  c25519/D85D2F527B0

pkgname=samhain
pkgver=4.2.3
pkgrel=1
pkgdesc="file integrity / intrusion detection system"
arch=(i686 x86_64)
url="http://www.la-samhna.de/"
license=('GPL')
makedepends=('gcc' 'openssl' 'procps-ng')
source=("http://www.la-samhna.de/samhain/${pkgname}-current.tar.gz")
options=(!emptydirs)
validpgpkeys=('EF6CEF54701A0AFDB86AF4C31AAD26C80F571F6C') # Rainer Wichmann
sha512sums=('17cb37548068fb682a5e6b8d7bff5d7c5826f80ef80a116dafb371c79e34f9ab5d31ff88ef7a03453e2f4c4adf0f2f11595bcee8eca200239b04c3d9a75df71d')
whirlpoolsums=('b18c004d8b95208f4910ea04b4f441f35b6071fda4b90e88ba0da8f70589a45baf63507765b5dc36648d282e77235d63d1ee982706235b9b788b4164fd7b2dad')

pkgver() {
tar -ztvf samhain-current.tar.gz | head -n1 | awk '{print $6}' | sed "s/samhain-//" | sed "s/.tar.gz//" # get latest version number
}

build() {
  gpg --verify samhain-${pkgver}.tar.gz.asc samhain-${pkgver}.tar.gz
  echo "Note: If the GPG verification fails, import the Samhain GPG key: http://www.la-samhna.de/samhain/s_rkey.html"
  tar -zxvf "${srcdir}/${pkgname}-current.tar.gz" -C "${srcdir}"/.
  cd "${srcdir}"
  tar -zxvf ${pkgname}-${pkgver}.tar.gz
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --localstatedir=/var --sysconfdir=/etc --with-trusted=0 --sbindir=/usr/bin 
  # see samhain documentation, lots of other options available. e.g. use --enable-network=server to run in server mode.
}

package() {
  cd "${pkgname}-${pkgver}"
  make || return 1
  make DESTDIR="$pkgdir/" install
  chmod 755 $pkgdir/usr/bin/samhain
  chmod 644 $pkgdir/etc/samhainrc
}
