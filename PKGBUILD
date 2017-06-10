# Maintainer: Amish <contact at via dot aur>
pkgname=c-icap
pkgver=0.5.2
pkgrel=3
pkgdesc='Implementation of an ICAP server'
arch=(i686 x86_64)
url='http://c-icap.sourceforge.net/'
license=('GPL' 'LGPL')
source=("http://downloads.sourceforge.net/project/c-icap/c-icap/0.5.x/c_icap-${pkgver}.tar.gz"
        'c-icap.conf'
        'c-icap.service'
        'c-icap.tmpfiles'
        'c-icap.sysusers'
        'c-icap.logrotate')
sha256sums=('1a9ce61622176eaf068d97d6a00baedbbfca96002c5115c8147b41c95c8164ca'
            '7081377defff06af6dd8cbea9776ad45d45a3eae84a9d109681bb49c9b2f1725'
            '313ae1b3ff52597158d3a914702d60b16248a8fb8f934e91644f63ad373e6375'
            '485fa1649ad1a63f6f2ec46eb0c8100d8756be0ba99df2cf23aa2fc70f14b27d'
            'c903eb86e6968b9d3bd0a9ad3335e8ce76a718b6217251e9dd7e66d5cf1ac94a'
            '07d5d98801feb0b20fe3cbbf9f7d00148cbda7b2e9e2bc07d859c1c5aa154926')
backup=('etc/c-icap/c-icap.conf'
        'etc/c-icap/c-icap.magic'
        'etc/logrotate.d/c-icap')
install=$pkgname.install

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
  install -Dm644 ../c-icap.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/c-icap.conf
  install -Dm644 ../c-icap.sysusers "${pkgdir}"/usr/lib/sysusers.d/c-icap.conf
  install -Dm644 ../c-icap.logrotate "${pkgdir}"/etc/logrotate.d/c-icap

  install -d -m750 "${pkgdir}"/var/log/c-icap
  chown 15:15 "${pkgdir}"/var/log/c-icap
}
