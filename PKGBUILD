# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Keshav P R <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

_grub_lua_ver=24
_grub_ntldr_ver=21
_grub_915_ver=9

pkgname=('grub-common' 'grub-bios' 'grub-efi-i386')
pkgbase=grub
pkgver=2.00
pkgrel=1
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
        'grub_bzr_export.sh')

noextract=("grub2_extras_lua_r${_grub_lua_ver}.tar.xz"
           "grub2_extras_ntldr-img_r${_grub_ntldr_ver}.tar.xz"
           "grub2_extras_915resolution_r${_grub_915_ver}.tar.xz")

sha1sums=('274d91e96b56a5b9dd0a07accff69dbb6dfb596b'
          '89290031b974780c6df76893836d2477d4add895'
          'eb4b35b4c36b64f9405cbcbc538cb205171c1c0a'
          'd5ae2efec25616028a9d89e98b6e454f1c4c415f'
          '26e4e946190bea1f03632658cf08ba90e11dec57'
          'dbf493dec4722feb11f0b5c71ad453a18daf0fc5'
          '76ae862a945a8848e6999adf8ad1847f0f7008b9'
          'ce35d7ae75cd1b5b677e894e528f96add40e77b9'
          '0cfd4e51cdb14a92f06cfd3c607f2aa21f3e55fc')

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
		--sbindir="/usr/sbin" \
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
		--sbindir="/usr/sbin" \
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
