# Maintainer: Wes Jackson <icebal dot 7 at gmail dot com>

pkgname=nfs-ganesha-git
pkgver=V2.7.rc3.r0.g32e8a2462
pkgrel=1
pkgdesc="Nfs-ganesha supports both the NFS and 9P protocols."
arch=('any')
url="http://nfs-ganesha.github.io/"
license=('GPL3')
depends=()
conflicts=('nfs-ganesha')
makedepends=('git' 'cmake' 'gcc' 'bison' 'flex')
source=("$pkgname"::'git://github.com/nfs-ganesha/nfs-ganesha.git')
md5sums=('SKIP')

backup=(etc/ganesha/ganesha.conf etc/sysconfig/ganesha)

pkgver() {
	cd ${pkgname}
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd ${pkgname}
	git submodule update --init
}

build() {
	cd "${pkgname}"
        cmake src/ -DUSE_9P=ON -DCMAKE_BUILD_TYPE=Maintainer -DBUILD_CONFIG=everything -DLIB_INSTALL_DIR=/usr/lib
        make
}

package() {
        cd "${pkgname}"
        make install DESTDIR="$pkgdir"
        mv "$pkgdir"/var/run "$pkgdir"/run
        rmdir "$pkgdir"/var
        install -d "$pkgdir"/usr/lib/systemd/system "$pkgdir"/etc/sysconfig "$pkgdir"/usr/libexec/ganesha
	install src/scripts/ganeshactl/org.ganesha.nfsd.conf "$pkgdir"/etc/dbus-1/system.d/
        install src/scripts/systemd/nfs-ganesha.service.el7 "$pkgdir"/usr/lib/systemd/system/nfs-ganesha.service
        install src/scripts/systemd/nfs-ganesha-config.service-in.cmake "$pkgdir"/usr/lib/systemd/system/nfs-ganesha-config.service
        install src/scripts/systemd/nfs-ganesha-lock.service.el7 "$pkgdir"/usr/lib/systemd/system/nfs-ganesha-lock.service
        install src/scripts/systemd/sysconfig/nfs-ganesha "$pkgdir"/etc/sysconfig/ganesha
        install src/scripts/systemd/tmpfiles.d/ganesha.conf "$pkgdir"/etc/tmpfiles.d/ganesha.conf
        install src/scripts/nfs-ganesha-config.sh "$pkgdir"/usr/libexec/ganesha
}
