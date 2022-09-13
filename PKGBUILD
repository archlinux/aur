# AUR Maintainer: Elmar Klausmeier <Elmar.Klausmeier@gmail.com>
# Community Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Kurt Marasco <celilo _at_ lavabit _dot_ com>
# Contributor: Pascal Ernster <aur at hardfalcon dot net>
# Contributor: Kewl <kewl at alto dot eu dot org>

pkgname=aur-hiawatha
opkgname=hiawatha
pkgver=11.2
pkgrel=1
pkgdesc="Secure and advanced webserver"
url="https://www.hiawatha-webserver.org/"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=('GPL2')
depends=('libxslt' 'mbedtls' 'libxcrypt')
optdepends=('php-fpm: PHP fastcgi'
            'php: letsencrypt/lefh')
conflicts=('hiawatha')
makedepends=('cmake')
backup=('etc/hiawatha/hiawatha.conf'
        'etc/hiawatha/cgi-wrapper.conf'
        'etc/hiawatha/mimetype.conf')
source=("https://www.hiawatha-webserver.org/files/$opkgname-$pkgver.tar.gz" 
        'hiawatha.conf.sample'
        'hiawatha.service'
        'lefh-renew.service'
        'lefh-renew.timer')
sha256sums=('99c64f76927f93469f062ab76b74eb79a397ea4be12da86bf746b2bb57cf1bc5'
            '4671d2586cbe3cd6497b16ff422c6143cdab40641ef3c9c4988c478351a8f5e7'
            'b5a2671703b52eec376cfc4697b86aafa4f7fdd9b2b9203798e2117770bafa53'
            'db1d647d86370583c24ae7a37feab78e3f0015d441ff5bc8f9b32e1a91ec4c8e'
            'd12c5a68c293f66d95ae4df704ea349adbad972fb25475ab1a0a24fb42bfc70b')

prepare() {
cd "$srcdir/$opkgname-$pkgver"
sed -i 's/www-data/http/g' extra/logrotate.in

# Update stock hiawatha.conf
	sed -e 's|#ServerId = www-data|ServerId = http|' \
		-e 's|/var/www/|/srv/http/|g' \
		-e 's|//|/|g' \
		-e 's|#CGIextension = cgi|&\n#TriggerOnCGIstatus = no|g' \
		-e 's|ConnectTo = 127.0.0.1:2005|ConnectTo = 127.0.0.1:9000|g' \
		-e 's|#	Extension = php|&\n#       SessionTimeout = 30|g' \
		-e 's|#ErrorHandler = 404:/error.cgi|&\n#UseGZfile = yes|g' \
		-i config/hiawatha.conf.in
  
	sed -e 's|/etc/init.d/hiawatha restart|systemctl restart hiawatha.service|' \
		-i extra/letsencrypt/letsencrypt.conf.in
}

build() {
	cd "$srcdir/$opkgname-$pkgver"
	mkdir -p build
	cd build

	cmake ../ -DCMAKE_INSTALL_PREFIX="/" \
		-DCMAKE_INSTALL_BINDIR="/usr/bin" \
		-DCMAKE_INSTALL_SBINDIR="/usr/bin" \
		-DCMAKE_INSTALL_SYSCONFDIR="/etc/hiawatha" \
		-DCMAKE_INSTALL_LIBDIR="/usr/lib" \
		-DCMAKE_INSTALL_MANDIR="/usr/share/man" \
		-DCONFIG_DIR="/etc/hiawatha" \
		-DLOG_DIR="/var/log/hiawatha" \
		-DPID_DIR="/run" \
		-DENABLE_TLS=ON \
		-DUSE_SYSTEM_MBEDTLS=ON \
		-DENABLE_MONITOR=ON \
		-DENABLE_TOMAHAWK=ON \
		-DWEBROOT_DIR="/srv/http/hiawatha" \
		-DWORK_DIR="/var/lib/hiawatha"

	make

	# Features enabled by default
	# -DENABLE_CACHE
	# -DENABLE_IPV6
	# -DENABLE_RPROXY
	# -DENABLE_TOOLKIT
	# -DENABLE_XSLT

	# Features disabled by default
	# -DENABLE_DEBUG
}

package() {
	cd "$srcdir/$opkgname-$pkgver/build"
	make DESTDIR="$pkgdir/" install
	 
	rmdir "$pkgdir/run"
	rm "$pkgdir/srv/http/hiawatha/index.html"
	rmdir -p --ignore-fail-on-non-empty "$pkgdir/srv/http/hiawatha"
	 
	install -Dm644 logrotate.d/hiawatha "$pkgdir/etc/logrotate.d/hiawatha"
	cd "$srcdir"
	install -Dm644 hiawatha.service   "$pkgdir/usr/lib/systemd/system/hiawatha.service"
	install -Dm644 lefh-renew.service "$pkgdir/usr/lib/systemd/system/lefh-renew.service"
	install -Dm644 lefh-renew.timer   "$pkgdir/usr/lib/systemd/system/lefh-renew.timer"
	install -Dm644 hiawatha.conf.sample "$pkgdir/etc/hiawatha/"
}

