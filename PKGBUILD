# Maintainer: Luke R. <g4jc@openmailbox.org> GPG: rsa4096/3EAE8697

pkgname=samhain
pkgver=4.2.0
pkgrel=1
pkgdesc="file integrity / intrusion detection system"
arch=(i686 x86_64)
url="http://www.la-samhna.de/"
license=('GPL')
makedepends=('gcc' 'openssl' 'procps-ng')
source=("http://www.la-samhna.de/samhain/${pkgname}-current.tar.gz" 
'PKGBUILD.sig'
'PKGBUILD')
options=(!emptydirs)
validpgpkeys=('CB6E213A349B8DF9E96B622AC3F4FFCF3EAE8697' # PKGBUILD Maintainer's key
'EF6CEF54701A0AFDB86AF4C31AAD26C80F571F6C') # Rainer Wichmann
sha512sums=('bacb82f87d7e6c7bad49f99454279e19c6d1cfa2e353de4f2346cee78f9761173aed5fc26dd956f1c88928d28d25e98c07bc8f74f2984bddae64f96ad1e6b4b2'
            'SKIP'
            'SKIP')
whirlpoolsums=('909c9861233f31b4fcf4cfc006f81bc5173c2bf8d7b91adf0ef4489f43427fe9cf8dbb7a077a92faa7ce73eb752d02c3d13e393d70a761ff4c4eb9e785491fbb'
            'SKIP'
            'SKIP')

pkgver() {
tar -ztvf samhain-current.tar.gz | head -n1 | awk '{print $6}' | sed "s/samhain-//" | sed "s/.tar.gz//" # get latest version number
}

build() {
  gpg --verify PKGBUILD.sig PKGBUILD
  echo "Note: If the GPG verification fails, import the PKGBUILD maintainer's GPG key. See: https://wiki.parabola.nu/GnuPG#Import_key"
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
