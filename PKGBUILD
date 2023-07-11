# Maintainer: Refutationalist <archlinux@sammulvey.com>
pkgname=xen-pvhgrub
pkgver=2.12.rc1.r0.g7a994c8
pkgrel=1
_srcname=grub
pkgdesc="a version of GRUB2 for booting Xen PVH domUs"
arch=(x86_64)
url="https://www.gnu.org/software/grub/"
license=(GPL3)
makedepends=(git xz python texinfo gettext device-mapper)
depends=(xen)
options=(!buildflags !strip)


source=(
	"git+https://git.savannah.gnu.org/git/grub.git"
	"git+https://git.savannah.gnu.org/git/gnulib.git"
	"grub.cfg"
	"README.md"
)
noextract=('grub.cfg' 'README.md')
sha512sums=('SKIP'
            'SKIP'
            '538ec7d6e33baaf7d1c708ed1ae6313691a04c331fd7d2cc2b47f56f2b5c218c75081b20204be68934bf88b6497b937917555424e3a379e12a481921093d7ce8'
            '4686fc68af70887228df076325c1bc668ec8e97002fc42734ba9ceea5b1bca6c6b01e8bb40b7d0ed721b9a466446da69c61e7d0cedb28181d5f7e4fc83a852a6')

pkgver() {
	cd "$srcdir/${_srcname}"
	git describe --long --abbrev=7 | sed 's/^grub-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
	cd "$srcdir/${_srcname}"
	./bootstrap  \
		--gnulib-srcdir="${srcdir}/gnulib/" \
		--no-git
}


build() {
	cd "$srcdir/${_srcname}"

	TARGET_LDFLAGS=-static ./configure \
		--with-platform=xen_pvh \
		--enable-device-mapper

	# this will compile a ton of stuff we'll never, ever need.
	make

	# make the bootloader image
	cp "${srcdir}/grub.cfg" .
	./grub-mkstandalone \
		--grub-mkimage=./grub-mkimage \
		-o pvhgrub \
		-O i386-xen_pvh \
		-d ./grub-core/ "/boot/grub/grub.cfg=./grub.cfg"
}


package() {
	cd "$srcdir/${_srcname}"
	mkdir -p "${pkgdir}/usr/lib/xen/bin" "${pkgdir}/usr/share/doc/xen-pvh"
	install -m644 pvhgrub "${pkgdir}/usr/lib/xen/bin"
	install -m644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/xen-pvh"
}
