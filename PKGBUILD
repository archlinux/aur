# Maintainer: Refutationalist <archlinux@sammulvey.com>
pkgname=xen-qemu
_srcname=qemu
pkgver=10.1.2
pkgrel=1
pkgdesc="A xen-specific QEMU, built to qemu-builtin standards"
arch=("x86_64")
url="https://www.qemu.org"
license=(GPL2 LGPL2.1)
depends=(curl xen numactl spice usbredir seabios qemu-common)  # lot of deps are apparently covered by xen
makedepends=(ninja meson python-packaging)
provides=(qemu-xen xen-qemu xen-qemu-builtin)
conflicts=(xen-qemu-builtin)
replaces=(xen-qemu-builtin)
source=(
	https://download.qemu.org/qemu-${pkgver}.tar.xz{,.sig}
)
sha512sums=('4defbcb78f65ba3d8079466bdb3ab29e26f10129723e045d34901e7d524656e5ff729dc97fb33537febe2596eb0b21a02aadd88007eb5b226e599bd236213263'
            'SKIP')


validpgpkeys=('CEACC9E15534EBABB82D3FA03353C9CEF108B584') # Michael Roth <flukshun@gmail.com>


build() {

	cd $srcdir
	mkdir build
	cd build

	# this configure line is found in xen/tools/Makefile
	"${srcdir}/${_srcname}-${pkgver}/configure" \
		--enable-xen \
		--enable-xen-pci-passthrough \
		--enable-spice \
		--enable-usb-redir \
		--target-list=i386-softmmu \
		--enable-trace-backends=log \
		--prefix=/usr \
		--libdir=/usr/lib/xen/lib \
		--includedir=/usr/lib/xen/include \
		--extra-cflags="-DXC_WANT_COMPAT_EVTCHN_API=1  -DXC_WANT_COMPAT_GNTTAB_API=1 -DXC_WANT_COMPAT_MAP_FOREIGN_API=1 -DXC_WANT_COMPAT_DEVICEMODEL_API=1" \
		--extra-ldflags=-Wl,-rpath,/usr/lib/xen/lib \
		--bindir=/usr/lib/xen/bin \
		--datadir=/usr/share/xen-qemu \
		--localstatedir=/var \
		--docdir=/usr/lib/xen/share/doc \
		--mandir=/usr/lib/xen/share/man \
		--libexecdir=/usr/lib/xen/libexec \
		--firmwarepath=/usr/share/qemu \
		--disable-kvm \
		--disable-docs \
		--disable-guest-agent \
		--disable-fdt \
		--disable-install-blobs \
		--cpu=x86_64 

	ninja

		



}

package() {
	cd "${srcdir}/build"
	# meson direct was failing me, but this worked.
	# might be a backwards compatible thing
	make DESTDIR="$pkgdir/" install
}
