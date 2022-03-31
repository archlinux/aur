# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgname=pgl-git
pkgver=2.3.1.1.r77.g9d91ab6
pkgrel=1
pkgdesc='A privacy oriented firewall application (Daemon, CLI & GUI).'
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/peerguardian/'
license=('GPL3')
depends=('bash' 'systemd' 'dbus' 'coreutils' 'procps-ng' 'logrotate' 'wget' 'iptables' 'libnetfilter_queue' 'cron' 'qt5-base' 'whois')
optdepends=('unzip: for zipped blocklists'
            'p7zip: for 7z blocklists'
            'net-tools: to whitelist local IP addresses'
            'networkmanager: to whitelist newly started network interfaces'
            'smtp-forwarder: to send reports'
            'tcptraceroute: to diagnose connection problems')
makedepends=('git' 'zlib' 'qt5-tools')
license=('GPL3')
provides=('pgl')
conflicts=('pgl' 'pgl-cli')
backup=('etc/pgl/allow.p2p'
        'etc/pgl/blocklists.list'
        'etc/pgl/pglcmd.conf'
        'etc/logrotate.d/pglcmd'
        'etc/logrotate.d/pgld')
source=('git://git.code.sf.net/p/peerguardian/code/'
        'pglinux-2.3.1_p20171006-fno-common.patch::https://gitweb.gentoo.org/repo/gentoo.git/plain/net-firewall/pglinux/files/pglinux-2.3.1_p20171006-fno-common.patch?id=492d6119594d1774685fcd4f40fb5d754c3d77c4')
sha256sums=('SKIP'
            'b4cf3cb48620e04c5115be1db73eb25fb9c779120e4930b3e5d4bd04d8c4a13c')

pkgver() {
    cd code

    git describe --tags | sed 's/^debian\///;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "code"

    patch -p1 < ../pglinux-2.3.1_p20171006-fno-common.patch
    ./autogen.sh
}

build() {
    cd code

    ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --localstatedir=/var --datarootdir=/usr/share \
    		--with-piddir=/run --with-systemd --without-initddir
    make
}

package() {
    cd code

    make DESTDIR="$pkgdir" install

    # integrates daemon log in systemd journal
    sed -i '/^LOG_SYSLOG/s/0/1/g' $pkgdir/usr/lib/pgl/pglcmd.defaults
}
