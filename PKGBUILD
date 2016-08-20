# Maintainer: Luke R. <g4jc@openmailbox.org> GPG: rsa4096/3EAE8697

pkgname=uftp
pkgver=4.9.2
pkgrel=2
pkgdesc="UFTP is an encrypted multicast file transfer program, designed to securely, reliably, and efficiently transfer files to multiple receivers simultaneously."
arch=(i686 x86_64)
url="http://uftp-multicast.sourceforge.net/"
license=('GPL3')
makedepends=('gcc' 'openssl')
source=("http://downloads.sourceforge.net/project/$pkgname-multicast/source-tar/$pkgname-$pkgver.tar.gz")
sha512sums=('9a95e6a4c8b58a157353e43cfd4ca3dcccfced700e02b7d9d119a09f9e652474d5ffadd04a3dc7b939b94c7d58fbe186e11e581813b5417934988bfa021f0a62')

-prepare() {
  cd "$srcdir/${pkgname}-${pkgver}/"
}

build() {
  whirlpoolsum=('92182508fd707e68838af3904355f7eb0edc777a8029f756c485c407e447a8aac3d0611fe64b68ca8d061f1dc5040a8334fa219c298416ab25e5daecdd9c8e25')
  [[ "$(openssl dgst -r -whirlpool $pkgname-$pkgver.tar.gz | awk '{print $1}')" = ${whirlpoolsum} ]] && echo "Whirlpool checksum passed." || { echo "Whirlpool checksum failed!!" ;  exit 1; } # This is an added security layer. If SHA512 for some unlikely reason fails, whirlpool will check and abort if it too fails to match.
  cd "$srcdir/$pkgname-$pkgver/"
  make all || return 1
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install
  ## Cleanup upstream installer ##
  mv $pkgdir/bin $pkgdir/usr/bin
  mv $pkgdir/usr/sbin/* $pkgdir/usr/bin
  rm -rf $pkgdir/usr/sbin
}
