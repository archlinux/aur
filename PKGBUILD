# Maintainer: Νίκος Φυτίλης n-fit[at]live[dot]com
# Contributor: Kyle De'Vir (QuartzDragon) <kyle[dot]devir[at]mykolab[dot]com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

### BUILD OPTIONS
# Set these variables to ANYTHING that is not null to enable them

# Tweak kernel options prior to a build via nconfig
_makenconfig=

# Optionally select a sub architecture by number if building in a clean chroot
# Leaving this entry blank will require user interaction during the build
# which will cause a failure to build if using makechrootpkg. Note that the
# generic (default) option is 26.
#
# Note - the march=native option is unavailable by this method, use the nconfig
# and manually select it.
#
#  1. AMD Opteron/Athlon64/Hammer/K8 (MK8)
#  2. AMD Opteron/Athlon64/Hammer/K8 with SSE3 (MK8SSE3)
#  3. AMD 61xx/7x50/PhenomX3/X4/II/K10 (MK10)
#  4. AMD Barcelona (MBARCELONA)
#  5. AMD Bobcat (MBOBCAT)
#  6. AMD Jaguar (MJAGUAR)
#  7. AMD Bulldozer (MBULLDOZER)
#  8. AMD Piledriver (MPILEDRIVER)
#  9. AMD Steamroller (MSTEAMROLLER)
#  10. AMD Excavator (MEXCAVATOR)
#  11. AMD Zen (MZEN)
#  12. Intel P4 / older Netburst based Xeon (MPSC)
#  13. Intel Atom (MATOM)
#  14. Intel Core 2 (MCORE2)
#  15. Intel Nehalem (MNEHALEM)
#  16. Intel Westmere (MWESTMERE)
#  17. Intel Silvermont (MSILVERMONT)
#  18. Intel Sandy Bridge (MSANDYBRIDGE)
#  19. Intel Ivy Bridge (MIVYBRIDGE)
#  20. Intel Haswell (MHASWELL)
#  21. Intel Broadwell (MBROADWELL)
#  22. Intel Skylake (MSKYLAKE)
#  23. Intel Skylake X (MSKYLAKEX)
#  24. Intel Cannon Lake (MCANNONLAKE)
#  25. Intel Ice Lake (MICELAKE)
#  26. Generic-x86-64 (GENERIC_CPU)
_subarch=

# Compile ONLY probed modules
# Build in only the modules that you currently have probed in your system VASTLY
# reducing the number of modules built and the build time.
#
# WARNING - ALL modules must be probed BEFORE you begin making the pkg!
#
# To keep track of which modules are needed for your specific system/hardware,
# give module_db script a try: https://aur.archlinux.org/packages/modprobed-db
# This PKGBUILD will call it directly to probe all the modules you have logged!
#
# More at this wiki page ---> https://wiki.archlinux.org/index.php/Modprobed-db
_localmodcfg=

pkgbase=linux-mainline-bcachefs
_srcver_tag=5.4
pkgver=v5.4_rc4
pkgrel=2
arch=(x86_64)
url="https://github.com/koverstreet/bcachefs"
license=(GPL2)
makedepends=(
    xmlto
    kmod
    inetutils
    bc
    libelf
    git
)
options=('!strip')

_reponame="bcachefs"
_repo_url="https://github.com/nicman23/${_reponame}"

_reponame_gcc_patch="kernel_gcc_patch"
_repo_url_gcc_patch="https://github.com/graysky2/${_reponame_gcc_patch}"
_gcc_patch_name="enable_additional_cpu_optimizations_for_gcc_v8.1+_kernel_v4.13+.patch"
_repo_upstream="https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git"

_pkgdesc_extra="~ featuring Kent Overstreet's bcachefs filesystem"

