# Maintainer: Wes Jackson <icebal dot 7 at gmail dot com>

pkgname=nfs-ganesha
pkgver=2.7.1
pkgrel=2
pkgdesc="NFS-Ganesha supports both the NFS and 9P protocols in user mode."
arch=('any')
url="http://nfs-ganesha.github.io/"
license=('GPL3')
depends=()
conflicts=('nfs-ganesha-git')
makedepends=('cmake' 'gcc' 'bison' 'flex')
source=("$pkgname"::'https://github.com/nfs-ganesha/nfs-ganesha/archive/V${pkgver}.tar.gz')
sha256sums=('ebe4c5ee4caafe435b6beeee17cc587d7c3cb3473003f5e786f9101ac457342f')

backup=(etc/ganesha/ganesha.conf etc/sysconfig/ganesha)

prepare() {
	cd "${pkgname}"
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
        install src/scripts/systemd/nfs-ganesha-lock.service.el7 "$pkgdir"/usr/lib/systemd/system/nfs-ganesha-lock.service
        install src/scripts/systemd/nfs-ganesha-config.service-in.cmake "$pkgdir"/usr/lib/systemd/system/nfs-ganesha-config.service
        install src/scripts/systemd/sysconfig/nfs-ganesha "$pkgdir"/etc/sysconfig/ganesha
        install src/scripts/systemd/tmpfiles.d/ganesha.conf "$pkgdir"/etc/tmpfiles.d/ganesha.conf
        install src/scripts/nfs-ganesha-config.sh "$pkgdir"/usr/libexec/ganesha
}
