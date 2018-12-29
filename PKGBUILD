# Contributor: robertfoster

pkgname=capanalysis
pkgver=1.2.3
pkgrel=1
arch=(i686 x86_64)
pkgdesc="PCAP files from another point of view"
url="http://www.capanalysis.net/"
license=('GPL')
depends=('glibc' 'libpcap' 'libpqxx' 'sqlite' 'openssl' 'zlib' 'wireshark-cli' 'apache' 'php-apache' 'php-sqlite' 'php-pgsql' 'postgresql' 'ndpi')
makedepends=('xxd')
source=("https://github.com/xplico/CapAnalysis/archive/v$pkgver.tar.gz"
	"xplico::git+https://github.com/xplico/xplico"
	capanalysis.service
capana.conf)
install=capanalysis.install

prepare() {
	cd $srcdir
	ln -sf xplico/include .
	cd xplico
	# Fix some headers paths
	find . -name "*.c" -exec sed -i "s|libndpi\/|ndpi\/|g" {} +
	find . -name "*.h" -exec sed -i "s|libndpi\/|ndpi\/|g" {} +
	find . -name "*.c" -exec sed -i "s|json_object_private|json_object|g" {} +
}

build() {
	cd $srcdir
	cd xplico
	make -j1
	cd ../CapAnalysis-$pkgver
	msg2 "Compiling CapAnalysis..."
	make pkgbin
	make
}

package() {
	cd $srcdir/CapAnalysis-$pkgver
	make INSTALL_DIR=$pkgdir/opt/capanalysis install
	mkdir -p $pkgdir/etc/httpd/conf/extra
	cp ../capana.conf $pkgdir/etc/httpd/conf/extra/httpd-capana.conf
	install -Dm644 ../capanalysis.service "${pkgdir}"/usr/lib/systemd/system/capanalysis.service
}

md5sums=('bebf4b7fa8cdf11ff75c9b105a405159'
	'SKIP'
	'9c33942e477795f97539cc7e57e404cf'
'9c8e3ca78f5dd0b8616b6c8b1e5e4e1e')