source=(
    "git+${_repo_url_gcc_patch}"
    "upstream::git+${_repo_upstream}"
    config         # the main kernel config file
    60-linux.hook  # pacman hook for depmod
    90-linux.hook  # pacman hook for initramfs regeneration
    linux.preset   # standard config files for mkinitcpio ramdisk
)
validpgpkeys=(
    'ABAF11C65A2970B130ABE3C479BE3E4300411886'    # Linus Torvalds
    '647F28654894E3BD457199BE38DBBDC86092693E'    # Greg Kroah-Hartman
)
sha512sums=('SKIP'
            'SKIP'
            '50d550c97a61eea91139e24024a9b72d73bd36b6dbb213d10dec5b76f1baeb14ddf7aaa47473c0bb60fcbe2637134cc8e3ccb6e2b50df8a28e89527cb70b00f4'
            '7ad5be75ee422dda3b80edd2eb614d8a9181e2c8228cd68b3881e2fb95953bf2dea6cbe7900ce1013c9de89b2802574b7b24869fc5d7a95d3cc3112c4d27063a'
            '2718b58dbbb15063bacb2bde6489e5b3c59afac4c0e0435b97fe720d42c711b6bcba926f67a8687878bd51373c9cf3adb1915a11666d79ccb220bf36e0788ab7'
            '2dc6b0ba8f7dbf19d2446c5c5f1823587de89f4e28e9595937dd51a87755099656f2acec50e3e2546ea633ad1bfd1c722e0c2b91eef1d609103d8abdc0a7cbaf'
)

