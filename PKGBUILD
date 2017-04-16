# $Id$
# Maintainer: Thomas Bächler <thomas@archlinux.org>

pkgname=wireless-regdb-pentest
_pkgname=wireless-regdb
pkgver=2017.03.07
pkgrel=1
pkgdesc="Central Regulatory Domain Database with txpower/channels modified for pentesters. please respect the law in your country"
arch=('any')
url="http://wireless.kernel.org/en/developers/Regulatory"
backup=(etc/conf.d/wireless-regdom)
license=('custom')
depends=('sh')
makedepends=('crda')
conflicts=('wireless-regdb')
provides=('wireless-regdb')
source=(https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-${pkgver}.tar.xz
        'crda.conf.d'
	'db.txt.patch')
sha256sums=('371eafa3b26ece916ef83aca02c4bed2e54099eb5b8c6d22d3a4358dce6535b9'
            '192428fd959806705356107bffc97b8b379854e79bd013c4ee140e5202326e2b'
            '464037af76e3a90548f30a4a0fcacc35053da8ea9d077c76f9ab728cf0772313')

prepare() {
  cd "${srcdir}"/"${_pkgname}"-"${pkgver}"
  patch -Np1 -i ../db.txt.patch
}

package() {
  # Install and verify regulatory.bin file
  msg "Installing and verifying the regulatory.bin file ..."
  install -D -m644 "${srcdir}"/${_pkgname}-${pkgver}/regulatory.bin "${pkgdir}"/usr/lib/crda/regulatory.bin
  # This creates a depend/makedepend loop:
  # crda depends on wireless-regdb (but strictly doesn't makedepend on it)
  # wireless-regdb makedepends on crda
  if /usr/bin/regdbdump "${pkgdir}"/usr/lib/crda/regulatory.bin > /dev/null; then
    msg "Regulatory database verification was succesful."
  else
    error "Regulatory database verification failed."
    return 1
  fi
  install -D -m644 "${srcdir}"/${_pkgname}-${pkgver}/sforshee.key.pub.pem "${pkgdir}"/usr/lib/crda/pubkeys/sforshee.key.pub.pem
  install -D -m644 "${srcdir}"/${_pkgname}-${pkgver}/LICENSE "${pkgdir}"/usr/share/licenses/wireless-regdb/LICENSE
  install -D -m644 "${srcdir}"/${_pkgname}-${pkgver}/regulatory.bin.5 "${pkgdir}"/usr/share/man/man5/regulatory.bin.5

  msg "Installing /etc/conf.d/wireless-regdom ..."
  install -D -m644 "${srcdir}"/crda.conf.d "${pkgdir}"/etc/conf.d/wireless-regdom
  for dom in $(grep ^country "${srcdir}"/${_pkgname}-${pkgver}/db.txt | cut -d' ' -f2 | sed 's|:||g'); do
    echo "#WIRELESS_REGDOM=\"${dom}\"" >> "${pkgdir}"/etc/conf.d/wireless-regdom.tmp
  done
  sort -u "${pkgdir}"/etc/conf.d/wireless-regdom.tmp >> "${pkgdir}"/etc/conf.d/wireless-regdom
  rm "${pkgdir}"/etc/conf.d/wireless-regdom.tmp

  install -D -m644 "${srcdir}"/${_pkgname}-${pkgver}/LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
