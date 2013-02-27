# $Id$
# Maintainer: Thomas Bächler <thomas@archlinux.org>

pkgname=wireless-regdb
pkgver=2013.01.11
pkgrel=1
pkgdesc="Central Regulatory Domain Database"
arch=('any')
url="http://wireless.kernel.org/en/developers/Regulatory/CRDA"
backup=(etc/conf.d/wireless-regdom)
license=('custom')
makedepends=('crda')
depends=('sh')
install=wireless-regdb.install
source=(http://wireless.kernel.org/download/${pkgname}/regulatory.bins/${pkgver}-regulatory.bin
        linville.key.pub.pem
        regulatory.bin.5
        LICENSE
        crda.conf.d)
sha256sums=('b1ee0b20c123c612dfdb6851ab42c01666f66fb583e0e590942f19bb54cf84be'
            '5d49ed0267082af35fd147a58434f19f7619518064b502b8a87143ee3e140546'
            'f24bcaf67ecd088b407a9650375704a2fe1b23e3cfffbb1e7fe1026a02b3178a'
            '678b0df753c86198fc496d1f1033429bbd57f101472132ee7eaaf9f5e0a7fae1'
            '192428fd959806705356107bffc97b8b379854e79bd013c4ee140e5202326e2b')

package() {
  # Install and verify regulatory.bin file
  msg "Installing and verifying the regulatory.bin file ..."
  install -D -m644 "${srcdir}"/${pkgver}-regulatory.bin "${pkgdir}"/usr/lib/crda/regulatory.bin
  # If crda is installed, the wireless regdb can be verified using regdbdump
  # Keep this step optional so no depend/makedepend loop is created
  if /usr/bin/regdbdump "${pkgdir}"/usr/lib/crda/regulatory.bin > /dev/null; then
    msg "Regulatory database verification was succesful."
  else
    error "Regulatory database verification failed."
    return 1
  fi

  install -D -m644 "${srcdir}"/linville.key.pub.pem "${pkgdir}"/usr/lib/crda/pubkeys/linville.key.pub.pem
  install -D -m644 "${srcdir}"/LICENSE "${pkgdir}"/usr/share/licenses/wireless-regdb/LICENSE
  install -D -m644 "${srcdir}"/regulatory.bin.5 "${pkgdir}"/usr/share/man/man5/regulatory.bin.5

  msg "Installing /etc/conf.d/wireless-regdom ..."
  install -D -m644 "${srcdir}"/crda.conf.d "${pkgdir}"/etc/conf.d/wireless-regdom
  for dom in $(/usr/bin/regdbdump "${pkgdir}"/usr/lib/crda/regulatory.bin | grep ^country | cut -d' ' -f2 | sed 's|:||g'); do
    echo "#WIRELESS_REGDOM=\"${dom}\"" >> "${pkgdir}"/etc/conf.d/wireless-regdom.tmp
  done
  sort -u "${pkgdir}"/etc/conf.d/wireless-regdom.tmp >> "${pkgdir}"/etc/conf.d/wireless-regdom
  rm "${pkgdir}"/etc/conf.d/wireless-regdom.tmp

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