_kernelname=${pkgbase#linux}
: ${_kernelname:=-ARCH}

pkgver() {
  cd ../upstream
  git fetch --tags &> /dev/null

  cd ../src/upstream
  git fetch --tags &> /dev/null

  _srcver_tag=$(git tag | grep v${_srcver_tag} | grep -v '-' | sort -t. -k 1,1n -k 2,2n -k 3,3n | tail -n1)
  [ -z "$_srcver_tag" ] &&
  _srcver_tag=$(git tag | grep v${_srcver_tag} | grep '-' | tail -n1)
  msg2 $_srcver_tag
  echo "${_srcver_tag}" | sed 's/-/_/'
}

actual_prepare() {

  cd upstream
  git fetch --tags

  git remote add ${_reponame} ${_repo_url} || true
  git fetch ${_reponame} master
  git reset --hard ${_reponame}/master

  _srcver_tag=$(echo $pkgver | sed 's/_/-/')

  export EDITOR=true

  git rebase origin/master

  msg2 "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "$_kernelname" > localversion.20-pkgname

  msg2 "Setting config..."
  cp ../config .config

  if [ -n "$_subarch" ]; then
      yes "$_subarch" | make oldconfig
  else
      yes '
' | make prepare
  fi

  ### Optionally load needed modules for the make localmodconfig
  # See https://aur.archlinux.org/packages/modprobed-db
  if [ -n "$_localmodcfg" ]; then
      msg "If you have modprobed-db installed, running it in recall mode now"
      if [ -e /usr/bin/modprobed-db ]; then
          [[ -x /usr/bin/sudo ]] || {
          echo "Cannot call modprobe with sudo. Install sudo and configure it to work with this user."
          exit 1; }
          sudo /usr/bin/modprobed-db recall
          make localmodconfig
      fi
    fi

  # do not run `make olddefconfig` as it sets default options
  yes "" | make config >/dev/null

  make -s kernelrelease > ../version
  msg2 "Prepared %s version %s" "$pkgbase" "$(<../version)"

  [[ -z "$_makenconfig" ]] || make menuconfig

  # save configuration for later reuse
  cat .config > "${startdir}/config.last"
}

build() {
    ( actual_prepare )
    cd upstream
    make bzImage modules
}

_package() {
    pkgdesc="The ${pkgbase/linux/Linux} kernel and modules ${_pkgdesc_extra}"
    depends=(
        coreutils
        linux-firmware
        kmod
        mkinitcpio
        bcachefs-tools-git
    )
    optdepends=('crda: to set the correct wireless channels of your country')
    backup=("etc/mkinitcpio.d/$pkgbase.preset")
    install=linux.install

    local kernver="$(<version)"
    local modulesdir="$pkgdir/usr/lib/modules/$kernver"

    cd upstream

    msg2 "Installing boot image..."
    # systemd expects to find the kernel here to allow hibernation
    # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
    install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"
    install -Dm644 "$modulesdir/vmlinuz" "$pkgdir/boot/vmlinuz-$pkgbase"

    msg2 "Installing modules..."
    make INSTALL_MOD_PATH="$pkgdir/usr" modules_install

    # a place for external modules,
    # with version file for building modules and running depmod from hook
    local extramodules="extramodules$_kernelname"
    local extradir="$pkgdir/usr/lib/modules/$extramodules"
    install -Dt "$extradir" -m644 ../version
    ln -sr "$extradir" "$modulesdir/extramodules"

    # remove build and source links
    rm "$modulesdir"/{source,build}

    msg2 "Installing hooks..."
    # sed expression for following substitutions
    local subst="
        s|%PKGBASE%|$pkgbase|g
        s|%KERNVER%|$kernver|g
        s|%EXTRAMODULES%|$extramodules|g
    "

    # hack to allow specifying an initially nonexisting install file
    sed "$subst" "$startdir/$install" > "$startdir/$install.pkg"
    true && install=$install.pkg

    # fill in mkinitcpio preset and pacman hooks
    sed "$subst" ../linux.preset | install -Dm644 /dev/stdin \
        "$pkgdir/etc/mkinitcpio.d/$pkgbase.preset"
    sed "$subst" ../60-linux.hook | install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/libalpm/hooks/60-$pkgbase.hook"
    sed "$subst" ../90-linux.hook | install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/libalpm/hooks/90-$pkgbase.hook"

    msg2 "Fixing permissions..."
    chmod -Rc u=rwX,go=rX "$pkgdir"
}

_package-headers() {
    pkgdesc="Header files and scripts for building modules for ${pkgbase/linux/Linux} kernel ${_pkgdesc_extra}"
    provides=(
        "linux-bcachefs-git-headers=${pkgver}"
        "linux-headers=${pkgver}"
    )

    local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

    cd upstream

    msg2 "Installing build files..."
    install -Dt "$builddir" -m644 Makefile .config Module.symvers System.map vmlinux
    install -Dt "$builddir/kernel" -m644 kernel/Makefile
    install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
    cp -t "$builddir" -a scripts

    # add objtool for external module building and enabled VALIDATION_STACK option
    install -Dt "$builddir/tools/objtool" tools/objtool/objtool

    # add xfs and shmem for aufs building
    mkdir -p "$builddir"/{fs/xfs,mm}

    # ???
    mkdir "$builddir/.tmp_versions"

    msg2 "Installing headers..."
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

    msg2 "Installing KConfig files..."
    find . -name 'Kconfig*' -exec install -Dm644 {} "$builddir/{}" \;

    msg2 "Removing unneeded architectures..."
    local arch
    for arch in "$builddir"/arch/*/; do
        [[ $arch = */x86/ ]] && continue
        echo "Removing $(basename "$arch")"
        rm -r "$arch"
    done

    msg2 "Removing documentation..."
    rm -r "$builddir/Documentation"

    msg2 "Removing broken symlinks..."
    find -L "$builddir" -type l -printf 'Removing %P\n' -delete

    msg2 "Removing loose objects..."
    find "$builddir" -type f -name '*.o' -printf 'Removing %P\n' -delete

    msg2 "Stripping build tools..."
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

    msg2 "Adding symlink..."
    mkdir -p "$pkgdir/usr/src"
    ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase-$pkgver"

    msg2 "Fixing permissions..."
    chmod -Rc u=rwX,go=rX "$pkgdir"
}

_package-docs() {
    pkgdesc="Kernel hackers manual - HTML documentation that comes with the ${pkgbase/linux/Linux} kernel ${_pkgdesc_extra}"
    provides=(
        "linux-bcachefs-git-docs=${pkgver}"
        "linux-docs=${pkgver}"
    )

    local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

    cd upstream

    msg2 "Installing documentation..."
    mkdir -p "$builddir"
    cp -t "$builddir" -a Documentation

    msg2 "Adding symlink..."
    mkdir -p "$pkgdir/usr/share/doc"
    ln -sr "$builddir/Documentation" "$pkgdir/usr/share/doc/$pkgbase"

    msg2 "Fixing permissions..."
    chmod -Rc u=rwX,go=rX "$pkgdir"
}

pkgname=(
    "$pkgbase"
    "$pkgbase-headers"
#    "$pkgbase-docs"
)
for _p in "${pkgname[@]}"; do
    eval "package_$_p() {
        $(declare -f "_package${_p#$pkgbase}")
        _package${_p#$pkgbase}
    }"
done

# vim:set ts=8 sts=2 sw=2 et:
