# Maintainer: Steven Noonan <steven@uplinklabs.net>

pkgbase=linux-ec2
_branch=4.18
_build_from=tarball
#_build_from=git
#_build_from=git-mirror
pkgver=4.18.9
pkgrel=1
arch=('x86_64')
url="https://git.uplinklabs.net/steven/projects/archlinux/ec2/ec2-packages.git/tree/linux-ec2"
license=('GPL2')
makedepends=('xmlto' 'docbook-xsl' 'kmod' 'inetutils' 'bc' 'libelf')
options=('!strip')
case $_build_from in
  tarball)
    _srcname=linux-${_branch}
    source=("http://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.xz"
            "http://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.sign"
            "http://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.xz")
    sha256sums=('19d8bcf49ef530cd4e364a45b4a22fa70714b70349c8100e7308488e26f1eaf1'
                'SKIP'
                'd819e109cb892859f9ffbb4987678076e1535b9e60c12b6512d3847da43e528b')
    ;;
  git)
    _srcname=linux
    makedepends+=('git')
    source=("${_srcname}::git+https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git#branch=linux-$_branch.y")
    sha256sums=('SKIP')
    ;;
  git-mirror)
    _srcname=linux
    makedepends+=('git')
    source=("${_srcname}::git+https://git.uplinklabs.net/steven/mirrors/linux/stable/linux-stable.git#branch=linux-$_branch.y")
    sha256sums=('SKIP')
    ;;
  *)
    error "Unknown _build_from setting '$_build_from'"
    exit 1
esac

source+=(
        # the main kernel config file
        'config.x86_64'
        # pacman hook for depmod
        '60-linux.hook'
        # pacman hook for initramfs regeneration
        '90-linux.hook'
        # standard config files for mkinitcpio ramdisk
        'linux.preset'
        '0001-xhci-demote-annoying-warning.patch'
        )
sha256sums+=(
            'SKIP'
            'ae2e95db94ef7176207c690224169594d49445e04249d2499e9d2fbc117a0b21'
            '75f99f5239e03238f88d1a834c50043ec32b1dc568f2cc291b07d04718483919'
            'fc21139a4b77d2739f4aaa4e3d35229c395c311de89709904de15f653b8991fd'
            'ee24bffa6acedfd842416b66a477810108482c97808ec7db0fcc102d13319974')
validpgpkeys=(
              'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linus Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
             )

