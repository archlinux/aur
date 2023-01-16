# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=ipxe-git
pkgver=1.21.1.r342.g2dcef4b7
pkgrel=1
pkgdesc='iPXE open source boot firmware - git checkout'
arch=('any')
url='http://www.ipxe.org/'
license=('GPL')
depends=('bash')
makedepends=('git' 'libisoburn' 'mtools' 'syslinux' 'xz')
provides=('ipxe')
conflicts=('ipxe')
install=ipxe.install
source=('git+https://github.com/ipxe/ipxe.git'
	'ipxe-0002-banner.patch::https://github.com/eworm-de/ipxe/commit/ef70ba7ba6b1bad9d873dfa48458fe16269fe48b.patch'
	'ipxe-0003-efi-iso.patch::https://github.com/eworm-de/ipxe/commit/1bb5900a8aa64ae332dcd49a7ce82e43063b0244.patch'
	'grub'
	'chain-default.ipxe'
	'chain-default-3928.ipxe')
sha256sums=('SKIP'
            '526d1215290b70cfc8fd3ecc3db92bdc04c94c9e246394de8b102089c17b584d'
            '380e25716b197f8cb1621be0ba15f6f8884c0956690d03fa8945180b3bf241a6'
            'ead8e9b386206bc0e95838a6e074c218e038cd3fa1ca5cff2b73e34b40d5552f'
            'f7ec78e26671f4df90d89440d8b2a69473c15cb6b25dda32c773023378fec42a'
            'e26a54b4e99816b34baebcb7a15d99d57c9395c9689ffbae2329cc675248f9b9')

pkgver() {
	cd ipxe/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		printf '%s.r%s.g%s' \
			"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
			"$(git rev-list --count ${GITTAG}..)" \
			"$(git rev-parse --short HEAD)"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git rev-parse --short HEAD)"
	fi
}

prepare() {
	cd ipxe/src/

	# ArchLinux branding
	patch -Np2 < "${srcdir}/ipxe-0002-banner.patch"

	# change menu colors
	sed -i "/COLOR_[A-Z]*_BG/s/COLOR_BLUE/COLOR_BLACK/" config/colour.h

	# enable neighbour command
	sed -i "/NEIGHBOUR_CMD/c #define NEIGHBOUR_CMD" config/general.h

	# enable ping command
	sed -i "/PING_CMD/c #define PING_CMD" config/general.h

	# enable HTTPS
	sed -i "/DOWNLOAD_PROTO_HTTPS/c #define DOWNLOAD_PROTO_HTTPS" config/general.h

	# enable reboot and poweroff
	sed -i -e "/REBOOT_CMD/c #define REBOOT_CMD" \
		-e "/POWEROFF_CMD/c #define POWEROFF_CMD" config/general.h

	# disable WEP, WPA and WPA2
	sed -i -e "/CRYPTO_80211_/s/^#define/#undef/" \
		-e "/IWMGMT_CMD/c #undef IWMGMT_CMD" config/general.h
}

build() {
	cd ipxe/src/

	# default targets (ipxe.{lkrn,dsk,iso,usb}, undionly.kpxe)
	make \
		NO_WERROR=1 \
		all

	# this includes drivers, but is bigger
	# build targets with embedded scripts first and rename
	make \
		NO_WERROR=1 \
		EMBED=${srcdir}/chain-default.ipxe \
		bin/ipxe.pxe
	mv bin/ipxe.pxe bin/ipxe-default.pxe

	make \
		NO_WERROR=1 \
		EMBED=${srcdir}/chain-default-3928.ipxe \
		bin/ipxe.pxe
	mv bin/ipxe.pxe bin/ipxe-default-3928.pxe

	make \
		NO_WERROR=1 \
		bin/ipxe.pxe

	# EFI
	make \
		NO_WERROR=1 \
		bin-i386-efi/ipxe.efi \
		bin-x86_64-efi/ipxe.efi

	# hybrid image
	./util/genfsimg \
		-o bin/ipxe-hybrid.iso \
		bin-x86_64-efi/ipxe.efi \
		bin-i386-efi/ipxe.efi \
		bin/ipxe.lkrn
}

package() {
	cd ipxe/

	install -D -m0755 ${srcdir}/grub ${pkgdir}/etc/grub.d/35_ipxe

	install -D -m0644 COPYING ${pkgdir}/usr/share/licenses/ipxe/COPYING
	install -D -m0644 COPYING.GPLv2 ${pkgdir}/usr/share/licenses/ipxe/COPYING.GPLv2
	install -D -m0644 COPYING.UBDL ${pkgdir}/usr/share/licenses/ipxe/COPYING.UBDL

	cd src/

	# iPXE kernel bzImage
	install -D -m0644 bin/ipxe.lkrn ${pkgdir}/usr/lib/ipxe/ipxe.lkrn

	# default targets, legacy and EFI ISO
	install -D -m0644 bin/ipxe.dsk ${pkgdir}/usr/share/ipxe/ipxe.dsk
	install -D -m0644 bin/ipxe.usb ${pkgdir}/usr/share/ipxe/ipxe.usb
	install -D -m0644 bin/ipxe.iso ${pkgdir}/usr/share/ipxe/ipxe.iso
	install -D -m0644 bin/ipxe-hybrid.iso ${pkgdir}/usr/share/ipxe/ipxe-hybrid.iso

	# iPXE UNDI-only targets
	install -D -m0644 bin/undionly.kpxe ${pkgdir}/usr/lib/ipxe/undi.kpxe

	# iPXE targets with full driver support
	install -D -m0644 bin/ipxe.pxe ${pkgdir}/usr/lib/ipxe/ipxe.pxe
	install -D -m0644 bin/ipxe-default.pxe ${pkgdir}/usr/lib/ipxe/ipxe-default.pxe
	install -D -m0644 bin/ipxe-default-3928.pxe ${pkgdir}/usr/lib/ipxe/ipxe-default-3928.pxe

	# iPXE EFI targets
	install -D -m0644 bin-i386-efi/ipxe.efi ${pkgdir}/usr/lib/ipxe/efi-i386.efi
	install -D -m0644 bin-x86_64-efi/ipxe.efi ${pkgdir}/usr/lib/ipxe/efi-x86_64.efi
}
