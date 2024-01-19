# Maintainer: Refutationalist <archlinux@sammulvey.com>
pkgname=xen-qemu
_srcname=qemu
pkgver=8.2.0
pkgrel=1
pkgdesc="A xen-specific QEMU, built to qemu-builtin standards"
arch=("x86_64")
url="https://www.qemu.org"
license=(GPL2 LGPL2.1)
depends=(curl xen numactl)  # lot of deps are apparently covered by xen
makedepends=(ninja meson)
provides=(qemu-xen xen-qemu xen-qemu-builtin)
conflicts=(xen-qemu-builtin)
replaces=(xen-qemu-builtin)
source=(
	https://download.qemu.org/qemu-${pkgver}.tar.xz{,.sig}
)
sha512sums=('92ec41196ff145cdbb98948f6b6e43214fa4b4419554a8a1927fb4527080c8212ccb703e184baf8ee0bdfa50ad7a84689e8f5a69eba1bd7bbbdfd69e3b91256c' 'SKIP') 


validpgpkeys=('CEACC9E15534EBABB82D3FA03353C9CEF108B584') # Michael Roth <flukshun@gmail.com>


build() {

	cd $srcdir
	mkdir build
	cd build

	"${srcdir}/${_srcname}-${pkgver}/configure" \
		--enable-xen \
		--target-list=i386-softmmu \
		--enable-trace-backends=log \
		--prefix=/usr \
		--libdir=/usr/lib/xen/lib \
		--includedir=/usr/lib/xen/include \
		--extra-cflags="-DXC_WANT_COMPAT_EVTCHN_API=1  -DXC_WANT_COMPAT_GNTTAB_API=1 -DXC_WANT_COMPAT_MAP_FOREIGN_API=1 -DXC_WANT_COMPAT_DEVICEMODEL_API=1" \
		--extra-ldflags=-Wl,-rpath,/usr/lib/xen/lib \
		--bindir=/usr/lib/xen/bin \
		--datadir=/usr/share/qemu-xen \
		--localstatedir=/var \
		--docdir=/usr/lib/xen/share/doc \
		--mandir=/usr/lib/xen/share/man \
		--libexecdir=/usr/lib/xen/libexec \
		--firmwarepath=/usr/lib/xen/share/qemu-firmware \
		--disable-kvm \
		--disable-docs \
		--disable-guest-agent \
		--python=python3 \
		--cpu=x86_64 

	ninja

		



}

package() {
	cd "${srcdir}/build"
	# meson direct was failing me, but this worked.
	# might be a backwards compatible thing
	make DESTDIR="$pkgdir/" install
}
