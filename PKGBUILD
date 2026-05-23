# Maintainer: Celestia Ludenberg <ash8820@proton.me>
# Based on CachyOS kernel PKGBUILD (GPL-2.0)
# no i didnt steal it. its called inspiration. totally.

### BUILD OPTIONS
: "${_cachy_config:=yes}"

### CPU Scheduler
# 'bore' - Burst-Oriented Response Enhancer (default for Solara)
# 'eevdf' - EEVDF Scheduler
# 'bmq' - BMQ Scheduler
# 'hardened' - BORE + hardened patches
# 'rt' - EEVDF + realtime patches
# 'rt-bore' - BORE + realtime patches
: "${_cpusched:=bore}"

: "${_makenconfig:=no}"
: "${_makexconfig:=no}"
: "${_localmodcfg:=no}"
: "${_localmodcfg_path:="$HOME/.config/modprobed.db"}"
: "${_use_current:=no}"
: "${_cc_harder:=yes}"
: "${_per_gov:=no}"
: "${_tcp_bbr3:=yes}"
: "${_HZ_ticks:=1000}"
: "${_tickrate:=full}"
: "${_preempt:=full}"
: "${_hugepage:=always}"
: "${_processor_opt:=}"
: "${_use_llvm_lto:=none}"
: "${_use_lto_suffix:=yes}"
: "${_use_gcc_suffix:=no}"
: "${_use_kcfi:=no}"
: "${_build_zfs:=no}"
: "${_build_nvidia_open:=no}"
: "${_build_r8125:=no}"
: "${_build_debug:=no}"

_is_lto_kernel() {
    [[ "$_use_llvm_lto" = "thin" || "$_use_llvm_lto" = "full" || "$_use_llvm_lto" = "thin-dist" ]]
    return $?
}
_is_ci_build() {
    [[ -n "$CI" || -n "$GITHUB_RUN_ID" ]]
    return $?
}

if _is_lto_kernel && [ "$_use_lto_suffix" = "yes" ]; then
    pkgbase="solara-kernel"
elif ! _is_lto_kernel && [ "$_use_gcc_suffix" = "yes" ]; then
    pkgbase="solara-kernel"
else
    pkgbase="solara-kernel"
fi

pkgbase="solara-kernel"
_major=7.0
_minor=10
pkgver=${_major}.${_minor}
_tagrel=2
pkgrel=1
_stable=${_major}
_srcname=cachyos-${_major}.${_minor}-${_tagrel}
pkgdesc="Solara Linux Kernel — BORE scheduler, CachyOS patches, maximum POWER"
_kernver="$pkgver-$pkgrel"
_kernuname="${pkgver}-${_pkgsuffix}"
arch=('x86_64')
url="https://github.com/celestia-foundation/solara"
license=('GPL-2.0-only')
options=('!strip' '!debug' '!lto')

makedepends=(
  bc binutils cpio gettext glibc libelf libgcc
  openssl pahole perl python rust rust-bindgen
  rust-src tar xxhash xz zlib zstd
)

_patchsource="https://raw.githubusercontent.com/cachyos/kernel-patches/master/${_major}"
_nv_ver=595.71.05
_nv_pkg="NVIDIA-Linux-x86_64-${_nv_ver}"
_nv_open_pkg="NVIDIA-kernel-module-source-${_nv_ver}"

source=(
    "https://github.com/CachyOS/linux/releases/download/${_srcname}/${_srcname}.tar.gz"
    "config"
)

if _is_lto_kernel; then
    makedepends+=(clang llvm lld)
    source+=("${_patchsource}/misc/dkms-clang.patch")
    BUILD_FLAGS=(CC=clang LD=ld.lld LLVM=1 LLVM_IAS=1)
fi

if [[ "$_cpusched" = "rt" || "$_cpusched" = "rt-bore" ]]; then
    unset _build_zfs
fi

if [ "$_build_zfs" = "yes" ]; then
    makedepends+=(git)
    source+=("git+https://github.com/cachyos/zfs.git#commit=0829cf892b5d7b3a0e8aa76cc7aca02b84f62557")
