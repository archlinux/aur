# Maintainer: Asger Hautop Drewsen <asgerdrewsen@gmail.com>
pkgname=afl-qemu
pkgver=2.52b
pkgrel=1
pkgdesc="Lets you fuzz black-box binaries with afl."
arch=('any')
url="http://lcamtuf.coredump.cx/afl/"
license=('apache')
depends=('afl' 'libtool' 'wget' 'python2' 'automake' 'autoconf' 'bison' 'glibc')
options=('staticlibs' '!emptydirs' '!strip')
qemu_version="2.10.0"
source=(
	"http://lcamtuf.coredump.cx/afl/releases/afl-${pkgver}.tgz"
	"http://download.qemu-project.org/qemu-${qemu_version}.tar.xz"
	"memfd.diff"
	"glfs_truncate.diff"
	"glfs_io_cbk.diff"
)
md5sums=('d4fa778e6c2221aee4f5326f22e1983d'
         'a89e3293cf69c32cf4be4188dfa25544'
         '9715c550f9a71c55339a9b9fb8c136ad'
         '05b5604dd7b10f43a8f2dca238d948df'
         '93cce7e3cffc9574b325c886d4686428')

prepare() {
	cd "${srcdir}/afl-${pkgver}/qemu_mode"
	rm -rf "qemu-${qemu_version}"
	mv "${srcdir}/qemu-${qemu_version}" .

	cd "qemu-${qemu_version}"
	for p in ../patches/*.diff; do
		patch -p1 < "$p"
	done

	patch -p1 < "${srcdir}/memfd.diff"
	patch -p1 < "${srcdir}/glfs_truncate.diff"
	patch -p1 < "${srcdir}/glfs_io_cbk.diff"
}

build() {
	cd "${srcdir}/afl-${pkgver}/qemu_mode/qemu-${qemu_version}"
	CFLAGS="-O3 -ggdb" ./configure --disable-system \
	  --enable-linux-user --disable-gtk --disable-sdl --disable-vnc \
	  --target-list="x86_64-linux-user" --enable-pie --enable-kvm \
	  --python=/usr/bin/python2
	make PREFIX=/usr
}

package() {
	install -D "${srcdir}/afl-${pkgver}/qemu_mode/qemu-${qemu_version}/x86_64-linux-user/qemu-x86_64" "${pkgdir}/usr/bin/afl-qemu-trace"
}
