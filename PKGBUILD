# Maintainer:  mrxx <mrxx at cyberhome dot at>
# Contributor: Tianyu Liu <lty1993[at]lty[dot]me>

pkgname=rwhoisd
pkgver=1.5.9.6
pkgrel=3
pkgdesc="RWhois (Referral Whois) is a Directory Services protocol which extends and enhances the Whois concept in a hierarchical and scalable fashion."
url="http://projects.arin.net/rwhois/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=()
optdepends=()
makedepends=()
conflicts=()
install=rwhoisd.install
source=("https://github.com/arineng/rwhoisd/archive/${pkgver}.tar.gz" 'rwhoisd.service' 'rwhoisd.install')
sha256sums=('c1768d2414bca88f10acc2e50a23288a21176416ddfe697ee4326636c0b062f7'
            '7ec1372710e51291d3946fcc637e22a885da75dbcd54274ea2681474e91893bf'
            '5b58420875108a78fef4c47b7463b4a20bb6d443fda5c31ab89e75f87bc65b01')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/${pkgname}"
  sed -i 's/\/usr\/local\/bin\/rwhois/\/usr\/bin\/rwhois/' common/conf.h 

  ./configure --prefix=/usr --sysconfdir=/var/lib --sbindir=/usr/bin
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/${pkgname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 tools/scripts/rwhois.pl ${pkgdir}/usr/bin/rwhois
  mv ${pkgdir}/var/lib/${pkgname}/samples/* ${pkgdir}/var/lib/${pkgname}/
  rmdir ${pkgdir}/var/lib/${pkgname}/samples

  install -d ${pkgdir}/etc/${pkgname}
  mv "${pkgdir}/var/lib/${pkgname}/${pkgname}.conf" "${pkgdir}/etc/${pkgname}/"

  patch -p0 ${pkgdir}/etc/${pkgname}/${pkgname}.conf <<EOF
15c15
< root-dir: /var/lib/rwhoisd/samples
---
> root-dir: /var/lib/rwhoisd
141c141
< # default-log-file: rwhoisd.log
---
> default-log-file: /var/log/rwhoisd/rwhoisd.log
EOF

  install -d ${pkgdir}/usr/share/doc/${pkgname}/
  install -Dm644 doc/* INSTALL ${pkgdir}/usr/share/doc/${pkgname}/
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  install -Dm644 ${srcdir}/${pkgname}.service "${pkgdir}"/usr/lib/systemd/system/${pkgname}.service

  install -d ${pkgdir}/usr/share/man/man8
  gzip -c "${pkgdir}/usr/share/doc/${pkgname}/rwhoisd.8" >"${pkgdir}/usr/share/man/man8/rwhoisd.8.gz"
  gzip -c "${pkgdir}/usr/share/doc/${pkgname}/rwhois_indexer.8" >"${pkgdir}/usr/share/man/man8/rwhois_indexer.8.gz"
}

# vim:set ts=2 sw=2 et:
