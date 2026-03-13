#shellcheck shell=bash
# Maintainer: shadichy <shadichy@blisslabs.org>

### BUILD OPTIONS
# Set these variables to ANYTHING that is not null or choose proper variable to enable them

# Kernel branch
: "${_default_branch:=6.18}"
: "${_BRANCH:=6.18}"

# Build a debug package with non-stripped vmlinux
: "${_build_debug:=no}"

# Use android defconfig
: "${_use_android_defconfig:=no}"

# Use sccache over ccache
: "${_use_sccache:=no}"

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
	HOSTAR=${TARGET_CLANG_PATH}/llvm-ar \
	LIBCLANG_PATH=$(realpath ${TARGET_CLANG_PATH}/../lib)

CCACHE=$(command -v ccache)
if [ "$CCACHE" ]; then
	export \
		CC="$CCACHE $CC"
fi

SCCACHE=$(command -v sccache)
if [ "$SCCACHE" ]; then
	if [ "$_use_sccache" = "yes" ] || [ ! "$CCACHE" ]; then
		export \
			CC="$SCCACHE $CC"
	fi
fi

### Toolchain
export \
	M4="$(realpath "$(command -v m4)")" \
	BISON="$(realpath "$(command -v bison)")" \
	LEX="$(realpath "$(command -v lex)")" \
	DEPMOD="$(realpath "$(command -v depmod)")" \
	PERL="$(realpath "$(command -v perl)")"

### Rust
if [ -d "/opt/android/rust" ]; then
	: "${RUST_BIN_DIR:=/opt/android/rust/bin}"
elif [ "$(command -v rustup)" ]; then
	: "${RUST_BIN_DIR:=~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin}"
else
	: "${RUST_BIN_DIR:=/usr/bin}"
fi

export \
	RUSTC=${RUST_BIN_DIR}/rustc \
	HOSTRUSTC=${RUST_BIN_DIR}/rustc \
	RUSTFMT=${RUST_BIN_DIR}/rustfmt \
	CLIPPY=${RUST_BIN_DIR}/clippy-driver

if [ "$SCCACHE" ]; then
	# Since we can only use rust with sccache
	export \
		RUSTC="$SCCACHE $RUSTC"
fi

OLD_PATH=$PATH
export PATH=$TARGET_CLANG_PATH:$RUST_BIN_DIR:$PATH

if [ "$_default_branch" != "$_BRANCH" ]; then
	_pkgsuffix=-$_BRANCH
fi

_kernel_name=zenith
pkgbase=linux-$_kernel_name
_pkgname="${pkgbase}${_pkgsuffix}-git"

_ver=${_BRANCH%-*}
_ver=${_BRANCH%_*}
pkgver=6.18.15
pkgdesc="Android™ Generic Project's Zenith linux kernel - ${_BRANCH} branch"
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
makeoptdepends=(
	rust-android-bin
	ccache
	sccache
)

# Using custom download agent to shallow clone the repo
cat <<'EOF' >DLAGENTS
#!/bin/sh

PWD=$(pwd)

