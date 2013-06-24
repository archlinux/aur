# Maintainer : Tobias Powalowski <tpowa@archlinux.org>
# Maintainer : Ronald van Haren <ronald.archlinux.org>
# Contributor: Keshav Padram (the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

_GRUB_BZR_REV="5043"

## grub-extras lua and gpxe fail to build with grub bzr rev 5043

[[ "${CARCH}" == "x86_64" ]] && _EFI_ARCH="x86_64"
[[ "${CARCH}" == "i686" ]] && _EFI_ARCH="i386"

pkgname=grub
pkgdesc="GNU GRand Unified Bootloader (2)"
pkgver=2.00.${_GRUB_BZR_REV}
pkgrel=1
url="https://www.gnu.org/software/grub/"
arch=('x86_64' 'i686')
license=('GPL3')
backup=('boot/grub/grub.cfg' 'etc/default/grub' 'etc/grub.d/40_custom')
install="${pkgname}.install"
options=('!makeflags')

conflicts=('grub-common' 'grub-bios' "grub-efi-${_EFI_ARCH}" 'grub-legacy')
replaces=('grub-common' 'grub-bios' "grub-efi-${_EFI_ARCH}")
provides=('grub-common' 'grub-bios' "grub-efi-${_EFI_ARCH}")

makedepends=('xz' 'freetype2' 'bdf-unifont' 'ttf-dejavu' 'python' 'autogen'
             'texinfo' 'help2man' 'gettext' 'device-mapper' 'fuse' 'bzr')
depends=('sh' 'xz' 'gettext' 'device-mapper')
optdepends=('freetype2: For grub-mkfont usage'
            'fuse: For grub-mount usage'
            'dosfstools: For grub-mkrescue FAT FS and EFI support' 
            'efibootmgr: For grub-install EFI support'
            'libisoburn: Provides xorriso for generating grub rescue iso using grub-mkrescue'
            'os-prober: To detect other OSes when generating grub.cfg in BIOS systems'
            'mtools: For grub-mkrescue FAT FS support')

# source=("http://ftp.gnu.org/gnu/grub/grub-${pkgver}.tar.xz"
source=("grub-${pkgver}::bzr+bzr://bzr.savannah.gnu.org/grub/trunk/grub/#revision=${_GRUB_BZR_REV}"
        'archlinux_grub_mkconfig_fixes.patch'
        '60_memtest86+'
        'grub.default'
        'grub.cfg')

for _DIR_ in 915resolution ntldr-img ; do
	source+=("grub-extras-${_DIR_}::bzr+bzr://bzr.savannah.gnu.org/grub-extras/${_DIR_}/#revision=")
done

# sha1sums=('274d91e96b56a5b9dd0a07accff69dbb6dfb596b'
sha1sums=('SKIP'
          'e7fd9161057411b1adc22977d4b3e7c06116239d'
          '2aa2deeb7d7dc56f389aa1487b7a57b0d44ce559'
          'dbf493dec4722feb11f0b5c71ad453a18daf0fc5'
          '5b7fcb0718a23035c039eb2fda9e088bb13ae611'
          'SKIP'
          'SKIP')

_build_grub-common_and_bios() {
	
	## Copy the source for building the common/bios package
	cp -r "${srcdir}/grub-${pkgver}" "${srcdir}/grub-${pkgver}-bios"
	cd "${srcdir}/grub-${pkgver}-bios/"
	
	## Add the grub-extra sources
	export GRUB_CONTRIB="${srcdir}/grub-${pkgver}-bios/grub-extras/"
	
	install -d "${srcdir}/grub-${pkgver}-bios/grub-extras"
	for _DIR_ in 915resolution ntldr-img ; do
		cp -r "${srcdir}/grub-extras-${_DIR_}" "${srcdir}/grub-${pkgver}-bios/grub-extras/${_DIR_}"
	done
	
	## Unset all compiler FLAGS for bios build
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	## Start the actual build process
	cd "${srcdir}/grub-${pkgver}-bios/"
	./autogen.sh
	echo
	
	./configure \
		--with-platform="pc" \
		--target="i386" \
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
	
	make
	echo
}

_build_grub-efi() {
	
	## Copy the source for building the efi package
	cp -r "${srcdir}/grub-${pkgver}" "${srcdir}/grub-${pkgver}-efi"
	cd "${srcdir}/grub-${pkgver}-efi/"
	
	# export GRUB_CONTRIB="${srcdir}/grub-${pkgver}-efi/grub-extras/"
	
	# install -d "${srcdir}/grub-${pkgver}-efi/grub-extras/"
	# for _DIR_ in lua gpxe ; do
	#	cp -r "${srcdir}/grub-extras-${_DIR_}" "${srcdir}/grub-${pkgver}-bios/grub-extras/${_DIR_}"
	# done
	
	## Unset all compiler FLAGS for efi build
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	cd "${srcdir}/grub-${pkgver}-efi/"
	./autogen.sh
	echo
	
	./configure \
		--with-platform="efi" \
		--target="${_EFI_ARCH}" \
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
	
	make
	echo
	
}

build() {
	
	## Set ARCH dependent variables
	if [[ "${CARCH}" == 'x86_64' ]]; then
		_EFIEMU="--enable-efiemu"
	else
		_EFIEMU="--disable-efiemu"
	fi
	
	cd "${srcdir}/grub-${pkgver}/"
	
	## Apply Archlinux specific fixes to enable grub-mkconfig detect Arch kernels and initramfs
	patch -Np1 -i "${srcdir}/archlinux_grub_mkconfig_fixes.patch"
	echo
	
	## fix unifont.bdf location so that grub-mkfont can create *.pf2 files
	sed 's|/usr/share/fonts/unifont|/usr/share/fonts/unifont /usr/share/fonts/misc|g' -i "${srcdir}/grub-${pkgver}/configure.ac"
	
	## fix DejaVuSans.ttf location so that grub-mkfont can create *.pf2 files for starfield theme
	sed 's|/usr/share/fonts/dejavu|/usr/share/fonts/dejavu /usr/share/fonts/TTF|g' -i "${srcdir}/grub-${pkgver}/configure.ac"
	
	## Requires python2
	# sed 's|python |python2 |g' -i "${srcdir}/grub-${pkgver}/autogen.sh"
	
	_build_grub-common_and_bios
	echo
	
	_build_grub-efi
	echo

}

_package_grub-common_and_bios() {
	
	cd "${srcdir}/grub-${pkgver}-bios/"
	make DESTDIR="${pkgdir}/" bashcompletiondir="/usr/share/bash-completion/completions" install
	echo
	
	## remove gdb debugging related files
	rm -f "${pkgdir}/usr/lib/grub/i386-pc"/*.module || true
	rm -f "${pkgdir}/usr/lib/grub/i386-pc"/*.image || true
	rm -f "${pkgdir}/usr/lib/grub/i386-pc"/{kernel.exec,gdb_grub,gmodule.pl} || true
	
	## Fix OS naming FS#33393
	sed 's|GNU/Linux|Linux|' -i "${pkgdir}/etc/grub.d/10_linux"
	
	## Install extra /etc/grub.d/ files
	install -D -m0755 "${srcdir}/60_memtest86+" "${pkgdir}/etc/grub.d/60_memtest86+"
	
	## Install /etc/default/grub (used by grub-mkconfig)
	install -D -m0644 "${srcdir}/grub.default" "${pkgdir}/etc/default/grub"
	
	## Install grub.cfg for backup array
	install -D -m0644 "${srcdir}/grub.cfg" "${pkgdir}/boot/grub/grub.cfg"
	
}

_package_grub-efi() {
	
	cd "${srcdir}/grub-${pkgver}-efi/"
	make DESTDIR="${pkgdir}/" bashcompletiondir="/usr/share/bash-completion/completions" install
	echo
	
	## remove gdb debugging related files
	rm -f "${pkgdir}/usr/lib/grub/${_EFI_ARCH}-efi"/*.module || true
	rm -f "${pkgdir}/usr/lib/grub/${_EFI_ARCH}-efi"/*.image || true
	rm -f "${pkgdir}/usr/lib/grub/${_EFI_ARCH}-efi"/{kernel.exec,gdb_grub,gmodule.pl} || true
	
}

package() {
	
	_package_grub-efi
	
	_package_grub-common_and_bios
	
}
