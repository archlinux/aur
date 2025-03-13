# Maintainer: Sam Mulvey (Refutationalist) <archlinux@sammulvey.com>

# Build Options
# I'm not going to lie, this is three packages in a coat.
_build_pvh=${build_pvh:-true}
_build_pv32=${build_pv32:-true}
_build_pv64=${build_pv64:-true}

pkgbase=xen-grub
pkgver=2.12.r0.g5ca9db2
_pkgver=2.12
pkgrel=1
pkgdesc="a version of GRUB2 for booting Xen PV and PVH domUs"
arch=(x86_64)
url="https://www.gnu.org/software/grub/"
license=('GPL-3.0-or-later')
makedepends=(git xz python texinfo gettext device-mapper)
depends=(xen)
options=(!buildflags !strip)

# Okay, what packages am I building?
pkgname=()
[ "${_build_pvh}"  == "true" ] && pkgname+=("xen-grub-pvh")
[ "${_build_pv32}" == "true" ] && pkgname+=("xen-grub-pv32")
[ "${_build_pv64}" == "true" ] && pkgname+=("xen-grub-pv64")



source=(
	"git+https://git.savannah.gnu.org/git/grub.git#tag=grub-${_pkgver}"
	"git+https://git.savannah.gnu.org/git/gnulib.git"
	"grub.cfg")

# Add signed commit checking?

sha512sums=('SKIP'
            'SKIP'
            '02976adbf68af0ec13ef8910fc6c409591e9528418e3157adb7d8a4a9ae1a43fed4a2fe372d9df8b0520a9edd7e26cfb22ca101f1c4c9be7e5ace61508fa56c8')


pkgver() {
	cd "${srcdir}/grub"
	git describe --long --abbrev=7 | sed 's/^grub-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

# Shamelessly stolen from the Arch Linux grub package
_backports=(
	# current git master for loads of security fixes
	# https://lists.gnu.org/archive/html/grub-devel/2025-02/msg00024.html
	"grub-${_pkgver}..56ccc5ed569869fd735074ccebeaa7aab058342d"
)
_reverts=(
)


prepare() {
	cd "$srcdir/grub"


	# Continuing the be shameless stolen from the GRUB in the repos.
	local _c _l 

	echo "--> Apply backports..." 
	for _c in "${_backports[@]}"; do 
		if [[ "${_c}" == *..* ]]; then _l='--reverse'; else _l='--max-count=1'; fi 
		git log --oneline "${_l}" "${_c}" 
		git cherry-pick --mainline 1 --no-commit "${_c}" 
	done 

	echo "--> Apply reverts..." 
	for _c in "${_reverts[@]}"; do 
		if [[ "${_c}" == *..* ]]; then _l='--reverse'; else _l='--max-count=1'; fi
		git log --oneline "${_l}" "${_c}"
		git revert --mainline 1 --no-commit "${_c}"
	done
	
	./bootstrap  \
		--gnulib-srcdir="${srcdir}/gnulib/" \
		--no-git
	cp "${srcdir}/grub.cfg" .

	cd ..
	echo "dividing source trees"
	[ "${_build_pvh}"  == "true" ] && cp -R grub grub-pvh
	[ "${_build_pv32}" == "true" ] && cp -R grub grub-pv32
	[ "${_build_pv64}" == "true" ] && cp -R grub grub-pv64
}

build() {
	cd "${srcdir}"

	if [ "${_build_pvh}" == "true" ]; then

		echo "--> Building PVH"

		cd grub-pvh

		TARGET_LDFLAGS=-static ./configure \
			--with-platform=xen_pvh \
			--enable-device-mapper

		# this will compile a ton of stuff we'll never, ever need.
		make

		# make the bootloader image
		./grub-mkstandalone \
			--grub-mkimage=./grub-mkimage \
			-o pvhgrub \
			-O i386-xen_pvh \
			-d ./grub-core/ "/boot/grub/grub.cfg=./grub.cfg"

		cd ..
	fi

	if [ "${_build_pv32}" == "true" ]; then

		echo "--> Building PV32"

		cd "${srcdir}/grub-pv32"

		TARGET_LDFLAGS=-static ./configure \
			--target=i386 \
			--with-platform=xen \
			--enable-device-mapper

		make

		./grub-mkstandalone \
			--grub-mkimage=./grub-mkimage \
			-o pvgrub32 \
			-O i386-xen \
			-d ./grub-core/ "/boot/grub/grub.cfg=./grub.cfg" \
			--locale-directory=/usr/share/locale

		cd ..


	fi

	if [ "${_build_pv64}" == "true" ]; then

		echo "--> Building PV64"

		cd "${srcdir}/grub-pv64"

		TARGET_LDFLAGS=-static ./configure \
			--target=amd64 \
			--with-platform=xen \
			--enable-device-mapper

		make

		./grub-mkstandalone \
			--grub-mkimage=./grub-mkimage \
			-o pvgrub64 \
			-O x86_64-xen \
			-d ./grub-core/ "/boot/grub/grub.cfg=./grub.cfg" \
			--locale-directory=/usr/share/locale

			cd ..


	fi


}

package_xen-grub-pvh() {
	pkgdesc="GRUB bootloader for Xen PVH domUs"
	provides=(xen-pvhgrub)
	conflicts=(xen-pvhgrub)

	cd "$srcdir/${_srcname}"
	mkdir -p "${pkgdir}/usr/lib/xen/boot"
	install -m644 "${srcdir}/grub-pvh/pvhgrub" "${pkgdir}/usr/lib/xen/boot"
}

package_xen-grub-pv32() {
	pkgdesc="GRUB bootloader for Xen 32bit PV domUs"

	cd "$srcdir/${_srcname}"
	mkdir -p "${pkgdir}/usr/lib/xen/boot"
	install -m644 "${srcdir}/grub-pv32/pvgrub32" "${pkgdir}/usr/lib/xen/boot"

}

package_xen-grub-pv64() {
	pkgdesc="GRUB bootloader for Xen 64bit PV domUs"

	cd "$srcdir/${_srcname}"
	mkdir -p "${pkgdir}/usr/lib/xen/boot"
	install -m644 "${srcdir}/grub-pv64/pvgrub64" "${pkgdir}/usr/lib/xen/boot"

}


