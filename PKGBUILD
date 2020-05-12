# Maintainer: Diab Neiroukh <officiallazerl0rd@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgbase="linux-zest-git"
pkgname=(
	"linux-zest-git"
    "linux-zest-git-docs"
	"linux-zest-git-headers"
)
pkgver=1
pkgrel=2
epoch=6
arch=(
    "i686"
	"x86_64"
)
url="https://github.com/ZestProjects/linux"
license=(
	"GPL2"
)
makedepends=(
	"bc"
	"cpio"
	"graphviz"
	"imagemagick"
	"inetutils"
	"kmod"
	"libelf"
	"python-sphinx"
	"python-sphinx_rtd_theme"
	"xmlto"
)
options=(
	"!strip"
)
source=(
	"https://github.com/ZestProjects/linux/archive/fivesix.tar.gz"
)
b2sums=(
	"SKIP"
)

prepare()
{
	export LC_ALL=en_US.UTF-8
	export PATH="/opt/proton-clang/bin:$PATH"

	cd "linux-fivesix" || exit

	echo "Setting config..."
	make AR="llvm-ar" CC="clang" HOSTAR="llvm-ar" HOSTCC="clang" HOSTCXX="clang++" HOSTLD="ld.lld" HOSTLDFLAGS="-fuse-ld=lld" LD="ld.lld" NM="llvm-nm" OBJCOPY="llvm-objcopy" OBJDUMP="llvm-objdump" OBJSIZE="llvm-size" STRIP="llvm-strip" zestop_defconfig

	#* Load only needed modules from modprobed-db
	if [ -f "$HOME/.config/modprobed.db" ]; then
		echo "Setting only needed modules to build..."
		make AR="llvm-ar" CC="clang" HOSTAR="llvm-ar" HOSTCC="clang" HOSTCXX="clang++" HOSTLD="ld.lld" HOSTLDFLAGS="-fuse-ld=lld" LD="ld.lld" NM="llvm-nm" OBJCOPY="llvm-objcopy" OBJDUMP="llvm-objdump" OBJSIZE="llvm-size" STRIP="llvm-strip" LSMOD="$HOME/.config/modprobed.db" localmodconfig
	fi

	make AR="llvm-ar" CC="clang" HOSTAR="llvm-ar" HOSTCC="clang" HOSTCXX="clang++" HOSTLD="ld.lld" HOSTLDFLAGS="-fuse-ld=lld" LD="ld.lld" NM="llvm-nm" OBJCOPY="llvm-objcopy" OBJDUMP="llvm-objdump" OBJSIZE="llvm-size" STRIP="llvm-strip" -s kernelrelease > version
	echo "Prepared $pkgbase version $(<version)..."
}

build()
{
	export LC_ALL=en_US.UTF-8
	export PATH="/opt/proton-clang/bin:$PATH"

	cd "linux-fivesix" || exit

	make AR="llvm-ar" CC="clang" HOSTAR="llvm-ar" HOSTCC="clang" HOSTCXX="clang++" HOSTLD="ld.lld" HOSTLDFLAGS="-fuse-ld=lld" LD="ld.lld" NM="llvm-nm" OBJCOPY="llvm-objcopy" OBJDUMP="llvm-objdump" OBJSIZE="llvm-size" STRIP="llvm-strip" all
	make AR="llvm-ar" CC="clang" HOSTAR="llvm-ar" HOSTCC="clang" HOSTCXX="clang++" HOSTLD="ld.lld" HOSTLDFLAGS="-fuse-ld=lld" LD="ld.lld" NM="llvm-nm" OBJCOPY="llvm-objcopy" OBJDUMP="llvm-objdump" OBJSIZE="llvm-size" STRIP="llvm-strip" htmldocs
}

