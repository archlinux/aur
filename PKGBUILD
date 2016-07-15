# Maintainer: Luke R. <g4jc@openmailbox.org> GPG: rsa4096/3EAE8697

pkgname=samhain
pkgver=4.1.4
pkgrel=1
pkgdesc="file integrity / intrusion detection system"
arch=(i686 x86_64)
url="http://www.la-samhna.de/"
license=('GPL')
makedepends=('gcc' 'openssl' 'procps-ng')
source=("http://www.la-samhna.de/samhain/${pkgname}-current.tar.gz" 
'PKGBUILD.sig'
'PKGBUILD')
validpgpkeys=('CB6E213A349B8DF9E96B622AC3F4FFCF3EAE8697' # PKGBUILD Maintainer's key
'EF6CEF54701A0AFDB86AF4C31AAD26C80F571F6C') # Rainer Wichmann
sha512sums=('72e75e7a34705fa61d48c82e4c0ab1ac523c9bd5480c9335e305230e04d7c6295094ef616d9fca05b091d99659982d130812be36e9676ede68d743a4a1c46013'
            'SKIP'
            'SKIP')

pkgver() {
tar -ztvf samhain-current.tar.gz | head -n1 | awk '{print $6}' | sed "s/samhain-//" | sed "s/.tar.gz//" # get latest version number
}

build() {
  gpg --verify PKGBUILD.sig PKGBUILD
  echo "Note: If the GPG verification fails, import the PKGBUILD maintainer's GPG key. See: https://wiki.parabola.nu/GnuPG#Import_key"
  whirlpoolsum=('515e5d2c297e2ca2e0d69d0bad200eb4bc81449a907346c9976124381a9ab910a6fca6024853ce76d21928d12281aa236b5ed76ac3df511cef3b4f5766a865fc')
  [[ "$(openssl dgst -r -whirlpool samhain-current.tar.gz | awk '{print $1}')" = ${whirlpoolsum} ]] && echo "Whirlpool checksum passed." || { echo "Whirlpool checksum failed!!" ;  exit 1; } # This is an added security layer. If SHA512 for some unlikely reason fails, whirlpool will check and abort if it too fails to match.
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
}