ORIGIN=${1#shallowclone+}
ORG_URL=${ORIGIN%%'?'*}
ORG_ARGS=${ORIGIN#*'?'}

DEST=${2}
REAL_DEST=${DEST%.part}

### Parse url parameters

arg_parser() {
  local args=$1
  shift

  IFS='&'
  set -- ${args}
  unset IFS

  BRANCH=
  COMMIT=
  TAG=
  RECURSE_SUBMODULES=
  DEPTH=1

  while [ $# -gt 0 ]; do
    case $1 in
      branch=*) BRANCH=${1#branch=} ;;
      commit=*) COMMIT=${1#commit=} ;;
      tag=*) TAG=${1#tag=} ;;
      recurse=true) RECURSE_SUBMODULES=1 ;;
      depth=*) DEPTH=${1#depth=} ;;
      *) : ;;
    esac
    shift
  done

  export BRANCH COMMIT TAG RECURSE_SUBMODULES DEPTH
}

arg_parser "${ORG_ARGS}"

update_src() {
  git fetch \
    --depth 1 \
    ${RECURSE_SUBMODULES:+'--recurse-submodules'} \
    origin "${COMMIT:-${BRANCH:-${TAG}}}"
}

### Verify if destination already exists and is a valid git repository with the correct remote URL

verify_dest() {
  local dest=$1 current_url
  [ -d "${dest}/.git" ] || return
  echo "Source dest exists, updating..."

  cd "${dest}"
  git remote set-url origin "${ORG_URL}"
  
  { # Abort any in-progress tasks
    git merge --abort ||
      git rebase --abort ||
      git cherry-pick --abort || :
  } 2>/dev/null

  # Update the existing shallow clone
  update_src
  git reset --hard FETCH_HEAD
  cd "${PWD}"

  ln -s "../${dest}" "../src/${dest}"
  echo ${dest}
  exit 0
}

verify_dest "${DEST}"
verify_dest "${REAL_DEST}"

### If not, perform a fresh shallow clone

rm -rf "${DEST}"
mkdir -p "${DEST}"

cd "${DEST}"
git init --quiet
git remote add origin "${ORG_URL}"

update_src
git reset --hard FETCH_HEAD

cd "${PWD}"

ln -s "../${REAL_DEST}" "../src/${REAL_DEST}"
echo ${REAL_DEST}
EOF
chmod +x DLAGENTS
export DLAGENTS="shallowclone::$(realpath "./DLAGENTS") %u %o"

source=(
	"${pkgbase}::shallowclone+${url}?branch=${_BRANCH}&depth=1"
	"zenith_linux-x86_64_defconfig"
)

sha256sums=(
	'SKIP'
	'0ac0c2f35795d05ec6de41d818e668e1f1589378ec64dcc41724ce59c331ab61'
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
	cd "${srcdir}/../${pkgbase}"

	# get VERSION, PATCHLEVEL and SUBLEVEL from makefile
	local ver pat sub
	read -r ver pat sub < <(head -6 Makefile | sed -nE 's/^(VERSION|PATCHLEVEL|SUBLEVEL) = ([0-9]+)$/\2/p' | xargs)

	printf '%s.%s.%s' "$ver" "$pat" "$sub"
}

prepare() {
	# SELINUX_DIFFCONFIG=$(realpath "${srcdir}/selinux_diffconfig")
	# NFTABLES_DIFFCONFIG=$(realpath "${srcdir}/nftables_diffconfig")
	# KCONFIG="${KERNEL_CONFIG_DIR}/${TARGET_KERNEL_CONFIG}"

	cd "${srcdir}/../${pkgbase}"

	git submodule update --init --recursive ||
		_die "Failed to update git submodules"

	mkdir -p "$KBUILD_OUTPUT"

	if [ "$_use_android_defconfig" = yes ]; then
		CONFIG=arch/x86/configs/android-x86_64_defconfig
	else
		CONFIG=${srcdir}/zenith_linux-x86_64_defconfig
	fi

	mv "$CONFIG" "$KBUILD_OUTPUT"/.config
	"${MAKE_CMD[@]}" olddefconfig

	### Prepared version
	"${MAKE_CMD[@]}" -s kernelrelease >"$KBUILD_OUTPUT/version"
	echo "Prepared $pkgbase version $(<"$KBUILD_OUTPUT/version")"

	echo "Setting version..."
	echo "" >"$KBUILD_OUTPUT/localversion.10-pkgrel"
	echo "" >"$KBUILD_OUTPUT/localversion.20-pkgname"

}

clean() {
	cd "${srcdir}/../${pkgbase}"
	"${MAKE_CMD[@]}" clean
	"${MAKE_CMD[@]}" mrproper
}

_sign_modules() {
	msg2 "Signing modules in $1"
	local sign_script="${pkgbase}/scripts/sign-file"
	local sign_key="$(grep -Po 'CONFIG_MODULE_SIG_KEY="\K[^"]*' "${pkgbase}/.config")"
	if [[ ! "$sign_key" =~ ^/ ]]; then
		sign_key="${pkgbase}/${sign_key}"
	fi
	local sign_cert="${pkgbase}/certs/signing_key.x509"
	local hash_algo="$(grep -Po 'CONFIG_MODULE_SIG_HASH="\K[^"]*' "${pkgbase}/.config")"

	find "$1" -type f -name '*.ko' -print -exec \
		"${sign_script}" "${hash_algo}" "${sign_key}" "${sign_cert}" '{}' \;
}

build() {
	cd "${srcdir}/../${pkgbase}"

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

	cd "${srcdir}/../${pkgbase}"
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

	cd "${srcdir}/../${pkgbase}"
	local builddir="$pkgdir/usr/lib/modules/$(<"$KBUILD_OUTPUT/version")/build"

	echo "Installing build files..."

	cd "$KBUILD_OUTPUT"
	install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
		localversion.* version vmlinux # tools/bpf/bpftool/vmlinux.h

	cd "${srcdir}/../${pkgbase}"
	install -Dt "$builddir/kernel" -m644 tools/perf/util/bpf_skel/vmlinux/vmlinux.h
	install -Dt "$builddir/kernel" -m644 kernel/Makefile
	install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
	cp -t "$builddir" -a scripts
	ln -srt "$builddir" "$builddir/scripts/gdb/vmlinux-gdb.py"

	# required when STACK_VALIDATION is enabled
	cd "$KBUILD_OUTPUT"
	install -Dt "$builddir/tools/objtool" tools/objtool/objtool

	# required when DEBUG_INFO_BTF_MODULES is enabled
	cd "${srcdir}/../${pkgbase}"
	if [ -f tools/bpf/resolve_btfids/resolve_btfids ]; then
		install -Dt "$builddir/tools/bpf/resolve_btfids" tools/bpf/resolve_btfids/resolve_btfids
	fi

	echo "Installing headers..."
	cp -t "$builddir" -a include
	cp -t "$builddir/arch/x86" -a arch/x86/include

	cd "$KBUILD_OUTPUT"
	install -Dt "$builddir/arch/x86/kernel" -m644 arch/x86/kernel/asm-offsets.s

	cd "${srcdir}/../${pkgbase}"
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

	# Selinux headers
	install -Dt "$builddir/security/selinux" -m644 $KBUILD_OUTPUT/security/selinux/*.h
	install -Dt "$builddir/security/selinux/include" -m644 security/selinux/include/*.h
	install -Dt "$builddir/security/selinux/ss" -m644 security/selinux/ss/*.h

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

	cd "${srcdir}/../${pkgbase}"
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