fi

if [ "$_build_nvidia_open" = "yes" ]; then
    source+=(
        "https://download.nvidia.com/XFree86/${_nv_open_pkg%"-$_nv_ver"}/${_nv_open_pkg}.tar.xz"
        "${_patchsource}/misc/nvidia/0002-Add-IBT-support.patch"
        "${_patchsource}/misc/nvidia/0003-fix-dsc-correct-RC-parameter-tables-to-match-VESA-DS.patch"
        "${_patchsource}/misc/nvidia/0004-fix-dsc-use-bits_per_component-for-flatnessDetThresh.patch"
        "${_patchsource}/misc/nvidia/0005-fix-dp-add-Bigscreen-Beyond-VR-headset-to-WAR-databa.patch"
    )
fi

if [ "$_build_r8125" = "yes" ]; then
    source+=("git+https://github.com/aravance/r8125.git")
fi

case "$_cpusched" in
    bore|rt-bore|hardened)
        source+=("${_patchsource}/sched/0001-bore-cachy.patch");;&
    bmq)
        source+=("${_patchsource}/sched/0001-prjc-cachy.patch");;
    hardened)
        source+=("${_patchsource}/misc/0001-hardened.patch");;
    rt|rt-bore)
        source+=("${_patchsource}/misc/0001-rt-i915.patch");;
esac

export KBUILD_BUILD_HOST=solara
export KBUILD_BUILD_USER="$pkgbase"
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

_die() { error "$@" ; exit 1; }

prepare() {
    cd "$_srcname"
    echo "Setting version..."
    echo "-$pkgrel" > localversion.10-pkgrel
    echo "-solara" > localversion.20-pkgname

    local src
    for patch in "${source[@]}"; do
        patch="${patch%%::*}"
        src="${patch##*/}"
        src="${src%.zst}"
        [[ $src = *.patch ]] || continue
        echo "Applying patch $src..."
        if [[ "$patch" == "${_patchsource}"/misc/nvidia/* ]]; then
            patch -Np1 < "../$src" -d "${srcdir}/${_nv_open_pkg}"
        else
            patch -Np1 < "../$src"
        fi
    done

    echo "Setting config..."
    cp ../config .config

    if [ -n "$_processor_opt" ]; then
        MARCH="${_processor_opt^^}"
        case "$MARCH" in
            GENERIC_V[1-4]) scripts/config -e GENERIC_CPU -d MZEN4 -d X86_NATIVE_CPU \
                --set-val X86_64_VERSION "${MARCH//GENERIC_V}";;
            ZEN4) scripts/config -d GENERIC_CPU -e MZEN4 -d X86_NATIVE_CPU;;
            NATIVE) scripts/config -d GENERIC_CPU -d MZEN4 -e X86_NATIVE_CPU;;
        esac
    else
        scripts/config -d GENERIC_CPU -d MZEN4 -e X86_NATIVE_CPU
    fi

    if [ "$_cachy_config" = "yes" ]; then
        echo "Enabling CachyOS config..."
        scripts/config -e CACHY
    fi

    case "$_cpusched" in
        cachyos|bore|hardened) scripts/config -e SCHED_BORE;;
        bmq) scripts/config -e SCHED_ALT -e SCHED_BMQ;;
        eevdf) ;;
        rt) scripts/config -e PREEMPT_RT;;
        rt-bore) scripts/config -e SCHED_BORE -e PREEMPT_RT;;
        *) _die "Invalid scheduler: $_cpusched";;
    esac
    echo "Scheduler: ${_cpusched^^}"

    if [ "$_use_kcfi" = "yes" ]; then
        scripts/config -e ARCH_SUPPORTS_CFI_CLANG -e CFI_CLANG -e CFI_AUTO_DEFAULT
    fi

    case "$_use_llvm_lto" in
        thin) scripts/config -e LTO_CLANG_THIN;;
        thin-dist) scripts/config -e LTO_CLANG_THIN_DIST;;
        full) scripts/config -e LTO_CLANG_FULL;;
        none) scripts/config -e LTO_NONE;;
        *) _die "Invalid LTO: $_use_llvm_lto";;
    esac

    if ! _is_lto_kernel; then
        scripts/config --set-str DRM_PANIC_SCREEN qr_code -e DRM_PANIC_SCREEN_QR_CODE \
            --set-str DRM_PANIC_SCREEN_QR_CODE_URL https://panic.archlinux.org/panic_report# \
            --set-val CONFIG_DRM_PANIC_SCREEN_QR_VERSION 40
    fi

    case "$_HZ_ticks" in
        100|250|500|600|750|1000)
            scripts/config -d HZ_300 -e "HZ_${_HZ_ticks}" --set-val HZ "${_HZ_ticks}";;
        300)
            scripts/config -e HZ_300 --set-val HZ 300;;
        *) _die "Invalid HZ: $_HZ_ticks";;
    esac

    if [ "$_per_gov" = "yes" ]; then
        scripts/config -d CPU_FREQ_DEFAULT_GOV_SCHEDUTIL -e CPU_FREQ_DEFAULT_GOV_PERFORMANCE
    fi

    case "$_tickrate" in
        periodic) scripts/config -d NO_HZ_IDLE -d NO_HZ_FULL -d NO_HZ -d NO_HZ_COMMON -e HZ_PERIODIC;;
        idle) scripts/config -d HZ_PERIODIC -d NO_HZ_FULL -e NO_HZ_IDLE -e NO_HZ -e NO_HZ_COMMON;;
        full) scripts/config -d HZ_PERIODIC -d NO_HZ_IDLE -d CONTEXT_TRACKING_FORCE -e NO_HZ_FULL_NODEF -e NO_HZ_FULL -e NO_HZ -e NO_HZ_COMMON -e CONTEXT_TRACKING;;
        *) _die "Invalid tickrate: $_tickrate";;
    esac

    if [[ "$_cpusched" != "rt" && "$_cpusched" != "rt-bore" ]]; then
        case "$_preempt" in
            full) scripts/config -e PREEMPT -d PREEMPT_LAZY;;
            lazy) scripts/config -d PREEMPT -e PREEMPT_LAZY;;
            *) _die "Invalid preempt: $_preempt";;
        esac
    fi

    if [ "$_cc_harder" = "yes" ]; then
        scripts/config -d CC_OPTIMIZE_FOR_PERFORMANCE -e CC_OPTIMIZE_FOR_PERFORMANCE_O3
    fi

    if _is_ci_build; then
        scripts/config -d CC_OPTIMIZE_FOR_PERFORMANCE_O3 -e CC_OPTIMIZE_FOR_SIZE \
            -d DEBUG_KERNEL -e DEBUG_INFO_REDUCED
    fi

    if [ "$_tcp_bbr3" = "yes" ]; then
        scripts/config -m TCP_CONG_CUBIC -d DEFAULT_CUBIC -e TCP_CONG_BBR -e DEFAULT_BBR \
            --set-str DEFAULT_TCP_CONG bbr -m NET_SCH_FQ_CODEL -e NET_SCH_FQ \
            -d CONFIG_DEFAULT_FQ_CODEL -e CONFIG_DEFAULT_FQ
    fi

    case "$_hugepage" in
        always) scripts/config -d TRANSPARENT_HUGEPAGE_MADVISE -e TRANSPARENT_HUGEPAGE_ALWAYS;;
        madvise) scripts/config -d TRANSPARENT_HUGEPAGE_ALWAYS -e TRANSPARENT_HUGEPAGE_MADVISE;;
        *) _die "Invalid hugepage: $_hugepage";;
    esac

    if [ "$_use_current" = "yes" ]; then
        if [[ -s /proc/config.gz ]]; then
            zcat /proc/config.gz > ./.config
        else
            warning "Kernel not compiled with IKPROC, aborting"
            exit
        fi
    fi

    if [ "$_localmodcfg" = "yes" ]; then
        if [ -e "$_localmodcfg_path" ]; then
            make "${BUILD_FLAGS[@]}" LSMOD="${_localmodcfg_path}" localmodconfig
        else
            _die "No modprobed.db data found"
        fi
    fi

    echo "Rewriting configuration..."
    make "${BUILD_FLAGS[@]}" prepare
    yes "" | make "${BUILD_FLAGS[@]}" config >/dev/null
    diff -u ../config .config || :

    make -s kernelrelease > version
    echo "Prepared $pkgbase version $(<version)"

    [ "$_makenconfig" = "yes" ] && make "${BUILD_FLAGS[@]}" nconfig
    [ "$_makexconfig" = "yes" ] && make "${BUILD_FLAGS[@]}" xconfig

    local basedir="$(dirname "$(readlink "${srcdir}/config")")"
    cat .config > "${basedir}/config-${pkgver}-${pkgrel}-solara"
}

_sign_modules() {
    msg2 "Signing modules in $1"
    local sign_script="${srcdir}/${_srcname}/scripts/sign-file"
    local sign_key="$(grep -Po 'CONFIG_MODULE_SIG_KEY="\K[^"]*' "${srcdir}/${_srcname}/.config")"
    [[ ! "$sign_key" =~ ^/ ]] && sign_key="${srcdir}/${_srcname}/${sign_key}"
    local sign_cert="${srcdir}/${_srcname}/certs/signing_key.x509"
    local hash_algo="$(grep -Po 'CONFIG_MODULE_SIG_HASH="\K[^"]*' "${srcdir}/${_srcname}/.config")"
    local strip_bin="strip"
    [ "$_use_llvm_lto" != "none" ] && strip_bin="llvm-strip"
    find "$1" -type f -name '*.ko' -print \
        -exec "${strip_bin}" --strip-debug '{}' \; \
        -exec "${sign_script}" "${hash_algo}" "${sign_key}" "${sign_cert}" '{}' \;
}

build() {
    cd "$_srcname"
    make "${BUILD_FLAGS[@]}" -j"$(nproc)" all
    if ! _is_ci_build; then
        make -C tools/bpf/bpftool vmlinux.h feature-clang-bpf-co-re=1
    fi
    local MODULE_FLAGS=(
        KERNEL_UNAME="${_kernuname}"
        IGNORE_PREEMPT_RT_PRESENCE=1
        SYSSRC="${srcdir}/${_srcname}"
        SYSOUT="${srcdir}/${_srcname}"
    )
    if [ "$_build_nvidia_open" = "yes" ]; then
        cd "${srcdir}/${_nv_open_pkg}"
        MODULE_FLAGS+=(IGNORE_CC_MISMATCH=yes)
        CFLAGS= CXXFLAGS= LDFLAGS= make "${BUILD_FLAGS[@]}" "${MODULE_FLAGS[@]}" -j"$(nproc)" modules
    fi
    if [ "$_build_zfs" = "yes" ]; then
        cd "${srcdir}/zfs"
        local CONFIGURE_FLAGS=()
        [ "$_use_llvm_lto" != "none" ] && CONFIGURE_FLAGS+=("KERNEL_LLVM=1")
        ./autogen.sh
        sed -i "s|\$(uname -r)|${_kernuname}|g" configure
        ./configure "${CONFIGURE_FLAGS[@]}" --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin \
            --libdir=/usr/lib --datadir=/usr/share --includedir=/usr/include \
            --with-udevdir=/lib/udev --libexecdir=/usr/lib/zfs --with-config=kernel \
            --with-linux="${srcdir}/$_srcname"
        make "${BUILD_FLAGS[@]}"
    fi
    if [ "$_build_r8125" = "yes" ]; then
        cd "${srcdir}/r8125"
        make "${BUILD_FLAGS[@]}" KERNELDIR="$srcdir/$_srcname" modules
    fi
}

_package() {
    pkgdesc="The $pkgdesc kernel and modules"
    depends=('coreutils' 'kmod' 'initramfs')
    optdepends=(
        'wireless-regdb: correct wireless channels for your country'
        'linux-firmware: firmware for various devices'
        'modprobed-db: track kernel modules for localmodconfig'
        'scx-scheds: sched-ext schedulers'
    )
    provides=(VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE KSMBD-MODULE V4L2LOOPBACK-MODULE NTSYNC-MODULE VHBA-MODULE ADIOS-MODULE)
    # NEW LINES HERE
    provides+=('linux')
    conflicts=('linux' 'linux-zen' 'linux-hardened')
    replaces=('linux' 'linux-zen' 'linux-hardened')
    cd "$_srcname"
    local modulesdir="$pkgdir/usr/lib/modules/$(<version)"
    echo "Installing boot image..."
    install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"
    install -dm755 "$pkgdir/boot"
    ln -s "$modulesdir/vmlinuz" "$pkgdir/boot/vmlinuz-linux"
    echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"
    echo "Installing modules..."
    ZSTD_CLEVEL=19 make "${BUILD_FLAGS[@]}" INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 \
        DEPMOD=/doesnt/exist modules_install
    rm "$modulesdir"/build
}

_package-hdr() {
    pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
    depends=(binutils glibc libelf libgcc openssl pahole xxhash zlib zstd "${pkgbase}")
    provides=(LINUX-HEADERS)
    cd "${_srcname}"
    local builddir="$pkgdir/usr/lib/modules/$(<version)/build"
    echo "Installing build files..."
    if [ ! -f localversion.10-pkgrel ] && [ ! -f localversion.20-pkgname ]; then
        echo "-$pkgrel" > localversion.10-pkgrel
        echo "-solara" > localversion.20-pkgname
    fi
    install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
        localversion.10-pkgrel localversion.20-pkgname version vmlinux
    if ! _is_ci_build; then
        install -Dt "$builddir" -m644 tools/bpf/bpftool/vmlinux.h
    fi
    install -Dt "$builddir/kernel" -m644 kernel/Makefile
    install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
    cp -t "$builddir" -a scripts
    ln -srt "$builddir" "$builddir/scripts/gdb/vmlinux-gdb.py"
    install -Dt "$builddir/tools/objtool" tools/objtool/objtool
    if [ -f tools/bpf/resolve_btfids/resolve_btfids ]; then
        install -Dt "$builddir/tools/bpf/resolve_btfids" tools/bpf/resolve_btfids/resolve_btfids
    fi
    echo "Installing headers..."
    cp -t "$builddir" -a include
    cp -t "$builddir/arch/x86" -a arch/x86/include
    install -Dt "$builddir/arch/x86/kernel" -m644 arch/x86/kernel/asm-offsets.s
    install -Dt "$builddir/drivers/md" -m644 drivers/md/*.h
    install -Dt "$builddir/net/mac80211" -m644 net/mac80211/*.h
    install -Dt "$builddir/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h
    install -Dt "$builddir/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
    install -Dt "$builddir/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
    install -Dt "$builddir/drivers/media/tuners" -m644 drivers/media/tuners/*.h
    install -Dt "$builddir/drivers/iio/common/hid-sensors" -m644 drivers/iio/common/hid-sensors/*.h
    echo "Installing KConfig files..."
    find . -name 'Kconfig*' -exec install -Dm644 {} "$builddir/{}" \;
    if compgen -G "rust/*.rmeta" 1>/dev/null; then
        install -Dt "$builddir/rust" -m644 rust/*.rmeta
    fi
    if compgen -G "rust/*.so" 1>/dev/null; then
        install -Dt "$builddir/rust" rust/*.so
    fi
    echo "Installing unstripped VDSO..."
    make INSTALL_MOD_PATH="$pkgdir/usr" vdso_install link=
    echo "Removing unneeded architectures..."
    local arch
    for arch in "$builddir"/arch/*/; do
        [[ $arch = */x86/ ]] && continue
        rm -r "$arch"
    done
    rm -r "$builddir/Documentation"
    find -L "$builddir" -type l -delete
    find "$builddir" -type f -name '*.o' -delete
    echo "Stripping build tools..."
    local file
    while read -rd '' file; do
        case "$(file -Sib "$file")" in
            application/x-sharedlib\;*) strip -v $STRIP_SHARED "$file";;
            application/x-archive\;*) strip -v $STRIP_STATIC "$file";;
            application/x-executable\;*) strip -v $STRIP_BINARIES "$file";;
            application/x-pie-executable\;*) strip -v $STRIP_SHARED "$file";;
        esac
    done < <(find "$builddir" -type f -perm -u+x ! -name vmlinux -print0)
    strip -v $STRIP_STATIC "$builddir/vmlinux"
    mkdir -p "$pkgdir/usr/src"
    ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"
}

_package-dbg() {
    pkgdesc="Non-stripped vmlinux for the $pkgdesc kernel"
    depends=("${pkgbase}-headers")
    cd "${_srcname}"
    mkdir -p "$pkgdir/usr/src/debug/${pkgbase}"
    install -Dt "$pkgdir/usr/src/debug/${pkgbase}" -m644 vmlinux
}

_package-zfs() {
    pkgdesc="zfs module for the $pkgdesc kernel"
    depends=('pahole' "${pkgbase}=${_kernver}")
    provides=('ZFS-MODULE')
    license=('CDDL')
    cd "$_srcname"
    local modulesdir="$pkgdir/usr/lib/modules/$(<version)/extramodules"
    cd "${srcdir}/zfs"
    install -dm755 "${modulesdir}"
    install -m644 module/*.ko "${modulesdir}"
    _sign_modules "${modulesdir}"
    find "$pkgdir" -name '*.ko' -exec zstd --rm -19 -T0 {} +
}

_package-nvidia-open() {
    pkgdesc="nvidia open modules of ${_nv_ver} for ${pkgbase}"
    depends=("$pkgbase=$_kernver" "nvidia-utils=${_nv_ver}" "libglvnd")
    provides=('NVIDIA-MODULE')
    conflicts=("$pkgbase-nvidia")
    license=('MIT AND GPL-2.0-only')
    cd "$_srcname"
    local modulesdir="$pkgdir/usr/lib/modules/$(<version)/extramodules"
    cd "${srcdir}/${_nv_open_pkg}"
    install -dm755 "${modulesdir}"
    install -m644 kernel-open/*.ko "${modulesdir}"
    install -Dt "$pkgdir/usr/share/licenses/${pkgname}" -m644 COPYING
    _sign_modules "${modulesdir}"
    find "$pkgdir" -name '*.ko' -exec zstd --rm -19 -T0 {} +
}

_package-r8125() {
    pkgdesc="r8125 modules for $pkgbase"
    depends=("$pkgbase=$_kernver")
    license=('GPL-2.0-only')
    cd "$_srcname"
    local modulesdir="$pkgdir/usr/lib/modules/$(<version)/extramodules"
    cd "${srcdir}/r8125"
    install -dm755 "${modulesdir}"
    install -m644 src/*.ko "${modulesdir}"
    _sign_modules "${modulesdir}"
    find "$pkgdir" -name '*.ko' -exec zstd --rm -19 -T0 {} +
    install -dm755 "${pkgdir}/usr/lib/modprobe.d"
    echo "install r8169 /usr/bin/modprobe r8125 || /usr/bin/modprobe --ignore-install r8169" \
        > "${pkgdir}/usr/lib/modprobe.d/${pkgname}.conf"
}

pkgname=("$pkgbase")
[ "$_build_debug" = "yes" ] && pkgname+=("$pkgbase-dbg")
pkgname+=("$pkgbase-hdr")
[ "$_build_zfs" = "yes" ] && pkgname+=("$pkgbase-zfs")
[ "$_build_nvidia_open" = "yes" ] && pkgname+=("$pkgbase-nvidia-open")
[ "$_build_r8125" = "yes" ] && pkgname+=("$pkgbase-r8125")

for _p in "${pkgname[@]}"; do
    eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
    }"
done

b2sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
