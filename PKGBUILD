# Maintainer: Oliver Mangold <o.mangold@gmail.com>

pkgname=nfs-ganesha
pkgver=2.6.2
pkgrel=1
pkgdesc="NFS-Ganesha supports both the NFS and 9P protocols in user mode."
arch=('i686' 'x86_64')
url="http://nfs-ganesha.github.io/"
license=('GPL3')
depends=()
makedepends=('cmake' 'gcc' 'bison' 'flex')
source=('git://github.com/nfs-ganesha/nfs-ganesha.git#commit=b9685b89acb5a21db2a44a6b5bf5d85709e98b7d')
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
