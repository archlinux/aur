# Maintainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

_pkgname=alsa-lib
pkgname=$_pkgname-x205ta
pkgver=1.2.5.1
pkgrel=1
pkgdesc="An alternative implementation of Linux sound support, with UCM files for the ASUS x205ta."
arch=('x86_64')
url="https://www.alsa-project.org"
plbossart_url="https://raw.githubusercontent.com/plbossart/UCM"
license=('LGPL2.1')
depends=('glibc' 'alsa-topology-conf' 'alsa-ucm-conf')
provides=('libasound.so' 'libatopology.so' "${pkgname%-x205ta}=$pkgver")
install="${_pkgname}.install"
conflicts=('alsa-lib')
source=("https://www.alsa-project.org/files/pub/lib/${_pkgname}-${pkgver}.tar.bz2"{,.sig}
	"${plbossart_url}/c8b344ca650a62aa809242b0c9ba908eac963125/chtrt5645/chtrt5645.conf"
	"${plbossart_url}/UCM/c7405e6f03eb2404edb38b495c27225364bf16f4/sof-chtrt5645/HiFi.conf")
sha512sums=('01998ffa449e925ff552c13aea47f9540903afdc533086067c78dcaba4d239c347180d3d28bb0000e6d19b7779c7249fcc77a30057930ca22d18ba55e163fa1c'
            'SKIP'
            '9b65ff4fe9d10e40e4eb69398c53de6d5eb07ba1a5526813a07182008d67ea68e7245ce3db44fc1a69f70eeef928c9ede742c90785e1f90298c07c49db965ba0'
            '4bb154a791fa2df7f1a165eaa8a970df9790e8315c5e2f43c0482ea867413ccf31a5c40700698357b4972de20ca2f4d9a7276e2e4968f4bbafd36ce57574bd32')
validpgpkeys=('F04DF50737AC1A884C4B3D718380596DA6E59C91') # ALSA Release Team (Package Signing Key v1) <release@alsa-project.org>

prepare() {
  cd "${_pkgname}-$pkgver"
  autoreconf -vfi
}

build() {
  cd "${_pkgname}-$pkgver"
  ./configure --prefix=/usr \
              --without-debug
  make
}

check() {
  cd "${_pkgname}-${pkgver}"
  export LD_LIBRARY_PATH="${PWD}/src/.libs/:${LD_LIBRARY_PATH}"
  make -k check
}

package() {
  cd "${_pkgname}-$pkgver"
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install -C doc
  install -vDm 644 {MEMORY-LEAK,TODO,NOTES,ChangeLog,doc/asoundrc.txt} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
  ucm_path="/usr/share/alsa/ucm/"
  mkdir -p "${pkgdir}/${ucm_path}/chtrt5645"
  install -m 644 "${srcdir}/HiFi.conf" "${pkgdir}/${ucm_path}/chtrt5645/HiFi.conf"
  install -m 644 "${srcdir}/chtrt5645.conf" "${pkgdir}/${ucm_path}/chtrt5645/chtrt5645.conf"
}
