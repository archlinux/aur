# Maintainer: Diab Neiroukh <officiallazerl0rd@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgbase="linux-zest-git"
pkgname=(
	"linux-zest-git"
    "linux-zest-git-docs"
	"linux-zest-git-headers"
)
pkgver=5.6
pkgrel=1
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
	"llvm-proton-bin"
	"python-sphinx"
	"python-sphinx_rtd_theme"
	"xmlto"
)
options=(
	"!strip"
)
source=(
	"git+$url.git"
)
b2sums=(
	"SKIP"
)

prepare()
{
	export PATH="/opt/proton-clang/bin:$PATH"

	cd "linux" || exit

	echo "Setting config..."
	make CC=clang LD=ld.lld NM=llvm-nm OBJCOPY=llvm-objcopy HOSTCC=clang HOSTLD=ld.lld zestop_defconfig

	make CC=clang LD=ld.lld NM=llvm-nm OBJCOPY=llvm-objcopy HOSTCC=clang HOSTLD=ld.lld -s kernelrelease > version
	echo "Prepared $pkgbase version $(<version)"
}

build()
{
	export PATH="/opt/proton-clang/bin:$PATH"

	cd "linux" || exit

	make CC=clang LD=ld.lld NM=llvm-nm OBJCOPY=llvm-objcopy HOSTCC=clang HOSTLD=ld.lld all
	make CC=clang LD=ld.lld NM=llvm-nm OBJCOPY=llvm-objcopy HOSTCC=clang HOSTLD=ld.lld htmldocs
}

_package()
{
	pkgdesc="The Zest Project's kernel and it's modules"
	depends=(
		"coreutils"
		"initramfs"
		"kmod"
	)
	optdepends=(
		"crda: to set the correct wireless channels of your country"
		"linux-firmware: firmware images needed for some devices"
	)
	provides=(
		"WIREGUARD-MODULE"
	)

	export PATH="/opt/proton-clang/bin:$PATH"

	cd "linux" || exit

	local kernver="$(<version)"
	local modulesdir="$pkgdir/usr/lib/modules/$kernver"

	#* systemd expects to find the kernel here to allow hibernation
	echo "Installing boot image..."
	install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

	#* mkinitcpio uses this value as the kernel name
	echo "$pkgbase" | install -Dm644 "/dev/stdin" "$modulesdir/pkgbase"

	echo "Installing modules..."
	make CC=clang LD=ld.lld NM=llvm-nm OBJCOPY=llvm-objcopy HOSTCC=clang HOSTLD=ld.lld INSTALL_MOD_PATH="$pkgdir/usr" modules_install

	rm "$modulesdir"/{source,build}
}

_package-headers()
{
	pkgdesc="Headers and scripts for building modules for the Zest Project's kernel"

	cd "linux" || exit

	local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

	echo "Installing build files..."
	install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map localversion.* version vmlinux
	install -Dt "$builddir/kernel" -m644 kernel/Makefile
	install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
	cp -t "$builddir" -a scripts

	#* Add objtool for external module building and the enabled VALIDATION_STACK option
	install -Dt "$builddir/tools/objtool" tools/objtool/objtool

	#* Add xfs and shmem for building filesystem modules
	mkdir -p "$builddir"/{fs/xfs,mm}

	echo "Installing headers..."
	cp -t "$builddir" -a include
	cp -t "$builddir/arch/x86" -a arch/x86/include
	install -Dt "$builddir/arch/x86/kernel" -m644 arch/x86/kernel/asm-offsets.s

	install -Dt "$builddir/drivers/md" -m644 drivers/md/*.h
	install -Dt "$builddir/net/mac80211" -m644 net/mac80211/*.h

	#! http://bugs.archlinux.org/task/13146
	install -Dt "$builddir/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

	#! http://bugs.archlinux.org/task/20402
	install -Dt "$builddir/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
	install -Dt "$builddir/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
	install -Dt "$builddir/drivers/media/tuners" -m644 drivers/media/tuners/*.h

	echo "Installing KConfig files..."
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
			application/x-sharedlib\;*)      # Libraries (.so)
				strip -v $STRIP_SHARED "$file" ;;
			application/x-archive\;*)        # Libraries (.a)
				strip -v $STRIP_STATIC "$file" ;;
			application/x-executable\;*)     # Binaries
				strip -v $STRIP_BINARIES "$file" ;;
			application/x-pie-executable\;*) # Relocatable binaries
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

	cd "linux" || exit

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
