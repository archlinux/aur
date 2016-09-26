# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: skydrome <skydrome@i2pmail.org>
# Contributor: Valere Monseur <valere_monseur@hotmail.com>
# Contributor: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# Contributor: (asper, noob

pkgbase=vuurmuur-devel
pkgname=(
libvuurmuur-devel
vuurmuur-devel
vuurmuur-conf-devel
)
_pkgname=vuurmuur
pkgver=0.8rc2
pkgrel=1
pkgdesc='Powerful front-end for iptables aimed at system-administrators who need a decent firewall, but dont have netfilter specific knowledge - development release'
arch=('i686' 'x86_64')
url='http://www.vuurmuur.org'
license=('GPL')
install='vuurmuur.install'
source=(
https://github.com/inliniac/vuurmuur/archive/$pkgver.tar.gz
modules.conf
vuurmuur.rc
vuurmuur.service
vuurmuur.script
)
sha512sums=('0db3fbb049b9e64c65c268d459cc3da398f296a4245a9b0f571b39f84bdc80e7e14d327a21ddbb70d9f1a3af3e32366fa2a85ae2a23df9703e1460bc9a22a399'
            '897c0438ba7ef2481cc3f9b7e3396988064461cde99430e848ac31a73445200f2852e60cf11305d1c06397e34db997ebbd205adb80996d030bce519bb6f82564'
            '35a8e4dea8645be3f9fce76e9e9034da40b7f216f0f302833c6491d5ba017652d7a653121a8cf90d6ac8ac85455138b0d3e07cf80efec6525b723d789e34c709'
            '41dcbc9d4b386ecc2e4b688fcdd4df26f1e23afa53b6a3adda7cc059b9f1c68bd2c60de2167083fba097aab9a45e6ca942637377a1f3cd4b6fc825a5cf88ff0f'
            '6cfd0a9634c577708ff44b78408c4968b4bc6142ad84b6757b9f11e6d47057f98dfb91e9174a9555c9fb9a5810cc36b05678338ae4c42db1e8e688b23feb73ad')