_package()
{
	pkgdesc="The Zest Project's kernel and it's modules"
	depends=(
		"coreutils"
		"initramfs"
		"kmod"
		"llvm-proton-bin"
	)
	optdepends=(
		"crda: to set the correct wireless channels of your country"
		"linux-firmware: firmware images needed for some devices"
	)
	provides=(
		"linux=5.6"
		"linux-aufs=5.6"
		"linux-fsync=5.6"
		"linux-zest=5.6"
		"VIRTUALBOX-GUEST-MODULES"
		"WIREGUARD-MODULE"
	)

	export LC_ALL=en_US.UTF-8
	export PATH="/opt/proton-clang/bin:$PATH"

	cd "linux-fivesix" || exit

	local kernver="$(<version)"
	local modulesdir="$pkgdir/usr/lib/modules/$kernver"

	#* systemd expects to find the kernel here to allow hibernation
	echo "Installing boot image..."
	install -Dm644 "$(make AR="llvm-ar" CC="clang" HOSTAR="llvm-ar" HOSTCC="clang" HOSTCXX="clang++" HOSTLD="ld.lld" HOSTLDFLAGS="-fuse-ld=lld" LD="ld.lld" NM="llvm-nm" OBJCOPY="llvm-objcopy" OBJDUMP="llvm-objdump" OBJSIZE="llvm-size" STRIP="llvm-strip" -s image_name)" "$modulesdir/vmlinuz"

	#* mkinitcpio uses this value as the kernel name
	echo "$pkgbase" | install -Dm644 "/dev/stdin" "$modulesdir/pkgbase"

	echo "Installing modules..."
	make AR="llvm-ar" CC="clang" HOSTAR="llvm-ar" HOSTCC="clang" HOSTCXX="clang++" HOSTLD="ld.lld" HOSTLDFLAGS="-fuse-ld=lld" LD="ld.lld" NM="llvm-nm" OBJCOPY="llvm-objcopy" OBJDUMP="llvm-objdump" OBJSIZE="llvm-size" STRIP="llvm-strip" INSTALL_MOD_PATH="$pkgdir/usr" modules_install

	rm "$modulesdir/"{"source","build"}
}

