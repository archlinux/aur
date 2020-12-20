# Maintainer: Ben Westover <kwestover.kw@gmail.com>

# Based on Liquorix AUR Package

### BUILD OPTIONS
# Set these variables to ANYTHING that is not null to enable them

### Tweak kernel options prior to a build via nconfig
_makenconfig=

### Tweak kernel options prior to a build via menuconfig
_makemenuconfig=

### Tweak kernel options prior to a build via xconfig
_makexconfig=

### Tweak kernel options prior to a build via gconfig
_makegconfig=

### Enable htmldocs (increases compile time)
_htmldocs_enable=

# pkgname=('linux-svelte' 'linux-svelte-headers' 'linux-svelte-docs')
_major=5.9
_srcname=linux-${_major}
_lqxpatchname=liquorix-package
_lqxpatchrel=15
_lqxpatchver=${_lqxpatchname}-${_major}-${_lqxpatchrel}
pkgbase=linux-svelte
pkgver=5.9.15
pkgrel=1
pkgdesc='Svelte Linux'
url='https://benthetechguy.github.io/miscprograms/linux-svelte/'
arch=(x86_64)
license=(GPL3)
makedepends=(bc kmod libelf cpio)
if [ -n "$_htmldocs_enable" ]; then
    makedepends+=(xmlto python-sphinx python-sphinx_rtd_theme graphviz imagemagick)
fi
options=('!strip')
_lucjanpath="https://gitlab.com/sirlucjan/kernel-patches/raw/master/${_major}"

source=("https://cdn.kernel.org/pub/linux/kernel/v5.x/${_srcname}.tar.xz"
        "https://cdn.kernel.org/pub/linux/kernel/v5.x/${_srcname}.tar.sign"
        "https://github.com/damentz/${_lqxpatchname}/archive/${_major}-${_lqxpatchrel}.tar.gz"
        "${_lucjanpath}/docs-patches/0001-Documentation-Fix-sphinx-3.0-causes-compilation-erro.patch"
        "config.src::https://github.com/benthetechguy/miscprograms/raw/master/linux-svelte/config/${pkgver}-${pkgrel}")
validpgpkeys=(
    'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linus Torvalds
    '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
)
sha512sums=('d3d92ce4246bad74c9a784212f160d98449b1e8793970c2c308276568d852b8effe0528686bdb87d55d691f09a826abf7938d69bdd4759ce65ddd5c05ffe4eca'
            'SKIP'
            'f7684e512f2b08f6dc12703a8bd3a642138ca515b9adaa391c2b709270952627063e62935bb5df4c3742c903461203d50f3ecc3978b674cd9c2460925d01c06a'
            'b1abc4b21191c841326db341aeea6eac9918a4628f38e32f616a8eeeb9919395656fc4b805110dce93aa38188172fb672831fd76e848b3711fcd6ea9115118c6'
            'e0f83631d94df06e9029873d2b4ef7e97708f015e7283f45305d9bc179a64750ea2f6fcff370ca4ccafe9866f705e73963e8b111c54a9eb7c5da948f2034a359')

export KBUILD_BUILD_HOST=manjaro
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
    cd $_srcname

    ### Set package version variables
        _abiname="$(cat ${srcdir}/${_lqxpatchver}/linux-liquorix/debian/config/defines | grep 'abiname:' | sed -r 's/abiname:\s*//')"
        _minor="$(echo "$_abiname" | cut -f1 -d .)"
        _patchrel="$(echo "$_abiname" | cut -f2 -d .)"

    ### Add Liquorix patches
        local _patchrx='^zen/v\d+\.\d+\.\d+-lqx\d+.patch$'
        local _patchfolder="${srcdir}/${_lqxpatchver}/linux-liquorix/debian/patches"
        local _patchpath="$(grep -P "$_patchrx" "$_patchfolder/series")"
        echo "Patching sources with ${_patchpath#*/}"
        patch -Np1 -i "$_patchfolder/$_patchpath"

    ### Setting version
        echo "Setting version..."
        scripts/setlocalversion --save-scmversion
        echo "-$pkgrel" > localversion.10-pkgrel
        echo "-SVELTE" > localversion.20-pkgname

    ### Patching sources
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
        cat "$srcdir"/config.src >./.config
        make olddefconfig

    ### Prepared version
        make -s kernelrelease > version
        echo "Prepared $pkgbase version $(<version)"

    ### Running make nconfig
	[[ -z "$_makenconfig" ]] ||  make nconfig

    ### Running make menuconfig
	[[ -z "$_makemenuconfig" ]] || make menuconfig

    ### Running make xconfig
	[[ -z "$_makexconfig" ]] || make xconfig

    ### Running make gconfig
	[[ -z "$_makegconfig" ]] || make gconfig

    ### Save configuration for later reuse
	cat .config > "${startdir}/config.last"
}

build() {
  cd $_srcname

  make all
  if [ -n "$_htmldocs_enable" ]; then
    make htmldocs
  fi
}

_package() {
    pkgdesc="The $pkgdesc kernel and modules"
    depends=(coreutils kmod initramfs)
    optdepends=('crda: to set the correct wireless channels of your country'
                'linux-firmware: firmware images needed for some devices'
                'sof-firmware: firmware images needed for Sound Open Firmware capable devices')
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
    depends=('linux-svelte')

  cd $_srcname
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

_package-docs() {
    pkgdesc="Documentation for the $pkgdesc kernel"
    depends=('linux-svelte')

  cd $_srcname
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

pkgname=("$pkgbase" "$pkgbase-headers" "$pkgbase-docs")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done