build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  msg2 "Building libvuurmuur"
  pushd libvuurmuur
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make
  popd

  msg2 "Building vuurmuur-conf"
  pushd vuurmuur-conf
  ./autogen.sh
  sed -i 's|-rpath|-rpath-link|' configure
  LDFLAGS+="-L${srcdir}/${_pkgname}-${pkgver}/libvuurmuur/src \
    -L${srcdir}/${_pkgname}-${pkgver}/libvuurmuur/src/.libs \
    -Wl,-rpath=/usr/lib/${_pkgname}/plugins" \
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --with-libvuurmuur-includes="${srcdir}/${_pkgname}-${pkgver}/libvuurmuur/src" \
    --with-libvuurmuur-libraries="${srcdir}/${_pkgname}-${pkgver}/libvuurmuur/src" \
    ;
  make
  popd

  msg2 "Building vuurmuur"
  pushd vuurmuur
  ./autogen.sh
  sed -i 's|-rpath|-rpath-link|' configure
  LDFLAGS+="-L${srcdir}/${_pkgname}-${pkgver}/libvuurmuur/src \
    -L${srcdir}/${_pkgname}-${pkgver}/libvuurmuur/src/.libs \
    -Wl,-rpath=/usr/lib/${_pkgname}/plugins" \
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --with-libvuurmuur-includes="${srcdir}/${_pkgname}-${pkgver}/libvuurmuur/src" \
    --with-libvuurmuur-libraries="${srcdir}/${_pkgname}-${pkgver}/libvuurmuur/src" \
    ;
  make
  popd

}
package_libvuurmuur-devel() {
  depends=(glibc)
  provides=(libvuurmuur)
  pkgdesc='Iptables frontend. Common library and plugins.'
  cd ${srcdir}/${_pkgname}-${pkgver}

  pushd libvuurmuur
  make DESTDIR=${pkgdir} install
  install -Dm644 ${srcdir}/${_pkgname}-${pkgver}/libvuurmuur/COPYING \
    ${pkgdir}/usr/share/licenses/libvuurmuur/COPYING
}
package_vuurmuur-devel() {
  backup=(
  etc/vuurmuur/config.conf
  etc/vuurmuur/modules.conf
# etc/vuurmuur/vuurmuur_conf.conf
  etc/vuurmuur/plugins/textdir.conf
  etc/logrotate.d/vuurmuur
  )
  conflicts=(vuurmuur)
  provides=(vuurmuur)
  depends=(iptables libjpeg libnetfilter_log libvuurmuur)
  optdepends=(
  'conntrack-tools: for connection tracking'
  'iproute2: for traffic shapping'
  'iptrafvol: for traffic volume logging'
  )
  cd ${srcdir}/${_pkgname}-${pkgver}

  pushd vuurmuur
  make DESTDIR=${pkgdir} install

  # make directory structure
  install -dm700 ${pkgdir}/etc/${_pkgname}
  install -dm700 ${pkgdir}/etc/${_pkgname}/plugins
  install -dm755 ${pkgdir}/etc/logrotate.d/
  install -dm755 ${pkgdir}/usr/share/${_pkgname}/textdir/{interfaces,services,zones,rules}
  install -dm700 ${pkgdir}/var/log/${_pkgname}

  # install daemon and log
  install -Dm755 ${srcdir}/vuurmuur.rc ${pkgdir}/etc/rc.d/${_pkgname}
  install -Dm644 ${pkgdir}/usr/share/${_pkgname}/scripts/vuurmuur-logrotate ${pkgdir}/etc/logrotate.d/${_pkgname}

  # install systemd's files
  install -Dm755 $srcdir/vuurmuur.script $pkgdir/usr/lib/systemd/scripts/vuurmuur
  install -Dm644 $srcdir/vuurmuur.service $pkgdir/usr/lib/systemd/system/vuurmuur.service

  # install configuration
  install -Dm600 ${pkgdir}/usr/share/vuurmuur/config/config.conf.sample \
                  ${pkgdir}/etc/${_pkgname}/config.conf
  install -Dm600 ${srcdir}/modules.conf ${pkgdir}/etc/${_pkgname}/modules.conf
#   install -Dm600 ${pkgdir}/usr/share/vuurmuur/config/vuurmuur_conf.conf.sample \
#                   ${pkgdir}/etc/${_pkgname}/vuurmuur_conf.conf

  sed -i ${pkgdir}/etc/${_pkgname}/config.conf \
    -e 's|"/sbin/tc|"/usr/sbin/tc|' \
    -e 's|"/sbin/ip6tables|"/usr/sbin/ip6tables|' \
    -e 's|"/sbin/iptables|"/usr/sbin/iptables|' \
    -e 's|"/sbin/ip6tables-restore|"/usr/sbin/ip6tables-restore|' \
    -e 's|"/sbin/iptables-restore|"/usr/sbin/iptables-restore|' \
    -e 's|"/var/log/messages|"/var/log/iptables.log|'

  sed -i ${pkgdir}/etc/${_pkgname}/config.conf \
    -e 's|"/usr/bin/iptrafvol.pl|"/usr/sbin/iptrafvol.pl|'


  echo "LOCATION=\"/etc/${_pkgname}/textdir\"" > ${pkgdir}/etc/${_pkgname}/plugins/textdir.conf

  # default firewall setup in /usr/share
  touch ${pkgdir}/usr/share/${_pkgname}/textdir/rules/rules.conf
  touch ${pkgdir}/usr/share/${_pkgname}/textdir/rules/blocklist.conf

  cp -R ${srcdir}/${_pkgname}-${pkgver}/installer/zones/*   ${pkgdir}/usr/share/${_pkgname}/textdir/zones/
  mv    ${pkgdir}/usr/share/${_pkgname}/services/* ${pkgdir}/usr/share/${_pkgname}/textdir/services/

  install -Dm644 ${srcdir}/${_pkgname}-${pkgver}/vuurmuur/COPYING \
    ${pkgdir}/usr/share/licenses/vuurmuur/COPYING
}
package_vuurmuur-conf-devel() {
  pkgdesc='Iptables frontend. Ncurses GUI, for administration and monitoring.'
  provides=(vuurmuur-conf)
  depends=(libvuurmuur bash)
  cd ${srcdir}/${_pkgname}-${pkgver}

  pushd vuurmuur-conf
  make DESTDIR=${pkgdir} install
  install -Dm644 ${srcdir}/${_pkgname}-${pkgver}/vuurmuur-conf/COPYING \
    ${pkgdir}/usr/share/licenses/vuurmuur-conf/COPYING
}
