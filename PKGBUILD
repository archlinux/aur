# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>

_pkgbase=loop-aes
pkgname=loop-aes-dkms
_pkgname=loop-AES
pkgver=3.7v
pkgrel=5
pkgdesc="loop Linux kernel module that has AES,Twofish,Blowfish,Serpent cipher built-in (DKMS version)"
arch=('i686' 'x86_64')
license=('GPL2')
url="https://loop-aes.sourceforge.net"
depends=('dkms' 'linux' 'util-linux-aes')
conflicts=("${_pkgbase}")
install=${pkgname}.install
source=(https://downloads.sourceforge.net/project/${_pkgbase}/${_pkgbase}/v${pkgver}/${_pkgname}-v${pkgver}.tar.bz2{,.sign}
        'dkms.patch')
sha256sums=('89ab4f721f21bff4bb478f60947f19d47b92bd67858a6a57e6760030b969f294'
            'SKIP'
            'a7f843114bbb47c19c666f55d38a22c91138885eb79d1eae0aca86f18d10eba9')
validpgpkeys=('12D64C3ADCDA0AA427BDACDFF0733C808132F189') # Jari Ruusu (2013) <jariruusu@users.sourceforge.net>


prepare() {
  cd "${_pkgname}-v${pkgver}"

  patch -p0 < "${srcdir}"/dkms.patch
}

package() {
  mkdir -p "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}
  cp -r ${_pkgname}-v${pkgver}/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

  # Set name and version
  sed -e "s/@PKGNAME@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  install -d -m 0755 "${pkgdir}/usr/lib/modprobe.d"
  install -d -m 0755 "${pkgdir}/usr/lib/modules-load.d"
  install -d -m 0755 "${pkgdir}/usr/share/doc/${pkgname}"

  cd "${_pkgname}-v${pkgver}"

  install -D -m 0755 loop-aes-keygen "${pkgdir}/usr/bin/loop-aes-keygen"
  install -D -m 0644 loop-aes-keygen.1 "${pkgdir}/usr/share/man/man1/loop-aes-keygen.1"
  install -m 0644 ChangeLog README "${pkgdir}/usr/share/doc/${pkgname}"

  echo "blacklist loop" > "${pkgdir}/usr/lib/modprobe.d/loop.conf"
  echo "alias loop loop-aes" >> "${pkgdir}/usr/lib/modprobe.d/loop.conf"
  echo "loop-aes" > "${pkgdir}/usr/lib/modules-load.d/loop.conf"
  echo "loop_serpent" >> "${pkgdir}/usr/lib/modules-load.d/loop.conf"
  echo "loop_twofish" >> "${pkgdir}/usr/lib/modules-load.d/loop.conf"
  echo "loop_blowfish" >> "${pkgdir}/usr/lib/modules-load.d/loop.conf"
}
