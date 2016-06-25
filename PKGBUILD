# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Past maintainer: icaruseffect <icaruseffect at posteo dot net>
pkgname="burp-backup-git"
_pkgname="burp"
pkgver=2.0.30.r48.g1892559
pkgrel=4
pkgdesc="Burp is a backup and restore program. It uses librsync in order to save on the amount of space that is used by each backup."
arch=('i686' 'x86_64')
license=('AGPLv3')
depends=('librsync' 'openssl')
makedepends=('uthash' 'git' 'rsync')
conflicts=('burp-backup' 'burp-backup-dev')
provides=(burp-backup)

url='http://burp.grke.org/'
source=('burp::git+https://github.com/grke/burp.git#branch=master'
        'burp.service'
	'burp.service.sig')

sha512sums=('SKIP'
            'c729903764b482ed89edddd0d7b3d3c3477671bce0a0f4cc35a4d0658a4bb2f27dc1c911a531e77572671c5ff49c2e5652aaaca452d8929ecfa2d5ef18fb41da'
            'SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  autoreconf -vif
  ./configure --prefix=/usr --sysconfdir=/etc/burp --localstatedir=/ --sbindir=/usr/bin || return 1

  cd configs
  for i in client/burp.conf.in server/burp.conf.in certs/CA/CA.cnf.in;
  do
    sed -i \
	-e 's/@sysconfdir@/\/etc\/burp/g' \
	-e 's/@sbindir@/\/usr\/bin/g' \
	-e 's/@scriptdir@/\/usr\/share\/burp/g' \
	-e 's/@runstatedir@/\/run/g' \
	-e 's/@server_address@/127.0.0.1/g' ${i}
  done
  find certs/ -type d -exec chmod 750 '{}' \;
  find certs/ -type f -exec chmod 640 '{}' \;
}

backup=('etc/burp/burp.conf'
  'etc/burp/burp-server.conf'
  'etc/cron.d/burp'
  'etc/burp/CA-client'
  'etc/burp/clientconfdir'
)

package() {
  cd "${srcdir}/${_pkgname}"

 # cron.d logrotate
  mkdir -p ${pkgdir}/etc/cron.d
  cp debian/burp.cron.d ${pkgdir}/etc/cron.d/burp
  mkdir -p ${pkgdir}/etc/logrotate.d
  cp debian/logrotate ${pkgdir}/etc/logrotate.d/burp
  mkdir -p ${pkgdir}/etc/burp

  make || return 1
  make DESTDIR="${pkgdir}" install
  
 # install systemd service
  mkdir -p ${pkgdir}/usr/lib/systemd/system
  cp ../burp.service $pkgdir/usr/lib/systemd/system

 # fix permissions, install files
  mkdir -p ${pkgdir}/var/spool/burp
  chmod 755 ${pkgdir}/var/spool
  chmod 700 ${pkgdir}/var/spool/burp

  install -D -m 0600 configs/client/burp.conf.in ${pkgdir}/etc/burp/burp.conf
  install -D -m 0600 configs/server/burp.conf.in ${pkgdir}/etc/burp/burp-server.conf
  rsync -a configs/server/clientconfdir ${pkgdir}/etc/burp/.
  chmod 0700 configs/server/clientconfdir ${pkgdir}/etc/burp/clientconfdir
  install -D -m 0600 configs/certs/CA/CA.cnf.in ${pkgdir}/etc/burp/CA.cnf
  
}
