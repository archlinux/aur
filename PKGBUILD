# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Keshav P R <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

_grub_lua_ver=24
_grub_ntldr_ver=21
_grub_915_ver=9

pkgname=('grub-common' 'grub-bios' 'grub-efi-i386')
pkgbase=grub
pkgver=2.00
pkgrel=2
url="https://www.gnu.org/software/grub/"
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('xz' 'bdf-unifont' 'ttf-dejavu' 'python' 'autogen'
             'texinfo' 'help2man' 'gettext' 'device-mapper' 'fuse')

source=("http://ftp.gnu.org/gnu/grub/grub-${pkgver}.tar.xz"
        "ftp://ftp.archlinux.org/other/grub2/grub2_extras_lua_r${_grub_lua_ver}.tar.xz"
        "ftp://ftp.archlinux.org/other/grub2/grub2_extras_ntldr-img_r${_grub_ntldr_ver}.tar.xz"
        "ftp://ftp.archlinux.org/other/grub2/grub2_extras_915resolution_r${_grub_915_ver}.tar.xz"
        'archlinux_grub_mkconfig_fixes.patch'
        'grub.default'
        'grub.cfg'
        '20_memtest86+'
        'grub_bzr_export.sh'
        '0069-Backport-gnulib-fixes-for-C11.-Fixes-Savannah-bug-37.patch'
        'grub-2.00-fix-docs.patch')

noextract=("grub2_extras_lua_r${_grub_lua_ver}.tar.xz"
           "grub2_extras_ntldr-img_r${_grub_ntldr_ver}.tar.xz"
           "grub2_extras_915resolution_r${_grub_915_ver}.tar.xz")


_build_grub-common_and_bios() {

	## copy the source for building the common/bios package
	cp -r "${srcdir}/grub-${pkgver}" "${srcdir}/grub_bios-${pkgver}"
	cd "${srcdir}/grub_bios-${pkgver}"

	## Apply Archlinux specific fixes to enable grub-mkconfig detect Arch kernels and initramfs
	patch -Np1 -i "${srcdir}/archlinux_grub_mkconfig_fixes.patch"
	echo

	## fix unifont.bdf location so that grub-mkfont can create *.pf2 files
	sed 's|/usr/share/fonts/unifont|/usr/share/fonts/unifont /usr/share/fonts/misc|g' -i "${srcdir}/grub_bios-${pkgver}/configure.ac"

	## fix DejaVuSans.ttf location so that grub-mkfont can create *.pf2 files for starfield theme
	sed 's|/usr/share/fonts/dejavu|/usr/share/fonts/dejavu /usr/share/fonts/TTF|g' -i "${srcdir}/grub_bios-${pkgver}/configure.ac"

	## add the grub-extra sources
	export GRUB_CONTRIB="${srcdir}/grub_bios-${pkgver}/grub-extras/"
	install -d "${srcdir}/grub_bios-${pkgver}/grub-extras"

	bsdtar xf "${srcdir}/grub2_extras_lua_r${_grub_lua_ver}.tar.xz" \
		-C "${srcdir}/grub_bios-${pkgver}/grub-extras"

	bsdtar xf "${srcdir}/grub2_extras_ntldr-img_r${_grub_ntldr_ver}.tar.xz" \
		-C "${srcdir}/grub_bios-${pkgver}/grub-extras"

	bsdtar xf "${srcdir}/grub2_extras_915resolution_r${_grub_915_ver}.tar.xz" \
		-C "${srcdir}/grub_bios-${pkgver}/grub-extras"

	## Requires python2
	# sed 's|python |python2 |g' -i "${srcdir}/grub_bios-${pkgver}/autogen.sh"

	# fix compiling with gcc48
        patch -Np1 -i ${srcdir}/0069-Backport-gnulib-fixes-for-C11.-Fixes-Savannah-bug-37.patch

	#fix docs compiling
        patch -Np1 -i ${srcdir}/grub-2.00-fix-docs.patch

        ## start the actual build process
	cd "${srcdir}/grub_bios-${pkgver}"
	./autogen.sh
	echo

	CFLAGS="" ./configure \
		--with-platform="pc" \
		--target="i386" \
		--host="${CARCH}-unknown-linux-gnu" \
		"${_EFIEMU}" \
		--enable-mm-debug \
		--enable-nls \
		--enable-device-mapper \
		--enable-cache-stats \
		--enable-grub-mkfont \
		--enable-grub-mount \
		--prefix="/usr" \
		--bindir="/usr/bin" \
		--sbindir="/usr/bin" \
		--mandir="/usr/share/man" \
		--infodir="/usr/share/info" \
		--datarootdir="/usr/share" \
		--sysconfdir="/etc" \
		--program-prefix="" \
		--with-bootdir="/boot" \
		--with-grubdir="grub" \
		--disable-werror
	echo

	CFLAGS="" make
	echo

}

