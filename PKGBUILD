# Maintainer: Pavers_Career <pavers_career_0d AT icloud DOT com>
pkgname="hornet-git"
_pkgname="hornet"
_branch="mainnet"
_pkgver="1.1.1"
pkgver=1.1.1.r0.gd7f72a66
pkgrel=1
pkgdesc="HORNET is a powerful IOTA fullnode software"
arch=('x86_64')
url="https://github.com/gohornet/hornet"
license=("Apache")
depends=()
conflicts=('hornet-bin')
makedepends=('go' 'git')
source=("git://github.com/gohornet/$_pkgname.git#branch=$_branch"
	"$_pkgname.service")
sha256sums=('SKIP'
            '163dd546132a9168ffdd3443b0235605fed5deb07719335de6b6cb3cc28f0497')
backup=('etc/hornet/config.json' 'etc/hornet/peering.json' 'etc/hornet/profiles.json')
install=$_pkgname.install

pkgver() {
        cd ${_pkgname}
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd ${srcdir}/hornet

        # Build with rocksdb
	go build -tags=builtin_static,rocksdb

}
package() {

	# Install files
	install -Dm600 ${srcdir}/hornet/config.json ${pkgdir}/etc/hornet/config.json
	install -Dm600 ${srcdir}/hornet/peering.json ${pkgdir}/etc/hornet/peering.json
	install -Dm600 ${srcdir}/hornet/profiles.json ${pkgdir}/etc/hornet/profiles.json	
	install -D ${srcdir}/hornet/hornet ${pkgdir}/usr/bin/hornet	

	# Install systemd service
	install -D ${srcdir}/hornet.service ${pkgdir}/usr/lib/systemd/system/hornet.service
}
