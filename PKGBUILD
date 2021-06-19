## Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>

### BUILD OPTIONS
# Set the next two variables to ANYTHING that is not null to enable them
### BUILD OPTIONS
# Set these variables to ANYTHING that is not null to enable them

# NUMA is optimized for multi-socket motherboards.
# A single multi-core CPU actually runs slower with NUMA enabled.
# See, https://bugs.archlinux.org/task/31187
_NUMAdisable=y
# Enable fsync
_fsync=y
### Set performance governor as default
_per_gov=y
### Running with a 2000 HZ, 1000HZ or 500HZ tick rate
_2k_HZ_ticks=
_1k_HZ_ticks=y
_500_HZ_ticks=
### Enable protect file mappings under memory pressure
_mm_protect=y
# Tweak kernel options prior to a build via nconfig
_makenconfig=
# Only compile active modules to VASTLY reduce the number of modules built and
# the build time.
#
# To keep track of which modules are needed for your specific system/hardware,
# give module_db a try: https://aur.archlinux.org/packages/modprobed-db
# This PKGBUILD reads the database kept if it exists
#
# More at this wiki page ---> https://wiki.archlinux.org/index.php/Modprobed-db
_localmodcfg=

# Use the current kernel's .config file
# Enabling this option will use the .config of the RUNNING kernel rather than
# the ARCH defaults. Useful when the package gets updated and you already went
# through the trouble of customizing your config options.  NOT recommended when
# a new kernel is released, but again, convenient for package bumps.
_use_current=

### IMPORTANT: Do no edit below this line unless you know what you're doing

pkgbase=linux-cacule-rt
_major=5.10
_minor=45
_srcname=linux-${_major}.${_minor}
pkgver=${_major}.${_minor}
pkgrel=1
pkgdesc='Linux-Cacule-RDB-RT'
arch=('x86_64')
license=('GPL2')
makedepends=(
  bc kmod libelf pahole cpio perl tar xz
  xmlto python-sphinx python-sphinx_rtd_theme graphviz imagemagick
  git
  )
options=('!strip')
_patchsource="https://raw.githubusercontent.com/ptr1337/linux-cacule-aur/master/patches/5.10"
_caculepatches="https://raw.githubusercontent.com/ptr1337/linux-cacule-aur/master/patches/CacULE"
source=(
  "https://cdn.kernel.org/pub/linux/kernel/v5.x/${_srcname}.tar.xz"
  "config"         # the main kernel config file
  "${_caculepatches}/v5.10/cacule-5.10-rt.patch"
  "${_patchsource}/bbr2-patches-v3/0001-bbr2-5.10-introduce-BBRv2.patch"
# ${_patchsource}/bfq-patches-v5/0001-bfq-patches.patch"
# "${_patchsource}/block-patches-v3/0001-block-patches.patch"
  "${_patchsource}/cpu-patches-v2/0001-cpu-patches.patch"
# "${_patchsource}/fixes-miscellaneous-v11/0001-fixes-miscellaneous.patch"
  "${_patchsource}/mm-patches-v4/0001-mm-patches.patch"
  "${_patchsource}/lqx-patches-v4/0001-lqx-patches.patch"
  "${_patchsource}/zstd-upstream-patches/0001-zstd-upstream-patches.patch"
# ${_patchsource}/clearlinux-patches/0001-clearlinux-patches.patch"
  "${_patchsource}/futex-dev-patches/0001-futex-dev-patches.patch"
# "${_patchsource}/futex2-trunk-patches-v3/0001-futex2-resync-from-gitlab.collabora.com.patch"
)

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
    cd ${_srcname}


    ### Setting version
    echo "Setting version..."
    scripts/setlocalversion --save-scmversion
    echo "-$pkgrel" > localversion.10-pkgrel
    echo "${pkgbase#linux}" > localversion.20-pkgname

    local src
        for src in "${source[@]}"; do
        src="${src%%::*}"
        src="${src##*/}"
        [[ $src = *.patch ]] || continue
        echo "Applying patch $src..."
        patch -Np1 < "../$src"
    done

 ### Setting config
        echo "Setting config..."
      cp "${srcdir}"/config .config
      make olddefconfig
    ### CPU_ARCH SCRIPT ##
      source "${startdir}"/configure

      cacule_config

      cpu_arch
      ### Optionally set tickrate to 2000HZ
        if [ -n "$_2k_HZ_ticks" ]; then
          echo "Setting tick rate to 2k..."
          scripts/config --disable CONFIG_HZ_300
          scripts/config --enable CONFIG_HZ_2000
          scripts/config --set-val CONFIG_HZ 2000
        fi

      ### Optionally set tickrate to 1000
  	     if [ -n "$_1k_HZ_ticks" ]; then
  		    echo "Setting tick rate to 1k..."
          scripts/config --disable CONFIG_HZ_300
          scripts/config --enable CONFIG_HZ_1000
          scripts/config --set-val CONFIG_HZ 1000
  	     fi

      ### Optionally set tickrate to 500HZ
        if [ -n "$_500_HZ_ticks" ]; then
          echo "Setting tick rate to 500HZ..."
          scripts/config --disable CONFIG_HZ_300
          scripts/config --enable CONFIG_HZ_500
          scripts/config --set-val CONFIG_HZ 500
        fi

    ### Optionally disable NUMA for 64-bit kernels only
      # (x86 kernels do not support NUMA)
        if [ -n "$_NUMAdisable" ]; then
          echo "Disabling NUMA from kernel config..."
          scripts/config --disable CONFIG_NUMA
        fi

        if [ -n "$_fsync" ]; then
          echo "Enable Fsync support"
          scripts/config --enable CONFIG_FUTEX
          scripts/config --enable CONFIG_FUTEX_PI
        fi

    ### Set performance governor
        if [ -n "$_per_gov" ]; then
          echo "Setting performance governor..."
    		  scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL
    		  scripts/config --enable CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE
    		  echo "Disabling uneeded governors..."
    		  scripts/config --enable CONFIG_CPU_FREQ_GOV_ONDEMAND
    		  scripts/config --disable CONFIG_CPU_FREQ_GOV_CONSERVATIVE
    		  scripts/config --disable CONFIG_CPU_FREQ_GOV_USERSPACE
    		  scripts/config --disable CONFIG_CPU_FREQ_GOV_SCHEDUTIL
        fi



      ### Enable protect file mappings under memory pressure
          if [ -n "$_mm_protect" ]; then
          	echo "Enabling protect file mappings under memory pressure..."
          	scripts/config --enable CONFIG_UNEVICTABLE_FILE
          	scripts/config --set-val CONFIG_UNEVICTABLE_FILE_KBYTES_LOW 262144
          	scripts/config --set-val CONFIG_UNEVICTABLE_FILE_KBYTES_MIN 131072
          fi

    ### Optionally use running kernel's config
    # code originally by nous; http://aur.archlinux.org/packages.php?ID=40191
    if [ -n "$_use_current" ]; then
        if [[ -s /proc/config.gz ]]; then
            echo "Extracting config from /proc/config.gz..."
            # modprobe configs
            zcat /proc/config.gz > ./.config
        else
            warning "Your kernel was not compiled with IKCONFIG_PROC!"
            warning "You cannot read the current config!"
            warning "Aborting!"
            exit
        fi
    fi

    ### Optionally load needed modules for the make localmodconfig
    # See https://aur.archlinux.org/packages/modprobed-db
    if [ -n "$_localmodcfg" ]; then
        if [ -e $HOME/.config/modprobed.db ]; then
            echo "Running Steven Rostedt's make localmodconfig now"
            make LSMOD=$HOME/.config/modprobed.db localmodconfig
        else
            echo "No modprobed.db data found"
            exit
        fi
    fi

    make -s kernelrelease > version
    echo "Prepared $pkgbase version $(<version)"

    [[ -z "$_makenconfig" ]] || make nconfig

    ### Save configuration for later reuse
    cp -Tf ./.config "${startdir}/config-${pkgver}-${pkgrel}${pkgbase#linux}"
}

build() {
    cd $_srcname
    make all
}

_package() {
    pkgdesc="The $pkgdesc kernel and modules"
    depends=('coreutils' 'kmod' 'initramfs')
    optdepends=('crda: to set the correct wireless channels of your country'
                'linux-firmware: firmware images needed for some devices'
                'modprobed-db: Keeps track of EVERY kernel module that has ever been probed - useful for those of us who make localmodconfig')
    provides=(VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE)

    cd $_srcname

    local kernver="$(<version)"
    local modulesdir="$pkgdir/usr/lib/modules/$kernver"

    echo "Installing boot image..."
    # systemd expects to find the kernel here to allow hibernation
    # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
    install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

    # Used by mkinitcpio to name the kernel
    echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

    echo "Installing modules..."
    make INSTALL_MOD_PATH="$pkgdir/usr" modules_install

    # remove build and source links
    rm "$modulesdir"/{source,build}
}

_package-headers() {
    pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"

    cd ${_srcname}
    local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

    echo "Installing build files..."
    install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
        localversion.* version vmlinux
    install -Dt "$builddir/kernel" -m644 kernel/Makefile
    install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
    cp -t "$builddir" -a scripts

    # add objtool for external module building and enabled VALIDATION_STACK option
    install -Dt "$builddir/tools/objtool" tools/objtool/objtool

    # add xfs and shmem for aufs building
    mkdir -p "$builddir"/{fs/xfs,mm}

    echo "Installing headers..."
    cp -t "$builddir" -a include
    cp -t "$builddir/arch/x86" -a arch/x86/include
    install -Dt "$builddir/arch/x86/kernel" -m644 arch/x86/kernel/asm-offsets.s

    install -Dt "$builddir/drivers/md" -m644 drivers/md/*.h
    install -Dt "$builddir/net/mac80211" -m644 net/mac80211/*.h

    # http://bugs.archlinux.org/task/13146
    install -Dt "$builddir/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

    # http://bugs.archlinux.org/task/20402
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

pkgname=("$pkgbase" "$pkgbase-headers")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

sha512sums=('08f4760c72a0971d92990bb8015ef56b7a58390ef88d72d0b38c73e52ea474ca6890140fb2d102e3f8ed0af5903d9ba4f606bc500bb96d53dac311a268e8126e'
            'f03ee73b667c09ad558dc2bb795c5ce6cb7bd07cda584b2691b210dce1835d3332d557297f5c54d4d9dd67b1fbb92c49d00dc61cceed2b9a95f179d83a698809'
            'bd82dfd2efea454c42951650b7d454d74d8197262dd8bbabe4cf25b46972fb669e6098c2ad4947f739407369cfb9806d3b95249a258b73221d66a5e7b17093f3'
            '1ecbd7a28489ce68939a78eeeafd0a4b0064b26dd68cd8df661effa3729fa9c087211c1758db98289d3ec6f9f9071fea0f815ed57fa6188ef5fcca3f85ef6e9d'
            'cc33f1db2b449e1e277100fd87e099a4addbfef69e8ba77f92f30b5e2273aee31d04a09c26a3175ad1d2b269764df57934107d55cc615f121529ed0a42c34524'
            'f649ffc0c4ecdc0168aaa852751336209f4166976470a47f912550e64bbe0e0c128fc3ab7dc23d6f0fcdce56bcc2562d1e11826c5be866811eb58f5b15a5c1fd'
            '61dddce21ae29042b952f145698f47ca6dce8a6d36e1a1a60efe01bb78d6defaaa9ba3cd69314519363d6e853a9de0ef8af5154c0b3af95789dbe6f0706bfc21'
            '40b2139abe3f946c550e2b4c5e3d7360db8fecc9837defca13b445503c7a3eb05bd746dc4a11d516f575cfacb266548627feec1d29b8c21182871c20cf2f8b6e'
            '164f33f8d7e9a55acd82c789d7204f41f0a32c9aaea2b77c8ce9d6aa0eac883c77d992fa72254fad7f53177d2240dccc0d3c8a999f94aa1eaef34ab3d410240a')
