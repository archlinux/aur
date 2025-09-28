#shellcheck shell=bash
# Maintainer: shadichy <shadichy@blisslabs.org>

### BUILD OPTIONS
# Set these variables to ANYTHING that is not null or choose proper variable to enable them

# Kernel branch
: "${_default_branch:=6.15}"
: "${_branch:=6.15}"

# Build a debug package with non-stripped vmlinux
: "${_build_debug:=no}"

### LLVM
TARGET_CLANG_PATH=/opt/android/clang/bin
export \
	LLVM=1 \
	CC=${TARGET_CLANG_PATH}/clang \
	LD=${TARGET_CLANG_PATH}/ld.lld \
	AR=${TARGET_CLANG_PATH}/llvm-ar \
	NM=${TARGET_CLANG_PATH}/llvm-nm \
	OBJCOPY=${TARGET_CLANG_PATH}/llvm-objcopy \
	OBJDUMP=${TARGET_CLANG_PATH}/llvm-objdump \
	READELF=${TARGET_CLANG_PATH}/llvm-readelf \
	OBJSIZE=${TARGET_CLANG_PATH}/llvm-size \
	STRIP=${TARGET_CLANG_PATH}/llvm-strip \
	HOSTCC=${TARGET_CLANG_PATH}/clang \
	HOSTCXX=${TARGET_CLANG_PATH}/clang++ \
	HOSTLD=${TARGET_CLANG_PATH}/ld.lld \
	HOSTLDFLAGS=-fuse-ld=lld \
	HOSTAR=${TARGET_CLANG_PATH}/llvm-ar

### Toolchain
export \
	M4="$(realpath "$(command -v m4)")" \
	BISON="$(realpath "$(command -v bison)")" \
	LEX="$(realpath "$(command -v lex)")" \
	DEPMOD="$(realpath "$(command -v depmod)")" \
	PERL="$(realpath "$(command -v perl)")"

if [ "$_default_branch" != "$_branch" ]; then
	_pkgsuffix=-$_branch
fi

_kernel_name=zenith
pkgbase=linux-$_kernel_name
_pkgname="${pkgbase}${_pkgsuffix}-git"

_ver=${_branch%-*}
_ver=${_branch%_*}
pkgver=6.15.11
pkgdesc="Android™ Generic Project's Zenith linux kernel - ${_branch} branch"
pkgrel=1
_kernver="$pkgver-$pkgrel"
_kernuname="${pkgbase}-${_pkgsuffix}"
arch=('x86' 'x86_64')
url="https://github.com/android-generic/kernel-${_kernel_name}.git"
license=('GPL-2.0-only')
options=('!strip' '!debug' '!lto')
makedepends=(
	bc
	clang-android
	cpio
	gettext
	git
	libelf
	lld
	llvm
	pahole
	perl
	python
	rust
	rust-bindgen
	rust-src
	tar
	xz
	zstd
)

source=(
	"${pkgbase}::git+${url}#branch=${_branch}&depth=1&single-branch=${_branch}"
	"https://raw.githubusercontent.com/BlissOS/device_generic_common/refs/heads/voyager-x86/selinux_diffconfig" # Curently taking selinux_diffconfig from voyager-x86
	"nftables_diffconfig"
)

sha256sums=(
	'SKIP'
	'SKIP'
	'139ef50f80f0903cdf4fa7696716f4b302fa70e56a6bc90744897942163223af'
)

export KBUILD_BUILD_HOST=blisslabs
export KBUILD_BUILD_USER="$pkgbase"

export BUILD_FLAGS=(
	ARCH="$CARCH"
	LLVM=1
	CC="$CC"
	LD="$LD"
	AR="$AR"
	NM="$NM"
	OBJCOPY="$OBJCOPY"
	OBJDUMP="$OBJDUMP"
	READELF="$READELF"
	OBJSIZE="$OBJSIZE"
	STRIP="$STRIP"
	HOSTCC="$HOSTCC"
	HOSTCXX="$HOSTCXX"
	HOSTLD="$HOSTLD"
	HOSTLDFLAGS="$HOSTLDFLAGS"
	HOSTAR="$HOSTAR"
	CROSS_COMPILE="$CROSS_COMPILE"
	YACC="$BISON"
	LEX="$LEX"
	M4="$M4"
	DEPMOD="$DEPMOD"
	PERL="$PERL"
	KBUILD_BUILD_HOST="$KBUILD_BUILD_HOST"
	KBUILD_BUILD_USER="$KBUILD_BUILD_USER"
	KBUILD_BUILD_TIMESTAMP="$KBUILD_BUILD_TIMESTAMP"
)

export KERNEL_TARGET=bzImage
export KERNEL_CONFIG_DIR=arch/x86/configs
export TARGET_KERNEL_CONFIG=android-${CARCH}_defconfig

KBUILD_OUTPUT="out"
KBUILD_JOBS=$(nproc)
export MAKE_CMD=(
	make
	-j"$KBUILD_JOBS"
	-l"$((KBUILD_JOBS + 2))"
	-C .
	O="$KBUILD_OUTPUT"
	"${BUILD_FLAGS[@]}"
)

_die() {
	error "$@"
	exit 1
}

pkgver() {
	cd "${srcdir}/${pkgbase}"

	# get VERSION, PATCHLEVEL and SUBLEVEL from makefile
	local ver pat sub
	read -r ver pat sub < <(head -6 Makefile | sed -nE 's/^(VERSION|PATCHLEVEL|SUBLEVEL) = ([0-9]+)$/\2/p' | xargs)

	printf '%s.%s.%s' "$ver" "$pat" "$sub"
}

prepare() {
	SELINUX_DIFFCONFIG=$(realpath "${srcdir}/selinux_diffconfig")
	NFTABLES_DIFFCONFIG=$(realpath "${srcdir}/nftables_diffconfig")
	KCONFIG="${KERNEL_CONFIG_DIR}/${TARGET_KERNEL_CONFIG}"

	cd "${srcdir}/${pkgbase}"

	git submodule update --init --recursive ||
		_die "Failed to update git submodules"

	mkdir -p "$KBUILD_OUTPUT"

	# Merge defconfig and diffconfigs
	./scripts/kconfig/merge_config.sh -m "$KCONFIG" \
		"$SELINUX_DIFFCONFIG" \
		"$NFTABLES_DIFFCONFIG" ||
		_die "Failed to merge config files"

	mv .config "$KBUILD_OUTPUT"/.config

	### Prepared version
	"${MAKE_CMD[@]}" -s kernelrelease >"$KBUILD_OUTPUT/version"
	echo "Prepared $pkgbase version $(<"$KBUILD_OUTPUT/version")"

	echo "Setting version..."
	echo "" >"$KBUILD_OUTPUT/localversion.10-pkgrel"
	echo "" >"$KBUILD_OUTPUT/localversion.20-pkgname"

	"${MAKE_CMD[@]}" olddefconfig
}