_package-headers()
{
	pkgdesc="Headers and scripts for building modules for the Zest Project's kernel"
	provides=(
		"linux-headers=5.6"
		"linux-aufs-headers=5.6"
		"linux-fsync-headers=5.6"
		"linux-zest-headers=5.6"
	)

	export LC_ALL=en_US.UTF-8

	cd "linux-fivesix" || exit

	local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

	echo "Installing build files..."
	install -Dt "$builddir" -m644 ".config" "Makefile" "Module.symvers" "System.map" "version" "vmlinux"

	#* Replace default tools in the headers Makefile with the ones we use
	sed -i "s/HOSTCC       = gcc/HOSTAR       = \/opt\/proton-clang\/bin\/llvm-ar\nHOSTCC       = \/opt\/proton-clang\/bin\/clang/g" "$builddir/Makefile"
	sed -i "s/HOSTCXX      = g++/HOSTCXX      = \/opt\/proton-clang\/bin\/clang++\nHOSTLD       = \/opt\/proton-clang\/bin\/ld.lld\nHOSTLDFLAGS  = -fuse-ld=lld/g" "$builddir/Makefile"
	sed -i "s/CC\t\t= \$(CROSS_COMPILE)gcc/CC\t\t= \/opt\/proton-clang\/bin\/clang/g" "$builddir/Makefile"
	sed -i "s/LD\t\t= \$(CROSS_COMPILE)ld/LD\t\t= \/opt\/proton-clang\/bin\/ld.lld/g" "$builddir/Makefile"
	sed -i "s/AR\t\t= \$(CROSS_COMPILE)ar/AR\t\t= \/opt\/proton-clang\/bin\/llvm-ar/g" "$builddir/Makefile"
	sed -i "s/NM\t\t= \$(CROSS_COMPILE)nm/NM\t\t= \/opt\/proton-clang\/bin\/llvm-nm/g" "$builddir/Makefile"
	sed -i "s/STRIP\t\t= \$(CROSS_COMPILE)strip/STRIP\t\t= \/opt\/proton-clang\/bin\/llvm-strip/g" "$builddir/Makefile"
	sed -i "s/OBJCOPY\t\t= \$(CROSS_COMPILE)objcopy/OBJCOPY\t\t= \/opt\/proton-clang\/bin\/llvm-objcopy/g" "$builddir/Makefile"
	sed -i "s/OBJDUMP\t\t= \$(CROSS_COMPILE)objdump/OBJDUMP\t\t= \/opt\/proton-clang\/bin\/llvm-objdump/g" "$builddir/Makefile"
	sed -i "s/OBJSIZE\t\t= \$(CROSS_COMPILE)size/OBJSIZE\t\t= \/opt\/proton-clang\/bin\/llvm-size/g" "$builddir/Makefile"

	install -Dt "$builddir/kernel" -m644 "kernel/Makefile"
	install -Dt "$builddir/arch/x86" -m644 "arch/x86/Makefile"
	cp -t "$builddir" -a "scripts"

	#* Add objtool for external module building and the enabled VALIDATION_STACK option
	install -Dt "$builddir/tools/objtool" "tools/objtool/objtool"

	#* Add xfs and shmem for building filesystem modules
	mkdir -p "$builddir/"{"fs/xfs","mm"}

	echo "Installing headers..."
	cp -t "$builddir" -a "include"
	cp -t "$builddir/arch/x86" -a "arch/x86/include"
	install -Dt "$builddir/arch/x86/kernel" -m644 "arch/x86/kernel/asm-offsets.s"

	install -Dt "$builddir/drivers/md" -m644 "drivers/md/"*".h"
	install -Dt "$builddir/net/mac80211" -m644 "net/mac80211/"*".h"

	#! http://bugs.archlinux.org/task/13146
	install -Dt "$builddir/drivers/media/i2c" -m644 "drivers/media/i2c/msp3400-driver.h"

	#! http://bugs.archlinux.org/task/20402
	install -Dt "$builddir/drivers/media/usb/dvb-usb" -m644 "drivers/media/usb/dvb-usb/"*".h"
	install -Dt "$builddir/drivers/media/dvb-frontends" -m644 "drivers/media/dvb-frontends/"*".h"
	install -Dt "$builddir/drivers/media/tuners" -m644 "drivers/media/tuners/"*".h"

	echo "Installing Kconfig files..."
	find . -name 'Kconfig*' -exec install -Dm644 {} "$builddir/{}" \;

	echo "Removing unneeded architectures..."
	local arch
	for arch in "$builddir"/arch/*/; do
		[[ $arch = */x86/ ]] && continue
		echo "Removing $(basename "$arch")"
		rm -r "$arch"
	done

	echo "Removing documentation..."
	rm -r "$builddir/Documentation"

	echo "Removing broken symlinks..."
	find -L "$builddir" -type l -printf 'Removing %P\n' -delete

	echo "Removing loose objects..."
	find "$builddir" -type f -name '*.o' -printf 'Removing %P\n' -delete

	echo "Stripping build tools..."
	local file
	while read -rd '' file; do
		case "$(file -bi "$file")" in
			application/x-sharedlib\;*)
				strip -v $STRIP_SHARED "$file" ;;
			application/x-archive\;*)
				strip -v $STRIP_STATIC "$file" ;;
			application/x-executable\;*)
				strip -v $STRIP_BINARIES "$file" ;;
			application/x-pie-executable\;*)
				strip -v $STRIP_SHARED "$file" ;;
		esac
	done < <(find "$builddir" -type f -perm -u+x ! -name vmlinux -print0)

	echo "Adding symlink..."
	mkdir -p "$pkgdir/usr/src"
	ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"
}

_package-docs()
{
	pkgdesc="Documentation for the Zest Project's kernel"
	provides=(
		"linux-docs=5.6"
		"linux-aufs-docs=5.6"
		"linux-fsync-docs=5.6"
		"linux-zest-docs=5.6"
	)

	export LC_ALL=en_US.UTF-8

	cd "linux-fivesix" || exit

	local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

	echo "Installing documentation..."
	local src dst
	while read -rd '' src; do
		dst="${src#Documentation/}"
		dst="$builddir/Documentation/${dst#output/}"
		install -Dm644 "$src" "$dst"
	done < <(find Documentation -name '.*' -prune -o ! -type d -print0)

	echo "Adding symlink..."
	mkdir -p "$pkgdir/usr/share/doc"
	ln -sr "$builddir/Documentation" "$pkgdir/usr/share/doc/$pkgbase"
}

for _p in "${pkgname[@]}"; do
	eval "package_$_p() {
		$(declare -f "_package${_p#$pkgbase}")
		_package${_p#$pkgbase}
	}"
done
