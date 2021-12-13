# Maintainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

_pkgname=alsa-lib
pkgname=$_pkgname-x205ta
pkgver=1.2.6.1
pkgrel=1
pkgdesc="An alternative implementation of Linux sound support, with UCM files for the ASUS x205ta."
arch=('i686' 'pentium4' 'x86_64')
url="https://www.alsa-project.org"
plbossart_url="https://raw.githubusercontent.com/plbossart/UCM"
license=('LGPL2.1')
depends=('glibc' 'alsa-topology-conf' 'alsa-ucm-conf')
provides=('libasound.so=2-32' 'libasound.so=2-64'
	  'libatopology.so=2-32' 'libatopology.so=2-64'
	  "${_pkgname}=${pkgver}")
install="${_pkgname}.install"
conflicts=("${_pkgname}")
source=("https://www.alsa-project.org/files/pub/lib/${_pkgname}-${pkgver}.tar.bz2"{,.sig}
	"${plbossart_url}/c8b344ca650a62aa809242b0c9ba908eac963125/chtrt5645/chtrt5645.conf"
	"${plbossart_url}/UCM/c7405e6f03eb2404edb38b495c27225364bf16f4/sof-chtrt5645/HiFi.conf")
sha512sums=('70e539cf092b5d43e00e4134d8a3e184f0dc34312823e4b58a574320cbf06cb7369bc3251ecb1858033756a7a8c35d36faa8da48d49f6efe0cec905784adbd45'
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
