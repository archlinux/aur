# Maintainer: Sam Mulvey (Refutationalist) <archlinux@sammulvey.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Chris Chapman (cman) <chris.chapman@aggiemail.usu.edu>

# Build Options
_build_stubdom=${build_stubdom:-false}
_boot_dir=${boot_dir:-/boot}
_efi_dir=${efi_dir:-/boot}
_efi_mountpoint=${efi_mountpoint:-/boot}

# External files used by Xen
# Check http://xenbits.xen.org/xen-extfiles/ for updates
_gmp=4.3.2
_grub=0.97
_lwip=1.3.0
_newlib=1.16.0
_pciutils=2.2.9
_polarssl=1.1.4
_tpm_emulator=0.7.4
_zlib=1.2.3


# Flags passed to make
_common_make_flags=(
  "BOOT_DIR=${_boot_dir}"
  "EFI_DIR=${_efi_dir}"
  "EFI_MOUNTPOINT=${_efi_mountpoint}"
  "XEN_VENDORVERSION=-${pkgrel}arch"
)

pkgbase=xen
pkgname=("xen" "xen-docs")
pkgver=4.17.0
_branch="stable-4.17"
pkgrel=1
pkgdesc='Open-source type-1 or baremetal hypervisor - stable branch'
arch=('x86_64')
url='https://xenproject.org/'
license=('GPL2')
options=(!buildflags)

makedepends=(
	'zlib' 'python' 'ncurses' 'openssl' 'libx11' 'libuuid.so' 'yajl' 'libaio' 'glib2' 'pkgconf' 'git'
	'bridge-utils' 'iproute2' 'inetutils' 'acpica' 'lib32-glibc' 'gnutls'
	'vde2' 'lzo' 'pciutils' 'sdl2' 'systemd-libs'
	'systemd' 'wget' 'pandoc' 'valgrind' 'git' 'bin86' 'dev86' 'bison' 'gettext' 'flex' 'pixman' 'ocaml' 'ocaml-findlib' 'fig2dev'
) # last line from namcap, these depends are the xen depends
_stubdom_makedepends=('cmake')

optdepends=(
	'xen-qemu: needed for PV and HVM domUs'
	'xen-pvhgrub: bootloader for PVH domains'
)

_source=(
	"git+https://xenbits.xen.org/git-http/xen.git#branch=${_branch}"
	"efi-xen.cfg"
	"xen.conf"
	"tmpfiles.conf"
	"xen-ucode-extract.sh"
	"xen-intel-ucode.hook"
	"xen-amd-ucode.hook"
)

# Follow the Xen securite mailing lists, and if a patch is applicable to our package
# add the URL here.
# NOTE: Patch order is important.
_patches=(
)


# Sources required for building stubdom
_stubdom_source=(
	"vtpm-gcc12-fixes.patch"  # based on above patch
	"add-stubdom-fixes.patch" # add above patch to build
	"http://xenbits.xen.org/xen-extfiles/gmp-$_gmp.tar.bz2"
	"http://xenbits.xen.org/xen-extfiles/grub-$_grub.tar.gz"
	"http://xenbits.xen.org/xen-extfiles/lwip-$_lwip.tar.gz"
	"http://xenbits.xen.org/xen-extfiles/newlib-$_newlib.tar.gz"
	"http://xenbits.xen.org/xen-extfiles/pciutils-$_pciutils.tar.bz2"
	"http://xenbits.xen.org/xen-extfiles/polarssl-$_polarssl-gpl.tgz"
	"http://xenbits.xen.org/xen-extfiles/tpm_emulator-$_tpm_emulator.tar.gz"
	"http://xenbits.xen.org/xen-extfiles/zlib-$_zlib.tar.gz"
)


# from cheap hack known as break_out_sums.sh
_sha512sums=(
	"SKIP"
	"1bbcbcd9fb8344a207409ec9f0064a45b726416f043f902ca587f5e4fa58497a759be4ffd584fa32318e960aa478864cc05ec026c444e8d27ca8e3248bd67420" # efi-xen.cfg
	"ccaa2ff82e4203b11e5dec9aeccac2e165721d8067e0094603ecaa7a70b78c9eb9e2287a32687883d26b6ceae6f8d2ad7636ddf949eb658637b3ceaa6999711b" # xen.conf
	"53ba61587cc2e84044e935531ed161e22c36d9e90b43cab7b8e63bcc531deeefacca301b5dff39ce89210f06f1d1e4f4f5cf49d658ed5d9038c707e3c95c66ef" # tmpfiles.conf
	"a9230ec6ef9636ac3f3e4b72b1747ee8c4648a8bf4bd8dc3650365e34f1f67474429dbdd24996907d277b0ff5f235574643e781cb3ff37da954e899ddadbe0d6" # xen-ucode-extract.sh
	"7a832de9b35f4b77ee80d33310b23886f4d48d1d42c3d6ef6f8e2b428bec7332a285336864b61cfa01d9a14c2023674015beb7527bd5849b069f2be88e6500cd" # xen-intel-ucode.hook
	"99921b94a29fa7988c7fb5c17da8e598e777c972d6cae8c8643c991e5ff911a25525345ea8913945313d5c49fecf9da8cc3b83d47ab03928341e917b304370a9" # xen-amd-ucode.hook
)


_patch_sums=(
)


_stub_sums=(
	"2397795a0a4999a6efee3d8291356673d1757bc1b34dd2015378ef6ea8800ee1317c7d9f902d82bd62ff8d451223ad51ced5e3a6d66e8e79930a7f513cc2b805" # vtpm-gcc12-fixes.patch
	"e379a2c072a1a42973aaddd1d8046ab68be50fd386bb718f73fc7401f412a40be3dab94b01e5364604216f39c867a9d6ed1751589c318b45faa28acf33875930" # add-stubdom-fixes.patch
	"2e0b0fd23e6f10742a5517981e5171c6e88b0a93c83da701b296f5c0861d72c19782daab589a7eac3f9032152a0fc7eff7f5362db8fccc4859564a9aa82329cf" # gmp-4.3.2.tar.bz2
	"c2bc9ffc8583aeae71cee9ddcc4418969768d4e3764d47307da54f93981c0109fb07d84b061b3a3628bd00ba4d14a54742bc04848110eb3ae8ca25dbfbaabadb" # grub-0.97.tar.gz
	"1465b58279af1647f909450e394fe002ca165f0ff4a0254bfa9fe0e64316f50facdde2729d79a4e632565b4500cf4d6c74192ac0dd3bc9fe09129bbd67ba089d" # lwip-1.3.0.tar.gz
	"40eb96bbc6736a16b6399e0cdb73e853d0d90b685c967e77899183446664d64570277a633fdafdefc351b46ce210a99115769a1d9f47ac749d7e82837d4d1ac3" # newlib-1.16.0.tar.gz
	"2b3d98d027e46d8c08037366dde6f0781ca03c610ef2b380984639e4ef39899ed8d8b8e4cd9c9dc54df101279b95879bd66bfd4d04ad07fef41e847ea7ae32b5" # pciutils-2.2.9.tar.bz2
	"88da614e4d3f4409c4fd3bb3e44c7587ba051e3fed4e33d526069a67e8180212e1ea22da984656f50e290049f60ddca65383e5983c0f8884f648d71f698303ad" # polarssl-1.1.4-gpl.tgz
	"4928b5b82f57645be9408362706ff2c4d9baa635b21b0d41b1c82930e8c60a759b1ea4fa74d7e6c7cae1b7692d006aa5cb72df0c3b88bf049779aa2b566f9d35" # tpm_emulator-0.7.4.tar.gz
	"021b958fcd0d346c4ba761bcf0cc40f3522de6186cf5a0a6ea34a70504ce9622b1c2626fce40675bc8282cf5f5ade18473656abc38050f72f5d6480507a2106e" # zlib-1.2.3.tar.gz
)

# Simplify things for makepkg
source=( "${_source[@]}" "${_patches[@]}" )
sha512sums=( "${_sha512sums[@]}" "${_patch_sums[@]}" )

for file in "${_patches[@]}"; do
	noextract+=( $(basename ${file}) )
done



# stubdom handling
if [ "${_build_stubdom}" == "true" ]; then
	source=("${source[@]}" "${_stubdom_source[@]}")
	sha512sums=("${sha512sums[@]}" "${_stub_sums[@]}")

	# Add in automagic dependency in order to build vtpm and vtpmmgr stubdoms
	makedepends=( "${makedepends[@]}" "${_stubdom_makedepends[@]}" )

	for file in "${_stubdom_source[@]}"; do
		noextract+=( $(basename ${file}) )
	done

	_config_stubdom='--enable-stubdom'

	# make sure to build the stubdom package
	pkgname+=("xen-stubdom")

else
	_config_stubdom='--disable-stubdom'
fi

# TODO: Setup users, dirs, etc.

prepare() {

	cd "${pkgbase}"

	if [ "${_build_stubdom}" == "true" ]; then

		for file in "${_stubdom_source[@]}"; do
			cp ../$(basename ${file}) stubdom/
		done

		echo "==> Applying GCC 12.1 fixes for stubdom..."
		cp ../vtpm-gcc12-fixes.patch stubdom/
		patch -p1 < ../add-stubdom-fixes.patch


	fi

	for patchurl in "${_patches[@]}"; do
		patch=$(basename $patchurl)
		echo "==> Applying security patch '${patch}'..."
		patch -p1 < "../${patch}"
	done

	# Fix Install Paths.
	sed 's,/var/run,/run,g' -i tools/hotplug/Linux/locking.sh
	sed 's,/var/run,/run,g' -i tools/misc/xenpvnetboot
	sed 's,/var/run,/run,g' -i tools/xenmon/xenbaked.c
	sed 's,/var/run,/run,g' -i tools/xenmon/xenmon.py
	sed 's,/var/run,/run,g' -i tools/pygrub/src/pygrub
}

pkgver() {
	cd "${srcdir}/${pkgbase}"
	./version.sh --full xen/Makefile | sed 's/-//'
}

build() {
	cd "${pkgbase}"

	if [ "${_build_stubdom}" == "true" ]; then
		echo "NOTE: Xen build with stubdom support."
	fi

	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--libdir=/usr/lib \
		--with-rundir=/run \
		--enable-systemd \
		--disable-qemu-traditional \
		${_config_stubdom} \
		--with-system-qemu=/usr/lib/xen/bin/qemu-system-i386 \
		--with-sysconfig-leaf-dir=conf.d \
		--with-system-ovmf=/usr/share/ovmf/x64/OVMF.fd \
		--with-system-seabios=/usr/share/qemu/bios-256k.bin \
		--disable-ocaml

	make "${_common_make_flags[@]}"
}

package_xen() {
	pkgdesc='Open-source type-1 or baremetal hypervisor'

	depends=(
		'zlib' 'python' 'ncurses' 'openssl' 'libx11' 'libuuid.so' 'yajl' 'libaio' 'glib2' 'pkgconf'
		'bridge-utils' 'iproute2' 'inetutils' 'acpica' 'lib32-glibc' 'gnutls'
		'vde2' 'lzo' 'pciutils' 'sdl2'
		'pixman' 'libseccomp' 'libpng' 'libjpeg-turbo' # inhereted depends because of build environment
	)

	optdepends=(
		'xen-qemu: HVM and PV support'
		'edk2-ovmf: UEFI support'
		'seabios: SeaBIOS payload support'
		'xen-docs: HTML documentation and man pages'
		'grub-xen-git: GRUB and pvgrub2 bootloader support'
		'linux-headers: extract bootable non-zstd kernel for recent kernels'
	)

	install="xen.install"

	backup=(
		"etc/conf.d/xencommons"
		"etc/conf.d/xendomains"
		"etc/xen/efi-xen.cfg"
		"etc/xen/cpupool"
		"etc/xen/xl.conf"
	)


	cd "${pkgbase}"

	make "${_common_make_flags[@]}" DESTDIR="$pkgdir" install

	rm -rf "$pkgdir"/var/run

	#  Symlinks to prior installed versions are not The Arch Way, leave only the bare EFI binary
	(cd "${pkgdir}/${_efi_dir}" && mv "$(realpath xen.efi)" xen.efi)

	[ -d "$pkgdir"/etc/xen/scripts ] && backup+=($(find "$pkgdir"/etc/xen/scripts/ -type f | sed "s|^$pkgdir/||g"))

	mkdir -p "${pkgdir}/var/log/xen/console"

	# Continued: Trim hypervisor symlinks.
	(cd "${pkgdir}/${_boot_dir}" && mv "$(realpath xen.gz)" xen.gz)

	# Do all symlink removals after the directories have had the real
	# binaries moved overtop any symlinks. Note that dependening on
	# configuratation _efi_dir and _boot_dir may be the same directory, so
	# don't clean any of them until they've all been processed.
	find "${pkgdir}/${_efi_dir}" -type l -delete
	find "${pkgdir}/${_boot_dir}" -type l -delete

	# Remove syms.
	find "${pkgdir}/usr/lib/debug" -type f \( -name '*-syms*' -or -name '*\.map' \) -delete
	rmdir "${pkgdir}/usr/lib/debug/usr/lib/xen/boot"
	rmdir "${pkgdir}/usr/lib/debug/usr/lib/xen"
	rmdir "${pkgdir}/usr/lib/debug/usr/lib"
	rmdir "${pkgdir}/usr/lib/debug/usr"
	rmdir "${pkgdir}/usr/lib/debug"

	# Remove SysVinit files.
	rm -r "${pkgdir}/etc/init.d"

	# Install files for Arch Linux.
	install -D -m 0644 "${srcdir}/efi-xen.cfg" "${pkgdir}/etc/xen/efi-xen.cfg"
	install -D -m 0644 "${srcdir}/xen.conf" "${pkgdir}/usr/lib/modules-load.d/xen.conf"
	install -D -m 0644 "${srcdir}/tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgbase}.conf"

	# microcode hooks
	mkdir -p "${pkgdir}/usr/share/libalpm/scripts"     "${pkgdir}/usr/share/libalpm/hooks"
	install -m755 "${srcdir}/xen-ucode-extract.sh"     "${pkgdir}/usr/share/libalpm/scripts"
	install -m644 "${srcdir}/xen-intel-ucode.hook"     "${pkgdir}/usr/share/libalpm/hooks"
	install -m644 "${srcdir}/xen-amd-ucode.hook"       "${pkgdir}/usr/share/libalpm/hooks"

	# Remove documentation (included in separate xen-docs package).
	rm -r "${pkgdir}/usr/share/doc"
	rm -r "${pkgdir}/usr/share/man"

	# remove stubdom files
        rm -f "${pkgdir}/usr/lib/xen/boot/vtpmmgr-stubdom.gz" \
                "${pkgdir}/usr/lib/xen/boot/vtpm-stubdom.gz" \
                "${pkgdir}/usr/lib/xen/boot/xenstorepvh-stubdom.gz" \
                "${pkgdir}/usr/lib/xen/boot/xenstore-stubdom.gz"


}

package_xen-docs() {
	pkgdesc="Xen hypervisor documentation and man pages"
	arch=("any")
	cd "${pkgbase}"
	make "${_common_make_flags[@]}" DESTDIR="$pkgdir" install-docs
}


package_xen-stubdom() {
	pkgdesc="Xen hypervisor stubdom files"
	arch=("x86_64")
	depends=("xen")

	cd "${srcdir}/${pkgbase}/stubdom"
	make DESTDIR="${pkgdir}" install
}


