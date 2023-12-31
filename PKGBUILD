# Maintainer: Kovshov K.A. <kirillnow at gmail dot com>

pkgname='mount-gui'
pkgver=1.0
pkgrel=1
pkgdesc="Quickly mounts anything, anywhere, with any options. Discovers MTP devices and scans local networks for shared folders."
url='https://github.com/kirillnow/mount-gui'
arch=('x86_64')
license=('GPL' 'MIT')
depends=('qt6-base' 'systemd' 'polkit' 'libmtp')
makedepends=('cmake')
optdepends=('nmap: local network scanning'
            'avahi: network discovery'
            'smbclient: detecting samba shares'
            'nfs-utils: detecting nfs shares'
            'android-file-transfer: mounting mtp devices'
            'simple-mtpfs: mounting mtp devices'
            'jmtpfs: mounting mtp devices'
            'lxqt-sudo: alternative to pkexec')
source=("https://github.com/kirillnow/$pkgname/archive/refs/tags/$pkgver.tar.gz" )
sha256sums=('f7284d40d3dfd344078a0cdd957c1ac4b13691306d104819f3253d3d282eb519' )
backup=('etc/polkit-1/rules.d/mount-gui.rules')

prepare() {
  cd ${pkgname}-${pkgver}
  
}

build() {
	cd "$pkgname-$pkgver"
	cmake -B build -DCMAKE_BUILD_TYPE='None' \
                       -DCMAKE_INSTALL_PREFIX='/usr' \
                       -DAFT_MTP_BEFORE_20230722=1

	cmake --build build 
	#--verbose
}

package() {
	cd "$pkgname-$pkgver"

	DESTDIR="$pkgdir" cmake --install build
        chmod 750 $pkgdir/etc/polkit-1/rules.d
}