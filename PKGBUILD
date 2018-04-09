# Maintainer:  Maik Broemme <mbroemme@libmpq.org>
# Contributor: Janne Heß <jannehess@gmail.com>
# Contributor: Arthur Borsboom <arthurborsboom@gmail.com>
# Contributor: Shanmu Thiagaraja <sthiagaraja+AUR@prshanmu.com>
# Contributor: Limao Luo
# Contributor: Luceo
# Contributor: Revellion
# Contributor: John Thomson

# linux-4.7 EFI boot panic issue (patch linux)
#http://lkml.iu.edu/hypermail/linux/kernel/1608.2/03448.html

#####
# Settings
#####

_build_stubdom=${build_stubdom:-false}
# use _build_stubdom=true to build xen with stubdom

#####
# Versions
#####

_xen_version='4.10.0'
_xen_major_version='4'
_xen_minor_version='10'
# grep -R IPXE_GIT_TAG src/xen-*/tools/firmware/etherboot
_git_tag_ipxe='827dd1bfee67daa683935ce65316f7e0f057fe1c'
# grep '_VERSION=' src/xen-*/stubdom/configure
if [ "${_build_stubdom}" = true ]; then
	_zlib_version='1.2.3'
	_libpci_version='2.2.9'
	_newlib_version='1.16.0'
	_lwip_version='1.3.0'
	_grub_version='0.97'
	_ocaml_version='3.11.0'
	_ocaml_short_version='3.11'
	_gmp_version='4.3.2'
	_polarssl_version='1.1.4'
	_tpmemu_version='0.7.4'
fi

#####
# Package metadata
#####

pkgbase=xen
pkgname=(xen xen-docs)
pkgver="${_xen_version}"
pkgrel=2
pkgdesc='Virtual Machine Hypervisor & Tools'
url='http://www.xenproject.org/'
license=('GPL2')
arch=('x86_64') # TODO What about ARM?
changelog='ChangeLog'
validpgpkeys=('23E3222C145F4475FA8060A783FE14C957E82BD9') # Xen.org Xen tree code signing
options=(!buildflags !strip)
makedepends=(
	bin86
	cmake
	dev86
	fig2dev
	figlet
	ghostscript
	git
	iasl
	markdown
	mingw-w64-binutils
	nasm
	ocaml-findlib
	pandoc
	perl
	spice-protocol
	spice-glib
	wget
	# Dependencies from xen
	bridge-utils
	curl
	gnutls
	iproute2
	lib32-glibc
	libaio
	libcap-ng
	libepoxy
	libiscsi
	libnl
	libpng
	lzo
	pciutils
	python2
	sdl2
	spice
	usbredir
	yajl
)

# Sources
source=(
	"https://downloads.xenproject.org/release/xen/${pkgver}/${pkgbase}-${pkgver}.tar.gz"
	"https://downloads.xenproject.org/release/xen/${pkgver}/${pkgbase}-${pkgver}.tar.gz.sig"
	"http://xenbits.xen.org/xen-extfiles/ipxe-git-${_git_tag_ipxe}.tar.gz"

	# XSA patches
	xsa253-xsa254-diff-release410-comet1.1.patch::'https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff_plain;hp=refs/tags/RELEASE-4.10.0;h=refs/heads/4.10.0-shim-comet'
	'https://xenbits.xen.org/xsa/xsa255-1.patch'
	'https://xenbits.xen.org/xsa/xsa255-2.patch'
	'https://xenbits.xen.org/xsa/xsa256.patch'

	# Files
	'grub-mkconfig-helper'
	'efi-xen.cfg'
	'grub.conf'
	"${pkgbase}.conf"
	'tmpfiles.conf'

	# Compile fixes.
	'ocaml-unsafe-string.patch'
)

if [ "${_build_stubdom}" = true ] ; then
	source+=(
		"http://xenbits.xen.org/xen-extfiles/zlib-${_zlib_version}.tar.gz"
		"http://xenbits.xen.org/xen-extfiles/pciutils-${_libpci_version}.tar.bz2"
		"http://xenbits.xen.org/xen-extfiles/newlib-${_newlib_version}.tar.gz"
		"http://xenbits.xen.org/xen-extfiles/lwip-${_lwip_version}.tar.gz"
		"http://xenbits.xen.org/xen-extfiles/grub-${_grub_version}.tar.gz"
		"http://caml.inria.fr/pub/distrib/ocaml-${_ocaml_short_version}/ocaml-${_ocaml_version}.tar.gz"
		"http://xenbits.xen.org/xen-extfiles/gmp-${_gmp_version}.tar.bz2"
		"http://xenbits.xen.org/xen-extfiles/polarssl-${_polarssl_version}-gpl.tgz"
		"http://xenbits.xen.org/xen-extfiles/tpm_emulator-${_tpmemu_version}.tar.gz"
	)