_build_grub-efi-i386() {

	## copy the source for building the efi package
	cp -r "${srcdir}/grub-${pkgver}" "${srcdir}/grub_efi-${pkgver}"
	cd "${srcdir}/grub_efi-${pkgver}"

	export GRUB_CONTRIB="${srcdir}/grub_efi-${pkgver}/grub-extras/"
	install -d "${srcdir}/grub_efi-${pkgver}/grub-extras"

	bsdtar xf "${srcdir}/grub2_extras_lua_r${_grub_lua_ver}.tar.xz" \
		-C "${srcdir}/grub_efi-${pkgver}/grub-extras"

        # fix compiling with gcc48
        patch -Np1 -i ${srcdir}/0069-Backport-gnulib-fixes-for-C11.-Fixes-Savannah-bug-37.patch

	#fix docs compiling
        patch -Np1 -i ${srcdir}/grub-2.00-fix-docs.patch

	cd "${srcdir}/grub_efi-${pkgver}"
	./autogen.sh
	echo

	CFLAGS="" ./configure \
		--with-platform="efi" \
		--target="i386" \
		--host="${CARCH}-unknown-linux-gnu" \
		--disable-efiemu \
		--enable-mm-debug \
		--enable-nls \
		--enable-device-mapper \
		--enable-cache-stats \
		--enable-grub-mkfont \
		--enable-grub-mount \
		--prefix="/usr" \
		--bindir="/usr/bin" \
		--sbindir="/usr/bin" \
		--mandir="/usr/share/man" \
		--infodir="/usr/share/info" \
		--datarootdir="/usr/share" \
		--sysconfdir="/etc" \
		--program-prefix="" \
		--with-bootdir="/boot" \
		--with-grubdir="grub" \
		--disable-werror
	echo

	CFLAGS="" make
	echo

}

build() {

	## set architecture dependent variables
	if [[ "${CARCH}" == 'x86_64' ]]; then
		_EFIEMU="--enable-efiemu"
	else
		_EFIEMU="--disable-efiemu"
	fi

	_HOST="${CARCH}"

	cd "${srcdir}/grub-${pkgver}"
	# _get_locale_files

	_build_grub-common_and_bios
	echo

	_build_grub-efi-i386
	echo

}

package_grub-common() {

	pkgdesc="GNU GRand Unified Bootloader - Utilities and Common Files"
	depends=('sh' 'xz' 'freetype2' 'gettext' 'device-mapper' 'fuse')
	conflicts=('grub-legacy' 'grub')
	replaces=('grub2-common')
	provides=('grub2-common')
	backup=('boot/grub/grub.cfg' 'etc/default/grub' 'etc/grub.d/40_custom')
	optdepends=('libisoburn: provides xorriso for generating grub rescue iso using grub-mkrescue'
	            'os-prober: to detect other OSes when generating grub.cfg in BIOS systems'
	            'mtools: for grub-mkrescue FAT FS support')
	install="grub.install"
	options=('strip' 'purge' 'docs' 'zipman' '!emptydirs')

	cd "${srcdir}/grub_bios-${pkgver}"
	make DESTDIR="${pkgdir}/" bashcompletiondir="/usr/share/bash-completion/completions" install
	echo

	## install extra /etc/grub.d/ files
	install -D -m0755 "${srcdir}/20_memtest86+" "${pkgdir}/etc/grub.d/20_memtest86+"

	## install /etc/default/grub (used by grub-mkconfig)
	install -D -m0644 "${srcdir}/grub.default" "${pkgdir}/etc/default/grub"

	## install grub.cfg (needed so it doesn't get removed on upgrading because it was previously here)
	install -D -m0644 "${srcdir}/grub.cfg" "${pkgdir}/boot/grub/grub.cfg"

	# remove platform specific files
	rm -rf "${pkgdir}/usr/lib/grub/i386-pc/"

	# Fix OS naming FS#33393
	sed -i 's|GNU/Linux|Linux|' ${pkgdir}/etc/grub.d/10_linux
}

package_grub-bios() {

	pkgdesc="GNU GRand Unified Bootloader - i386 PC BIOS Modules"
	depends=("grub-common=${pkgver}")
	options=('!strip' '!emptydirs')
	replaces=('grub2-bios')
	provides=('grub2-bios')

	cd "${srcdir}/grub_bios-${pkgver}"
	make DESTDIR="${pkgdir}/" install
	echo

	## remove non platform-specific files
	rm -rf "${pkgdir}"/{boot,etc,usr/{share,bin,sbin}}

	## remove gdb debugging related files
	rm -f "${pkgdir}/usr/lib/grub/i386-pc"/*.module || true
	rm -f "${pkgdir}/usr/lib/grub/i386-pc"/*.image || true
	rm -f "${pkgdir}/usr/lib/grub/i386-pc"/{kernel.exec,gdb_grub,gmodule.pl} || true

}

package_grub-efi-i386() {

	pkgdesc="GNU GRand Unified Bootloader - i386 UEFI Modules"
	depends=("grub-common=${pkgver}" 'dosfstools' 'efibootmgr')
	options=('!strip' '!emptydirs')
	replaces=('grub2-efi-i386')
	provides=('grub2-efi-i386')

	cd "${srcdir}/grub_efi-${pkgver}"
	make DESTDIR="${pkgdir}/" install
	echo

	## remove non platform-specific files
	rm -rf "${pkgdir}"/{boot,etc,usr/{share,bin,sbin}}

	## remove gdb debugging related files
	rm -f "${pkgdir}/usr/lib/grub/i386-efi"/*.module || true
	rm -f "${pkgdir}/usr/lib/grub/i386-efi"/*.image || true
	rm -f "${pkgdir}/usr/lib/grub/i386-efi"/{kernel.exec,gdb_grub,gmodule.pl} || true

}
md5sums=('a1043102fbc7bcedbf53e7ee3d17ab91'
         '704ea9f250b6137f05fa0197fd07053a'
         '77f7d5f8ce395663cd7fff4d37099957'
         'a80e2b1d3bab778c3b6117d5a698992f'
         '3b3dae993939b4e323f19365dd830e12'
         'a03ffd56324520393bf574cefccb893d'
         'f184b060fe22eca662ad455c69241496'
         '9b6358d3de5c4bb95a041ab7c44a21ec'
         'f343ed2340ebc86c427873641bb72419'
         'ab751d1d8cd3fd47e5ee24d71ecc31ed'
         '342dd18472a24e5fd252458b24f39a29')
