# Maintainer: Amish <contact at via dot aur>
pkgname=c-icap
pkgver=0.3.3
pkgrel=8
pkgdesc='Implementation of an ICAP server'
arch=(i686 x86_64)
url='http://c-icap.sourceforge.net/'
license=('GPL' 'LGPL')
source=("http://downloads.sourceforge.net/project/c-icap/c-icap/0.3.x/c_icap-${pkgver}.tar.gz"
        'c-icap.conf'
        'c-icap.service'
        'tmpfiles.d'
        'logrotate')
sha256sums=('9fc0d7166e65b748138b750f1cba27933aab6ac201fbe2279ab9d7a9c24c7131'
            'cdaf71c5f1446c831d1cb9ce3fec9c0b9b13663e82135c6ea7fa05e51c82f804'
            '313ae1b3ff52597158d3a914702d60b16248a8fb8f934e91644f63ad373e6375'
            '485fa1649ad1a63f6f2ec46eb0c8100d8756be0ba99df2cf23aa2fc70f14b27d'
            '07d5d98801feb0b20fe3cbbf9f7d00148cbda7b2e9e2bc07d859c1c5aa154926')
backup=('etc/c-icap/c-icap.conf'
        'etc/c-icap/c-icap.magic'
        'etc/logrotate.d/c-icap')
install=install

build() {
  cd "${srcdir}/c_icap-${pkgver}"
  ./configure \
      --prefix=/usr \
      --localstatedir=/var \
      --sbindir=/usr/bin \
      --sysconfdir=/etc/c-icap \
      --enable-ipv6 \

  make
}

package() {
  cd "${srcdir}/c_icap-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # fix some bad permissions
  find "${pkgdir}"/etc/c-icap/ -type f -print0 | xargs -0 chmod 644
  chmod g-w "${pkgdir}"/var/log

  # remove /var/run directory which should not be packaged
  rmdir "${pkgdir}"/var/run/c-icap/ "${pkgdir}"/var/run/

  install -Dm644 ../c-icap.conf "${pkgdir}"/etc/c-icap/c-icap.conf
  install -Dm644 ../c-icap.service "${pkgdir}"/usr/lib/systemd/system/c-icap.service
  install -Dm644 ../tmpfiles.d "${pkgdir}"/usr/lib/tmpfiles.d/c-icap.conf
  install -Dm644 ../logrotate "${pkgdir}"/etc/logrotate.d/c-icap

  install -d -m750 "${pkgdir}"/var/log/c-icap
  chown 15:15 "${pkgdir}"/var/log/c-icap
}
