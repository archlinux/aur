# Maintainer: Amish <contact at via dot aur>
pkgname=c-icap
pkgver=0.5.5
pkgrel=1
pkgdesc='Implementation of an ICAP server'
depends=('brotli' 'libldap' 'pcre')
arch=(i686 x86_64)
url='http://c-icap.sourceforge.net/'
license=('GPL' 'LGPL')
source=("http://downloads.sourceforge.net/project/c-icap/c-icap/0.5.x/c_icap-${pkgver}.tar.gz"
        'c-icap.service'
        'c-icap.tmpfiles'
        'c-icap.sysusers'
        'c-icap.logrotate')
sha256sums=('5eafc7775ecb3fe49545451eaa31f045716d0242977588c0ba27c2c1b4683d8a'
            '313ae1b3ff52597158d3a914702d60b16248a8fb8f934e91644f63ad373e6375'
            'f13158c82b0ef625d3d142811eaf100de01ab09d8d82b66282f1d80bc78d10dd'
            'c903eb86e6968b9d3bd0a9ad3335e8ce76a718b6217251e9dd7e66d5cf1ac94a'
            '07d5d98801feb0b20fe3cbbf9f7d00148cbda7b2e9e2bc07d859c1c5aa154926')
backup=('etc/c-icap/c-icap.conf'
        'etc/c-icap/c-icap-local.conf'
        'etc/c-icap/c-icap.magic'
        'etc/logrotate.d/c-icap')

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

  # remove directories which should not be packaged
  rmdir "${pkgdir}"/var{/{log,run{/c-icap,}},}

  # allow more resources and adjust paths
  sed -i -e 's/^StartServers\s.*/StartServers 10/g' \
      -e 's/^MaxServers\s.*/MaxServers 50/g' \
      -e 's/^MaxSpareThreads\s.*/MaxSpareThreads 40/g' \
      -e 's/^ServerAdmin\s.*/ServerAdmin root@localhost/g' \
      -e 's/^ServerName\s.*/ServerName localhost/g' \
      -e 's/^DebugLevel\s.*/DebugLevel 0/g' \
      -e 's/^RemoteProxyUsers\s.*/RemoteProxyUsers on/g' \
      -e 's/^RemoteProxyUserHeader\s.*/RemoteProxyUserHeader X-Client-Username/g' \
      -e 's/^RemoteProxyUserHeaderEncoded\s.*/RemoteProxyUserHeaderEncoded off/g' \
      -e 's:/usr/local/c-icap/etc:/etc/c-icap:g' \
      -e 's:/usr/var/log:/var/log/c-icap:g' \
      -e '$ a\\' \
      -e '$ a Include c-icap-local.conf' \
      "${pkgdir}"/etc/c-icap/c-icap.conf{,.default}

  install -Dm644 /dev/null "${pkgdir}"/etc/c-icap/c-icap-local.conf
  install -Dm644 ../c-icap.service "${pkgdir}"/usr/lib/systemd/system/c-icap.service
  install -Dm644 ../c-icap.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/c-icap.conf
  install -Dm644 ../c-icap.sysusers "${pkgdir}"/usr/lib/sysusers.d/c-icap.conf
  install -Dm644 ../c-icap.logrotate "${pkgdir}"/etc/logrotate.d/c-icap
}
