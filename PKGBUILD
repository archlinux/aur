# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgname=pgl-cli
pkgver=2.3.1
pkgrel=2
pkgdesc='Privacy oriented firewall (daemon and CLI)'
arch=(x86_64)
url=https://sourceforge.net/projects/peerguardian
license=(GPL3)
depends=(dbus iptables libnetfilter_queue logrotate wget)
optdepends=('net-tools: to whitelist local IP addresses'
            'networkmanager: to whitelist newly started network interfaces'
            'p7zip: for 7z blocklists'
            'smtp-forwarder: to send reports'
            'tcptraceroute: to diagnose connection problems'
            'unzip: for zipped blocklists')
provides=("${pkgname%-cli}")
conflicts=("${pkgname%-cli}")
backup=(etc/logrotate.d/pglcmd
        etc/logrotate.d/pgld
        etc/pgl/allow.p2p
        etc/pgl/blocklists.list
        etc/pgl/pglcmd.conf)
changelog=changelog
source=("https://downloads.sourceforge.net/project/peerguardian/PeerGuardian%20Linux/$pkgver/pgl-$pkgver.tar.gz"
        "pglinux-2.3.1_p20171006-fno-common.patch::https://gitweb.gentoo.org/repo/gentoo.git/plain/net-firewall/pglinux/files/pglinux-2.3.1_p20171006-fno-common.patch?id=492d6119594d1774685fcd4f40fb5d754c3d77c4")
sha256sums=('1b5c6d233baa943b42254c95ed2853d036f3f246feaebc073e3c91c05a4c98b4'
            'b4cf3cb48620e04c5115be1db73eb25fb9c779120e4930b3e5d4bd04d8c4a13c')

prepare() {
  cd pgl-$pkgver
  patch -p1 < ../pglinux-2.3.1_p20171006-fno-common.patch
}

build() {
  cd pgl-$pkgver
  ./configure --datarootdir=/usr/share \
              --disable-cron \
              --localstatedir=/var \
              --prefix=/usr \
              --sbindir=/usr/bin \
              --sysconfdir=/etc \
              --with-piddir=/run \
              --with-systemd \
              --without-initddir \
              --without-qt4
  make
}

package() {
  make -C pgl-$pkgver DESTDIR="$pkgdir" install

  # Integrate daemon log in systemd journal
  sed -i '/^LOG_SYSLOG/s/0/1/g' $pkgdir/usr/lib/pgl/pglcmd.defaults
}
