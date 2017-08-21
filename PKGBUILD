# Maintainer: Oliver Mangold <o.mangold@gmail.com>

pkgname=nfs-ganesha
pkgver=2.5.1.1
pkgrel=1
pkgdesc="Nfs-ganesha supports both the NFS and 9P protocols."
arch=('i686' 'x86_64')
url="http://nfs-ganesha.github.io/"
license=('GPL3')
depends=()
makedepends=('cmake' 'gcc' 'bison' 'flex')
source=('git://github.com/nfs-ganesha/nfs-ganesha.git#commit=5b40e075bde08feb72bd7d7584d6bed9fff31a5c')
md5sums=('SKIP')

backup=(etc/ganesha/ganesha.conf etc/sysconfig/ganesha)

prepare() {
	cd "${pkgname}"
	git submodule update --init
}

build() {
	cd "${pkgname}"
	cmake src/ -DUSE_9P=ON -DCMAKE_BUILD_TYPE=Release -DLIB_INSTALL_DIR=/usr/lib
	make
}

package() {
	cd "${pkgname}"
	make install DESTDIR="$pkgdir"
	mv "$pkgdir"/var/run "$pkgdir"/run
	rmdir "$pkgdir"/var
	install -d "$pkgdir"/usr/lib/systemd/system "$pkgdir"/etc/sysconfig "$pkgdir"/usr/libexec/ganesha
	install src/scripts/systemd/*.service "$pkgdir"/usr/lib/systemd/system
	install src/scripts/systemd/sysconfig/nfs-ganesha "$pkgdir"/etc/sysconfig/ganesha
	install src/scripts/nfs-ganesha-config.sh "$pkgdir"/usr/libexec/ganesha
}
