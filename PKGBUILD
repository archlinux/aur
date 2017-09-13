# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=nfs-ganesha-git
pkgver=11231.2e2b8e659
pkgrel=1
pkgdesc="Nfs-ganesha supports both the NFS and 9P protocols."
arch=('any')
url="http://nfs-ganesha.github.io/"
license=('GPL3')
depends=()
makedepends=('git' 'cmake' 'gcc' 'bison' 'flex')
source=("$pkgname"::'git://github.com/nfs-ganesha/nfs-ganesha.git')
md5sums=('SKIP')

backup=(etc/ganesha/ganesha.conf etc/sysconfig/ganesha)

pkgver() {
	cd ${pkgname}
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
	cd ${pkgname}
	git submodule update --init
}

build() {
	cd "${pkgname}"
        cmake src/ -DUSE_9P=OFF -DCMAKE_BUILD_TYPE=Release -DLIB_INSTALL_DIR=/usr/lib
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
