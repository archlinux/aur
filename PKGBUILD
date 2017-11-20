# Contributor: robertfoster

pkgname=capanalysis
pkgver=1.2.2
_xplicover=1.2.1
pkgrel=1
arch=(i686 x86_64)
pkgdesc="PCAP files from another point of view"
url="http://www.capanalysis.net/"
license=('GPL')
depends=('glibc' 'libpcap' 'libpqxx' 'sqlite' 'openssl' 'zlib' 'wireshark-cli' 'apache' 'php-apache' 'php-sqlite' 'php-pgsql' 'postgresql' 'ndpi')
makedepends=('xxd')
source=("https://github.com/xplico/CapAnalysis/archive/v$pkgver.tar.gz"
	"https://github.com/xplico/xplico/archive/v${_xplicover}.tar.gz"
	capanalysis.service
	capana.conf)
install=capanalysis.install

prepare() {
    cd $srcdir
    ln -s xplico-${_xplicover} xplico
    cd xplico
    make
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

md5sums=('aea82f79f1c42f6ce6dbacef1fdf3a1c'
         'b16b1f1dc8520b3bbc5c3cd9439ca38a'
         '9c33942e477795f97539cc7e57e404cf'
         '9c8e3ca78f5dd0b8616b6c8b1e5e4e1e')
