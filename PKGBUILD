# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgname=pgl
pkgver=2.3.1
pkgrel=1
pkgdesc='A privacy oriented firewall application (GUI).'
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/peerguardian/'
license=('GPL3')
depends=('bash' 'systemd' 'dbus' 'coreutils' 'procps-ng' 'logrotate' 'wget' 'iptables' 'libnetfilter_queue' 'qt4' 'whois')
optdepends=('unzip: for zipped blocklists'
            'p7zip: for 7z blocklists'
            'net-tools: to whitelist local IP addresses'
            'networkmanager: to whitelist newly started network interfaces'
            'smtp-forwarder: to send reports'
            'tcptraceroute: to diagnose connection problems')
makedepends=('zlib')
conflicts=('pgl-cli' 'pgl-git')
backup=('etc/pgl/allow.p2p'
        'etc/pgl/blocklists.list'
        'etc/pgl/pglcmd.conf'
        'etc/logrotate.d/pglcmd'
        'etc/logrotate.d/pgld')
changelog=changelog
source=("https://downloads.sourceforge.net/project/peerguardian/PeerGuardian%20Linux/$pkgver/$pkgname-$pkgver.tar.gz"
        "pglinux-2.3.1_p20171006-fno-common.patch::https://gitweb.gentoo.org/repo/gentoo.git/plain/net-firewall/pglinux/files/pglinux-2.3.1_p20171006-fno-common.patch?id=492d6119594d1774685fcd4f40fb5d754c3d77c4")
sha1sums=('a91c0c49cdbf78aa6cc1d93b8ed6843290460520'
          '17b0e89ab5cc9ad9b8ac52823e63f741f5cb6d79')

prepare() {
    cd "$pkgname-$pkgver"

    patch -p1 < ../pglinux-2.3.1_p20171006-fno-common.patch
}

build() {
    cd "$pkgname-$pkgver"

    # makes sure qt4 is used
    export QMAKE=qmake-qt4
    export MOC=moc-qt4
    export UIC=uic-qt4
    export RCC=rcc-qt4

    ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --localstatedir=/var --datarootdir=/usr/share \
		    --with-piddir=/run --with-systemd --disable-cron --without-initddir
    make
}

package() {
    cd "$pkgname-$pkgver"

    make DESTDIR="$pkgdir" install

    # integrates daemon log in systemd journal
    sed -i '/^LOG_SYSLOG/s/0/1/g' $pkgdir/usr/lib/pgl/pglcmd.defaults
}