_sign_modules() {
	msg2 "Signing modules in $1"
	local sign_script="${srcdir}/${pkgbase}/scripts/sign-file"
	local sign_key="$(grep -Po 'CONFIG_MODULE_SIG_KEY="\K[^"]*' "${srcdir}/${pkgbase}/.config")"
	if [[ ! "$sign_key" =~ ^/ ]]; then
		sign_key="${srcdir}/${pkgbase}/${sign_key}"
	fi
	local sign_cert="${srcdir}/${pkgbase}/certs/signing_key.x509"
	local hash_algo="$(grep -Po 'CONFIG_MODULE_SIG_HASH="\K[^"]*' "${srcdir}/${pkgbase}/.config")"

	find "$1" -type f -name '*.ko' -print -exec \
		"${sign_script}" "${hash_algo}" "${sign_key}" "${sign_cert}" '{}' \;
}

build() {
	cd "${srcdir}/${pkgbase}"

	"${MAKE_CMD[@]}" $KERNEL_TARGET modules
}

_package() {
	pkgdesc="The $pkgdesc kernel and modules"
	depends=('coreutils' 'kmod' 'initramfs')
	optdepends=('wireless-regdb: to set the correct wireless channels of your country'
		'linux-firmware: firmware images needed for some devices'
		'modprobed-db: Keeps track of EVERY kernel module that has ever been probed - useful for those of us who make localmodconfig'
		'scx-scheds: to use sched-ext schedulers')
	provides=(VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE KSMBD-MODULE V4L2LOOPBACK-MODULE NTSYNC-MODULE VHBA-MODULE ADIOS-MODULE)

	cd "${srcdir}/${pkgbase}"
	local modulesdir="$pkgdir/usr/lib/modules/$(<"$KBUILD_OUTPUT/version")"

	echo "Installing boot image..."
	# systemd expects to find the kernel here to allow hibernation
	# https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
	install -Dm644 "${KBUILD_OUTPUT}/arch/$CARCH/boot/$KERNEL_TARGET" "$modulesdir/vmlinuz"

	# Used by mkinitcpio to name the kernel
	echo "$_pkgname" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

	echo "Installing modules..."
	ZSTD_CLEVEL=19 "${MAKE_CMD[@]}" INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 \
		DEPMOD=/bin/true modules_install # Suppress depmod

	# remove build links
	rm "$modulesdir"/build || :
}

_package-headers() {
	pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
	depends=('pahole' "${_pkgname}")

	cd "${srcdir}/${pkgbase}"
	local builddir="$pkgdir/usr/lib/modules/$(<"$KBUILD_OUTPUT/version")/build"

	echo "Installing build files..."

	cd "$KBUILD_OUTPUT"
	install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
		localversion.* version vmlinux # tools/bpf/bpftool/vmlinux.h

	cd "${srcdir}/${pkgbase}"
	install -Dt "$builddir/kernel" -m644 tools/perf/util/bpf_skel/vmlinux/vmlinux.h
	install -Dt "$builddir/kernel" -m644 kernel/Makefile
	install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
	cp -t "$builddir" -a scripts
	ln -srt "$builddir" "$builddir/scripts/gdb/vmlinux-gdb.py"

	# required when STACK_VALIDATION is enabled
	cd "$KBUILD_OUTPUT"
	install -Dt "$builddir/tools/objtool" tools/objtool/objtool

	# required when DEBUG_INFO_BTF_MODULES is enabled
	cd "${srcdir}/${pkgbase}"
	if [ -f tools/bpf/resolve_btfids/resolve_btfids ]; then
		install -Dt "$builddir/tools/bpf/resolve_btfids" tools/bpf/resolve_btfids/resolve_btfids
	fi

	echo "Installing headers..."
	cp -t "$builddir" -a include
	cp -t "$builddir/arch/x86" -a arch/x86/include

	cd "$KBUILD_OUTPUT"
	install -Dt "$builddir/arch/x86/kernel" -m644 arch/x86/kernel/asm-offsets.s

	cd "${srcdir}/${pkgbase}"
	install -Dt "$builddir/drivers/md" -m644 drivers/md/*.h
	install -Dt "$builddir/net/mac80211" -m644 net/mac80211/*.h

	# https://bugs.archlinux.org/task/13146
	install -Dt "$builddir/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

	# https://bugs.archlinux.org/task/20402
	install -Dt "$builddir/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
	install -Dt "$builddir/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
	install -Dt "$builddir/drivers/media/tuners" -m644 drivers/media/tuners/*.h

	# https://bugs.archlinux.org/task/71392
	install -Dt "$builddir/drivers/iio/common/hid-sensors" -m644 drivers/iio/common/hid-sensors/*.h

	# KernelSU headers
	install -Dt "$builddir/drivers/kernelsu" -m644 drivers/kernelsu/*.h

	echo "Installing KConfig files..."
	find . -name 'Kconfig*' -exec install -Dm644 {} "$builddir/{}" \;

	# Install .rmeta files if they exist
	if compgen -G "rust/*.rmeta" 1>/dev/null; then
		install -Dt "$builddir/rust" -m644 rust/*.rmeta
	fi

	# Install .so files if they exist
	if compgen -G "rust/*.so" 1>/dev/null; then
		install -Dt "$builddir/rust" rust/*.so
	fi

	echo "Installing unstripped VDSO..."
	"${MAKE_CMD[@]}" INSTALL_MOD_PATH="$pkgdir/usr" vdso_install \
		link= # Suppress build-id symlinks

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
		case "$(file -Sib "$file")" in
		application/x-sharedlib\;*) # Libraries (.so)
			strip -v $STRIP_SHARED "$file" ;;
		application/x-archive\;*) # Libraries (.a)
			strip -v $STRIP_STATIC "$file" ;;
		application/x-executable\;*) # Binaries
			strip -v $STRIP_BINARIES "$file" ;;
		application/x-pie-executable\;*) # Relocatable binaries
			strip -v $STRIP_SHARED "$file" ;;
		esac
	done < <(find "$builddir" -type f -perm -u+x ! -name vmlinux -print0)

	echo "Stripping vmlinux..."
	strip -v $STRIP_STATIC "$builddir/vmlinux"

	echo "Adding symlink..."
	mkdir -p "$pkgdir/usr/src"
	ln -sr "$builddir" "$pkgdir/usr/src/$_pkgname"
}

_package-dbg() {
	pkgdesc="Non-stripped vmlinux file for the $pkgdesc kernel"
	depends=("${_pkgname}-headers")

	cd "${srcdir}/${pkgbase}"
	mkdir -p "$pkgdir/usr/src/debug/${_pkgname}"
	install -Dt "$pkgdir/usr/src/debug/${_pkgname}" -m644 vmlinux
}

pkgname=("$_pkgname")
[ "$_build_debug" = "yes" ] && pkgname+=("$_pkgname-dbg")
pkgname+=("$_pkgname-headers")
for _p in "${pkgname[@]}"; do
	eval "package_$_p() {
    $(declare -f "_package${_p#$_pkgname}")
    _package${_p#$_pkgname}
    }"
done
