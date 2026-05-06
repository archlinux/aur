# Maintainer: Refutationalist <archlinux@sammulvey.com>
pkgname=xen-qemu
_srcname=qemu
pkgver=11.0.0
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
	qemu-create-xenfv-alias.patch
)
sha512sums=('3a047385374cce2fc0d58abbe0d52531ca629f3d25d60b107e1c97372e7ed9caaa5337719d140d0f936b0425d872c0fd77048ef2c13d89295a4c1e650d9daa60'
            'SKIP'
            '1c926a949c3450849a946c7782e5fe2a29a6db769ced32c4c32e991050dbb3b537d2db170dd77ddbeea8d8ad8880248c406f90c7401e9c4bb46139b41b0a5a02')


validpgpkeys=('CEACC9E15534EBABB82D3FA03353C9CEF108B584') # Michael Roth <flukshun@gmail.com>

prepare() {
	cd "${srcdir}/${_srcname}-${pkgver}"
	patch -p1 < ../qemu-create-xenfv-alias.patch

}


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
