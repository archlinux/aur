# Maintainer: Amish <contact at via dot aur>
# Contributor: skogler
pkgname=barnyard2
pkgver=1.13
pkgrel=2
pkgdesc="A dedicated spooler for Snort's unified2 binary output format."
arch=('i686' 'x86_64')
url="http://www.github.com/firnsy/barnyard2"
license=('GPL')
depends=('libpcap' 'mariadb-libs' 'postgresql-libs')
optdepends=('snort: for snort unified2 processing')
provides=('barnyard2')
conflicts=('barnyard2-git')
backup=('etc/barnyard2/barnyard2.conf')
source=("barnyard2-$pkgver.tar.gz::https://github.com/firnsy/$pkgname/archive/v2-$pkgver.tar.gz"
        'barnyard2.service'
        'barnyard2-1.13-free.patch'
        'barnyard2-1.13-libdir.patch'
        'barnyard2-1.13-my_bool.patch'
        'barnyard2-1.13-odbc.patch'
        'barnyard2-1.13-Werror.patch'
        'barnyard2-1.13-pcap-1.9.0.patch')
sha256sums=('b9e67f22334b937a59cf808ca20bdcd9c46561a4369979c965a0bb554d7dd09b'
            'bea8a4075f2990f092db241d0586a81af71fe1ffdcb1434e49a60165e744418c'
            'c6f7be740df98017bcd9f79cf703e493a201adcfbfd45a371cd9b6e0f177fc6b'
            'c8ac95cc45a17d548a6331100d3ab26543278ea051a1f7f5f77db025ebd4417f'
            '3fcae69a0e9b49a00d65557a35108b271c8890a7019b87b5f608fbafed2d54fb'
            '3775bcffeaf9588a76006f275ade170b6f87147699fb50e75d2b9b07c8d139a5'
            '3600ad80f463e58a14b66cc9e4d1262853555f74e0bc876b82aaf8b7a567e4e4'
            '3bb6b787c4c66a67307ead1b91ba1ef99940894f825948402cfd6e0d50b893c1')

prepare() {
    # patches from gentoo
    # https://gitweb.gentoo.org/repo/gentoo.git/tree/net-analyzer/barnyard2/files
    cd "$pkgname-2-$pkgver"
    patch -p1 < "${srcdir}"/barnyard2-1.13-free.patch
    patch -p1 < "${srcdir}"/barnyard2-1.13-libdir.patch
    patch -p1 < "${srcdir}"/barnyard2-1.13-my_bool.patch
    patch -p1 < "${srcdir}"/barnyard2-1.13-odbc.patch
    patch -p1 < "${srcdir}"/barnyard2-1.13-Werror.patch
    patch -p1 < "${srcdir}"/barnyard2-1.13-pcap-1.9.0.patch
}

build() {
    cd "$pkgname-2-$pkgver"
    ./autogen.sh
    ./configure --prefix=/usr --sysconfdir=/etc/barnyard2 --with-mysql --with-postgresql --disable-static
    make
}

check() {
    cd "$pkgname-2-$pkgver"
    make -k check
}

package() {
    cd "$pkgname-2-$pkgver"
    make DESTDIR="$pkgdir" install
    sed -i -e 's/^#\(config\s\+logdir:\s\+\).*/\1\/var\/log\/barnyard2/g' \
        -e 's/^#\(config\s\+hostname:\s\+\).*/\1localhost/g' \
        -e 's/^#\(config\s\+waldo_file:\s\+\).*/\1\/var\/log\/barnyard2\/barnyard2.waldo/g' \
        -e 's/^\(#config\s\+pidpath:\s\+\).*/\1\/run\/barnyard2.pid/g' \
        -e 's/^\(output\s\+alert_fast:\)/#\1/g' \
        "${pkgdir}"/etc/barnyard2/barnyard2.conf
    install -D -m644 -t "${pkgdir}"/usr/share/doc/barnyard2 doc/README*
    install -D -m644 -t "${pkgdir}"/usr/share/doc/barnyard2/schemas schemas/create_* schemas/SCHEMA_ACCESS

    install -D -m644 -t "${pkgdir}"/usr/lib/systemd/system "${srcdir}"/barnyard2.service
    echo "d /var/log/barnyard2 0750" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    install -D -m644 /dev/stdin "${pkgdir}"/etc/logrotate.d/barnyard2 << 'EOF'
/var/log/barnyard2/*.log {
	sharedscripts
	missingok
	notifempty
	postrotate
		/usr/bin/systemctl try-restart barnyard2.service > /dev/null 2>&1 || true
	endscript
}
EOF
}