_kernelname=${pkgbase#linux}

if [[ $_build_from == git* ]]; then
  pkgver() {
    cd ${_srcname}
    git describe --always | sed 's|^v||g;s|-|_|g'
  }
fi

prepare() {
  cd ${_srcname}

  if [[ $_build_from == tarball ]]; then
    dots="${pkgver//[^.]}"
    dotcount="${#dots}"

    # add upstream patch
    if [ "$dotcount" -gt 1 ]; then
      patch -Np1 -i "${srcdir}/patch-${pkgver}"
    fi
  fi

  # add latest fixes from stable queue, if needed
  # http://git.kernel.org/?p=linux/kernel/git/stable/stable-queue.git
  patch -Np1 -i "${srcdir}/0001-xhci-demote-annoying-warning.patch"

  chmod +x tools/objtool/sync-check.sh

  cat ../config.x86_64 - >.config <<END
CONFIG_LOCALVERSION="${_kernelname}"
CONFIG_LOCALVERSION_AUTO=n
END

  # set extraversion to pkgrel
  sed -i "/^EXTRAVERSION =/s/=.*/= -${pkgrel}/" Makefile

  # don't run depmod on 'make install'. We'll do this ourselves in packaging
  sed -i '2iexit 0' scripts/depmod.sh

  # get kernel version
  make prepare
}

build() {
  cd ${_srcname}

  make ${MAKEFLAGS} LOCALVERSION= bzImage modules
}

_buildid() {
  LANG=C readelf -n $1 | sed -n '/Build ID/ { s/.*: //p; q; }'
}

_package() {
  pkgdesc="The ${pkgbase} kernel and modules"
  [ "${pkgbase}" = "linux" ] && groups=('base')
  depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
  optdepends=('crda: to set the correct wireless channels of your country')
  provides=("linux=${pkgver}")
  backup=("etc/mkinitcpio.d/${pkgbase}.preset")
  options=('strip' 'debug')
  install=linux.install

  cd ${_srcname}

  # get kernel version
  _kernver="$(make LOCALVERSION= kernelrelease)"
  _basekernel=${_kernver%%-*}
  _basekernel=${_basekernel%.*}

  mkdir -p "${pkgdir}"/{boot,usr/lib/modules}
  make LOCALVERSION= INSTALL_MOD_PATH="${pkgdir}/usr" modules_install
  cp arch/x86/boot/bzImage "${pkgdir}/boot/vmlinuz-${pkgbase}"

  # make room for external modules
  local _extramodules="extramodules-${_basekernel}${_kernelname}"
  ln -s "../${_extramodules}" "${pkgdir}/usr/lib/modules/${_kernver}/extramodules"

  # add real version for building modules and running depmod from hook
  echo "${_kernver}" |
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modules/${_extramodules}/version"

  # remove build and source links
  rm "${pkgdir}"/usr/lib/modules/${_kernver}/{source,build}

  # now we call depmod...
  depmod -b "${pkgdir}/usr" -F System.map "${_kernver}"

  # Install vmlinux in -debug
  debugpkg="${pkgdir}/../${pkgbase}-debug"
  VMLINUX_BID=$(_buildid vmlinux)

  echo $VMLINUX_BID > vmlinux.id
  install -D -m644 vmlinux.id \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/vmlinux.id"

  install -dm755 "${debugpkg}/usr/lib/debug/.build-id/${VMLINUX_BID:0:2}"
  ln -s "../../usr/lib/modules/${_kernver}/build/vmlinux" \
    "${debugpkg}/usr/lib/debug/.build-id/${VMLINUX_BID:0:2}/${VMLINUX_BID:2}"

  install -D -m755 vmlinux \
    "${debugpkg}/usr/lib/debug/usr/lib/modules/${_kernver}/build/vmlinux"

  ln -s build/vmlinux "${debugpkg}/usr/lib/debug/usr/lib/modules/${_kernver}/vmlinux"

  # Some tools expect modules to be in /lib/modules, and thus the debug
  # information in /usr/lib/debug/lib/modules.
  install -dm755 "${debugpkg}/usr/lib/debug/lib/modules"
  ln -s ../../usr/lib/modules/${_kernver} "${debugpkg}/usr/lib/debug/lib/modules/${_kernver}"

  # sed expression for following substitutions
  local _subst="
    s|%PKGBASE%|${pkgbase}|g
    s|%KERNVER%|${_kernver}|g
    s|%EXTRAMODULES%|${_extramodules}|g
  "

  # hack to allow specifying an initially nonexisting install file
  sed "${_subst}" "${startdir}/${install}" > "${startdir}/${install}.pkg"
  true && install=${install}.pkg

  # install mkinitcpio preset file
  sed "${_subst}" ../linux.preset |
    install -Dm644 /dev/stdin "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"

  # install pacman hooks
  sed "${_subst}" ../60-linux.hook |
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/60-${pkgbase}.hook"
  sed "${_subst}" ../90-linux.hook |
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/90-${pkgbase}.hook"
}

_package-headers() {
  pkgdesc="Header files and scripts for building modules for ${pkgbase} kernel"
  provides=("linux-headers=${pkgver}")
  options=('!strip')

  cd ${_srcname}
  local _builddir="${pkgdir}/usr/lib/modules/${_kernver}/build"

  install -Dt "${_builddir}" -m644 System.map Makefile .config Module.symvers
  install -Dt "${_builddir}/kernel" -m644 kernel/Makefile

  mkdir "${_builddir}/.tmp_versions"

  cp -t "${_builddir}" -a include scripts

  install -Dt "${_builddir}/arch/x86" -m644 arch/x86/Makefile
  install -Dt "${_builddir}/arch/x86/kernel" -m644 arch/x86/kernel/asm-offsets.s

  cp -t "${_builddir}/arch/x86" -a arch/x86/include

  install -Dt "${_builddir}/drivers/md" -m644 drivers/md/*.h
  install -Dt "${_builddir}/net/mac80211" -m644 net/mac80211/*.h

  # http://bugs.archlinux.org/task/13146
  install -Dt "${_builddir}/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # http://bugs.archlinux.org/task/20402
  install -Dt "${_builddir}/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "${_builddir}/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "${_builddir}/drivers/media/tuners" -m644 drivers/media/tuners/*.h

  # add xfs and shmem for aufs building
  mkdir -p "${_builddir}"/{fs/xfs,mm}

  # copy in Kconfig files
  find . -name Kconfig\* -exec install -Dm644 {} "${_builddir}/{}" \;

  # add objtool for external module building and enabled VALIDATION_STACK option
  install -Dt "${_builddir}/tools/objtool" tools/objtool/objtool

  # remove unneeded architectures
  local _arch
  for _arch in "${_builddir}"/arch/*/; do
    [[ ${_arch} == */x86/ ]] && continue
    rm -r "${_arch}"
  done

  # remove files already in linux-docs package
  rm -r "${_builddir}/Documentation"

  # remove now broken symlinks
  find -L "${_builddir}" -type l -printf 'Removing %P\n' -delete

  # Fix permissions
  chmod -R u=rwX,go=rX "${_builddir}"

  # strip scripts directory
  local _binary _strip
  while read -rd '' _binary; do
    case "$(file -bi "${_binary}")" in
      *application/x-sharedlib*)  _strip="${STRIP_SHARED}"   ;; # Libraries (.so)
      *application/x-archive*)    _strip="${STRIP_STATIC}"   ;; # Libraries (.a)
      *application/x-executable*) _strip="${STRIP_BINARIES}" ;; # Binaries
      *) continue ;;
    esac
    /usr/bin/strip ${_strip} "${_binary}"
  done < <(find "${_builddir}/scripts" -type f -perm -u+w -print0 2>/dev/null)
}

_package-docs() {
  pkgdesc="Kernel hackers manual - HTML documentation that comes with the ${pkgbase} kernel"
  provides=("linux-docs=${pkgver}")

  cd ${_srcname}
  local _builddir="${pkgdir}/usr/lib/modules/${_kernver}/build"

  mkdir -p "${_builddir}"
  cp -t "${_builddir}" -a Documentation

  # Fix permissions
  chmod -R u=rwX,go=rX "${_builddir}"
}

true && pkgname=("${pkgbase}" "${pkgbase}-headers" "${pkgbase}-docs")
for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    $(declare -f "_package${_p#${pkgbase}}")
    _package${_p#${pkgbase}}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