fi

sha256sums=(
	'0262a7023f8b12bcacfb0b25e69b2a63291f944f7683d54d8f33d4b2ca556844'
	'SKIP'
	'36deacb946c59ad1d6600f6e5b89d6a7a8961e65eb000900e184075920120f49'

	# XSA patches (Last checked: XSA-256)
	'fa8cd07b85a8ff29cba8d891f12f9be4b173dd91a58404aabbf49c3f83152af9'
	'05a5570ecf4354f7aad35bb77a4c2f5f556bcabf3555829a98c94dcfb6dd4696'
	'df43a147f1e1a2b7d59588bc91cdaac05d4e45bcfc4e2c8cb5e8de840d44b43d'
	'3e45cc3f2ea516e7470083592041e238c0dfe32324790b2fba0e47c9efe38865'

	# PKGBUILD files
	'7dd6f1d6c10d4e8793412175b964df2477633cd988810df71e2040bf79e4d56c'
	'ceaff798a92a7aef1465a0a0b27b1817aedd2c857332b456aaa6dd78dc72438f'
	'3f0af16958c3e057b9baa5afc47050d9adf7dd553274dd97ae4f35938fefb568'
	'50a9b7fd19e8beb1dea09755f07318f36be0b7ec53d3c9e74f3266a63e682c0c'
	'80227f8daa62a49c08fb7ffcc7de8cabbd0645396e46c04f7caaa71b04f446f0'

	# Compile fixes.
	'7c76b116ce09a53708306682f04e1460a788fe66f832091b7003a5d8e1fee312'
)


if [ "$_build_stubdom" = true ] ; then
	sha256sums+=(
		'1795c7d067a43174113fdf03447532f373e1c6c57c08d61d9e4e9be5e244b05e'
		'f60ae61cfbd5da1d849d0beaa21f593c38dac9359f0b3ddc612f447408265b24'
		'db426394965c48c1d29023e1cc6d965ea6b9a9035d8a849be2750ca4659a3d07'
		'772e4d550e07826665ed0528c071dd5404ef7dbe1825a38c8adbc2a00bca948f'
		'4e1d15d12dbd3e9208111d6b806ad5a9857ca8850c47877d36575b904559260b'
		'ecdd4f8473ab0dee5d3acb5c0a31a4c1dd6aa12179895cf1903dd0f455c43a4f'
		'936162c0312886c21581002b79932829aa048cfaf9937c6265aeaa14f1cd1775'
		'2d29fd04a0d0ba29dae6bd29fb418944c08d3916665dcca74afb297ef37584b6'
		'4e48ea0d83dd9441cc1af04ab18cd6c961b9fa54d5cbf2c2feee038988dea459'
	)
fi

noextract=(
	"ipxe-git-${_git_tag_ipxe}.tar.gz"
)

if [ "$_build_stubdom" = true ] ; then
	noextract+=(
		"zlib-${_zlib_version}.tar.gz"
		"pciutils-${_libci_version}.tar.bz2"
		"newlib-${_newlib_version}.tar.gz"
		"lwip-${_lwip_version}.tar.gz"
		"grub-${_grub_version}.tar.gz"
		"ocaml-${_ocaml_version}.tar.gz"
		"gmp-${_gmp_version}.tar.bz2"
		"polarssl-${_polarssl_version}-gpl.tgz"
		"tpm_emulator-${_tpmemu_version}.tar.gz"
	)
fi

prepare() {
	cd "${srcdir}/${pkgbase}-${pkgver}"

	msg2 'Copying downloaded files...'
	cp "${srcdir}/ipxe-git-${_git_tag_ipxe}.tar.gz" tools/firmware/etherboot/ipxe.tar.gz

	# XSA Patches
	msg2 'Applying XSA Patches...'
	patch -Np1 -i "${srcdir}/xsa253-xsa254-diff-release410-comet1.1.patch"
	patch -Np1 -i "${srcdir}/xsa255-1.patch"
	patch -Np1 -i "${srcdir}/xsa255-2.patch"
	patch -Np1 -i "${srcdir}/xsa256.patch"

	# XSA 253 and XSA 254 fix to keep version number.
	sed 's,1-pre,0,g' -i xen/Makefile

	# qemu-xen-traditional
	pushd 'tools/qemu-xen-traditional' >/dev/null
	# None yet. Example:
	#patch -Np1 -i "${srcdir}/xsa211-qemut.patch"
	popd >/dev/null >/dev/null
	# qemu-xen upstream
	pushd 'tools/qemu-xen' >/dev/null
	# None yet. Example:
	#patch -Np1 -i "${srcdir}/xsa211-qemuu-4.8.patch"
	popd >/dev/null

	# Patch EFI binary build with mingw
	msg2 'Patching EFI build...'
	sed -i.bak '/ EFI_LD/s/LD/LD_EFI/' xen/arch/x86/Makefile
	sed -i.bak 's/LD/LD_EFI/' xen/arch/x86/efi/Makefile
	sed -i.bak '/EFI_MOUNTPOINT .*/aLD_EFI ?= $(LD)' xen/Makefile

	# Fix Install Paths
	msg2 'Fixing installation paths...'
	sed -i 's:\$localstatedir/run/xen:/run/xen:' m4/paths.m4
	sed -i 's:/var/run:/run:' tools/ocaml/xenstored/define.ml
	sed -i 's:/var/run:/run:' tools/ocaml/xenstored/systemd_stubs.c

	if [ "${_build_stubdom}" = true ] ; then
		msg2 'Copying stubdom files...'
		# Copy supporting tarballs into place
		cp "${srcdir}/zlib-${_zlib_version}.tar.gz" stubdom/
		cp "${srcdir}/pciutils-${_libpci_version}.tar.bz2" stubdom/
		cp "${srcdir}/newlib-${_newlib_version}.tar.gz" stubdom/
		cp "${srcdir}/lwip-${_lwip_version}.tar.gz" stubdom/
		cp "${srcdir}/grub-${_grub_version}.tar.gz" stubdom/
		cp "${srcdir}/ocaml-${_ocaml_version}.tar.gz" stubdom/
		cp "${srcdir}/gmp-${_gmp_version}.tar.bz2" stubdom/
		cp "${srcdir}/polarssl-${_polarssl_version}-gpl.tgz" stubdom/
		cp "${srcdir}/tpm_emulator-${_tpmemu_version}.tar.gz" stubdom/
	fi

	# Patch out Werror
	msg2 'Patching out Werror...'
	# Copied from Gentoo's xen 4.8.1-r2 ebuild
	find . \( -name 'Makefile*' -o -name '*.mk' -o -name 'common.make' \) -exec sed -i 's/ *-Werror */ /' '{}' ';'
	sed -i 's/, "-Werror"//' 'tools/python/setup.py'

	# Patch ocaml for 4.06 unsafe string
	patch -Np1 -i "${srcdir}/ocaml-unsafe-string.patch"
}

build() {
	cd "${srcdir}/${pkgbase}-${pkgver}"
	export LD_EFI='/usr/x86_64-w64-mingw32/bin/ld'
	if [ "${_build_stubdom}" = true ] ; then
		local _config_stubdom='--enable-stubdom'
	fi

	msg2 'Configuring...'
	./autogen.sh
	./configure \
		PYTHON=/usr/bin/python2 \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--with-sysconfig-leaf-dir=conf.d \
		--with-initddir=/etc/init.d \
		--enable-systemd \
		--enable-ovmf \
		--with-system-ovmf \
		--with-system-seabios=/usr/share/qemu/bios-256k.bin \
		"${_config_stubdom:---disable-stubdom}" \
		--with-extra-qemuu-configure-args=" \
			--disable-bluez \
			--disable-gtk \
			--disable-vte \
			--disable-werror \
			--disable-virglrenderer \
			--disable-libnfs \
			--disable-glusterfs \
			--disable-numa \
			--disable-smartcard \
			--disable-fdt \
			--disable-vde \
			--disable-brlapi \
			--enable-spice \
			--enable-usb-redir \
			--with-sdlabi=2.0"

	msg2 'Building Xen...'
	# NO_WERROR is required for iPXE, as the sources are not extracted before the build
	# and the Werror cannot be patched out
	make LANG=C PYTHON=python2 NO_WERROR=1 dist
}

