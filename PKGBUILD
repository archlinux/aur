# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: Martynas Mickevičius <mmartynas at gmail dot com>

# shellcheck shell=bash disable=SC2034,SC2164

_version=2.00
_build=00261

pkgname=ccpkip11
pkgver="$_version.$_build"
pkgrel=1
epoch=1
pkgdesc="PKCS #11 driver for CryptoTech smart cards"
arch=('x86_64')
url="https://www.cryptotech.com.pl/en/technical-support/smart-card-software"
license=('LicenseRef-CryptoTech')
depends=('gcc-libs' 'glibc' 'pcsclite')
makedepends=('patchelf')
source=("ccs_$_version-$_build.amd64.zip::https://download.cryptotech.com.pl/?key=standardlinuxccs64&mode=2"
        'LICENSE.html' # https://www.cryptotech.com.pl/?__wpdmlo=9803
        'ccpkip11.module')
sha256sums=('97c8efb035d3214e3951157213a9ee6007c747ebc57c1fb00f52bff58f5eef77'
            '361a2c17332988b84272676815bc711f26f1a4e460aa68b02009a7b2c8b0b538'
            '40d59f898853a0389b75f22701278d39e116acb8ee0d7d95380cec201640b268')

prepare() {
  cd Linuxx64

  bsdtar -xf ccs_$_version-$_build.amd64.tar.gz
}

package() {
  install -D -m644 LICENSE.html "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
  install -D -m755 "Linuxx64/ccs_$_version-$_build.amd64/lib/ccs/libccpkip11.so.$pkgver" "${pkgdir}/usr/lib/libccpkip11.so"

  # Remove insecure RPATH from library
  patchelf --remove-rpath "${pkgdir}/usr/lib/libccpkip11.so"

  # Add to default module search path for various programs
  install -d "${pkgdir}/usr/lib/pkcs11"
  ln -s ../libccpkip11.so "${pkgdir}/usr/lib/pkcs11/libccpkip11.so"

  # Support automatic loading in p11-kit (pkcs11.conf(5))
  install -D -m644 ccpkip11.module "${pkgdir}/usr/share/p11-kit/modules/ccpkip11.module"
}
