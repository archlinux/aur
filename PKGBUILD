# Maintainer: Martynas Mickevičius <mmartynas at gmail dot com>
_version=2.01
_build=00161

pkgname=ccpkip11
pkgver="$_version.$_build"
pkgrel=2
pkgdesc="PKCS #11 driver for CryptoTech smart cards"
arch=('x86_64')
url="http://www.cryptotech.com.pl/Produkty/CryptoCard_Suite_Pobieranie,content.html"
license=('custom')
depends=('pcsclite')
source=(ccs_$_version-$_build.amd64.deb::"http://download.cryptotech.com.pl/?key=standardlinuxccs64&mode=2"
        'LICENSE'
        'ccpkip11.module')
sha256sums=('0c15e51d685fa53031915cdc7be45cc41493fecc08720f4d116b7ecbb7ff2309'
            'ad4dc75fa4f544278f51d9e444db3459a6a362dc264f5c81a9725745d96ca087'
            '40d59f898853a0389b75f22701278d39e116acb8ee0d7d95380cec201640b268')

prepare() {
  bsdtar -xf data.tar.gz
}

package() {
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "usr/lib/ccs/libccpkip11.so.$pkgver" "${pkgdir}/usr/lib/libccpkip11.so"

  # Add to default module search path for various programs
  install -d "${pkgdir}/usr/lib/pkcs11"
  ln -s ../libccpkip11.so "${pkgdir}/usr/lib/pkcs11/libccpkip11.so"

  # Support automatic loading in p11-kit (pkcs11.conf(5))
  install -D -m644 ccpkip11.module "${pkgdir}/usr/share/p11-kit/modules/ccpkip11.module"
}