package_xen() {
	depends=(
		bridge-utils
		curl
		gnutls
		iproute2
		lib32-glibc
		libaio
		libcap-ng
		libiscsi
		libnl
		libpng
		lzo
		pciutils
		python2
		sdl2
		spice
		usbredir
		yajl
	)
	optdepends=(
		'xen-docs: Official Xen Documentation'
		'openvswitch: Optional Networking support'
		'seabios: Boot VMs with BIOS'
		'ovmf: Boot VMs with UEFI'
	)
	backup=(
		etc/conf.d/xen{commons,domains}
		"etc/${pkgbase}/efi-xen.cfg"
		"etc/${pkgbase}/cpupool"
		"etc/${pkgbase}/grub.conf"
		"etc/${pkgbase}/oxenstored.conf"
		"etc/${pkgbase}/xl.conf"
	)
	install="${pkgbase}.install"
	conflicts=(xen-4.2{,-testing-hg} xen-{gdbsx,hg-unstable,rc,git,igvtg} xen-4.3{,-testing-hg} xen-4.{4..9})
	provides=("xen-${pkgver}")

	cd "${srcdir}/${pkgbase}-${pkgver}"

	msg2 'Installing Xen...'
	make DESTDIR="${pkgdir}" LANG=C PYTHON=python2 install

	cd "${pkgdir}"

	# Install files for Arch
	msg2 'Installing Arch-specific files...'
	install -Dm644 "${srcdir}/tmpfiles.conf" "usr/lib/tmpfiles.d/${pkgbase}.conf"
	install -Dm644 "${srcdir}/grub.conf" etc/xen/grub.conf
	install -Dm755 "${srcdir}/grub-mkconfig-helper" etc/grub.d/09_xen
	install -Dm644 "${srcdir}/efi-xen.cfg" etc/xen/efi-xen.cfg
	install -Dm644 "${srcdir}/xen.conf" usr/lib/modules-load.d/xen.conf

	# Fix paths in scripts, move to right locations and create missing directories
	msg2 'Fixing paths...'
	sed -i 's:/var/run:/run:' usr/lib/xen/bin/xenpvnetboot
	sed -i 's:/var/run:/run:' usr/lib/xen/bin/pygrub
	sed -i 's:/var/run:/run:' usr/bin/xenmon.py

	mkdir -p var/log/xen/console

	# Sanitize library path (if lib64 exists)
	if [ -d usr/lib64 ]; then
		msg2 'Sanatizing library paths...'
		cd usr/
		mv lib64/* lib/
		rmdir lib64
		cd ../
	fi

	# If EFI binaries build, move to /boot
	if [ -f usr/lib/efi/xen.efi ]; then
		msg2 'Moving efi binary...'
		mv usr/lib/efi/xen*.efi "boot/"
		rm -rf usr/lib/efi
	fi

	# Clean up
	msg2 'Cleaning up...'

	# Hypervisor symlinks
	rm -f boot/xen{,-${_xen_major_version}{,.${_xen_minor_version}}}.{gz,efi}

	# sysvinit files
	rm -r etc/init.d

	# Documentation cleanup ( see xen-docs package )
	rm -rf usr/share/doc
	rm -rf usr/share/man

	# Temporary directories
	rmdir var/run/xen var/run/xenstored var/run

	# Unnecessary qemu support files
	rm usr/share/qemu-xen/qemu/{palcode,openbios}-*
	rm usr/share/xen/qemu/openbios-*

	# adhere to Static Library Packaging Guidelines
	rm -f usr/lib/*.a
}

package_xen-docs() {
	pkgdesc='Virtual Machine Hypervisor documentation'
	arch=('any')
	conflicts=(xen-docs-4.2{,-testing-hg} xen-docs-{gdbsx,hg-unstable,rc,git,igvtg} xen-docs-4.3{,-testing-hg} xen-docs-4.{4..8})
	provides=("xen-docs-${pkgver}")

	cd "${srcdir}/${pkgbase}-${pkgver}"

	msg2 'Installing documentation...'
	make DESTDIR="${pkgdir}" LANG=C PYTHON=python2 install-docs
}
