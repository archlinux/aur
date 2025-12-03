# Maintainer: Draklien !draklien -dev -archlinux +aur &at draklien(com)!
# Inspired from old scst aur PKGBUILD by: Alex Talker !Alextalker &at gna(org)!

# These modules are provided with features very close to upstream, except :
#	- directory structure is updated (see file-hierarchy manpage for more informations)
#	- build directory structure is adapted for modular/selective compilation (dkms)
#	- target initialization pipeline is dirty patched to allow configuration tools to specify custom path
#	- upstream configuration tool is patched to provide default path to the target initialization pipeline
# P.S.: "dirty patched" as in : these patches does not \
#	match upstream source code format and guidelines, and are currently only implemented as a workaround.

# WIP
# move kernel version check to dkms compilation/installation ?

_pkgbase=scst
pkgname=(scst-dkms
            scst-local-dkms
            scst-fc-dkms
            scst-iscsi-dkms
            scst-rdma-dkms
            scst-qla2x-dkms
         scst-admin-util)

_supported_linux=
# uncomment this line if you use linux or custom build other kernel versions with "provides=(linux)"
#_supported_linux="linux<6.19"
# multiple packages versionning checks are poorly handled by pacman still as I write this.
# this package still is not compatible to newer version without upstream newer patches
#	linux vanilla could be called "pkgname=linux-vanilla  ;provides=(linux)"

# official release . commit pull stepping . patching stepping
pkgver=3.9.8.7
# do not flag out-of-date unless it is incompatible with latest kernel version, or an important upstream commit as been pushed

# increase pkgrel as you customize this package, 0 worked well so far (should be 1 officially)
pkgrel=0

url="https://github.com/SCST-project/scst"
pkgdesc="Generic SCSI Target Subsystem For Linux"

# other archs untested
arch=('x86_64')
license=(GPL-2.0-only)

# no need for iscsi digest and version parsing patches since 1ba89c391e032aba5d4be3842a1682ed897b921a and 314659ed7c7b6ca3bad2f92d2cbddd4e452ddbf1
source=("git+https://github.com/SCST-project/scst.git#commit=7d0b1d2588f98625b20b0cd508df188327531470"
        'pr_dif_vmp_files_location.patch'
#       'iscsi_kernel_digest.patch'
#       'version_parsing.patch'
        'servicing.patch.generated' # it patches AFTER building (does not apply to source)
        'scstadmin.service'
        'dkms-scst.conf'
        'smart-build'
        'clean-build'
        'dkms-local.conf'
        'dkms-fc.conf'
        'dkms-iscsi.conf'
        'dkms-rdma.conf'
        'dkms-qla2x.conf'
        )
# previously tested:
#commit=6543c4c316ebe03e6afa5235544df78c26643c14
#commit=5072f0ce5819fca7139f999c4bccd0b5cbe2a208
#commit=d0b970fad01e2869ed3fa05e5803fcdfa0e20636
#commit=17eb80e049f170120f7c0c0abfc1798a12b28700
#commit=15ebdec40398eb95c8d05940bfb9033302e45760

sha512sums=(
  'SKIP'
  'fbf75e1035bc83a12abb4714ac1692b8db1a9e2c335ca33ec54c224c9762c9a8e3b2f5d46eebb0f5d9e334fb71cac4632c60f27f86d4c1a18055401135b1f59f'
# 'a31723be32b6848030d669048f4434bb21b382f5da98a3240342760619fac383c72606d1578f09add780055b4e26b01da1f3779aa39a5d8e774821f39346b9c1'
# '7d810622b813270c02f38d904a8fc113dab4fd7a144e276238dbd038331733cb8d83a46fb953c8c5d7ea052aa5516441b8632b2c1ed0e8079dfd6108f023b47b'
  '1b9c3fb5fe6b81e22b24239fa3913f6ac5f02acee770bc67a0e5ad1e0d961081a20754167bdebdf9f9e156c41f95937de0b2cc306e2aeb252612c3984128f937'
  '7f8f6c127b68c76c7f7cfca9ef802ca7d434bf13e94ab724d06eb7fc2bcd1aefb8ef6782d64ca305e54c8134d8a117725b4d5bad03ed011dcc68ac1f964165da'
  '2c72ed03ade8e591b0efcfdae8260f053a1483f64eef1b25e342d31c334c41ce232120ad8aef00d99e4637334c2bed048245e73038e9b7f49b38ef49b5f4b717'
  '215d4bc7f652f96789ab047a2953893e501552a0e8285ef1529e29fd2d76d0264a7d1dd6c42440a35a324ad35c50c00b8cba713156ef3d39eef48509b25b5613'
  'cb8512a8c26fbea5f947e842c1fc0c84775e62cdaeaad33c8a684f4a5ff4eee1747a8022a83cf926bef03f3088dac98f78ab20ee6ba8b17afadd1c8d4a3c0ead'
  'd979a94a0e55e1f3199e31cb8eea8781ae67f4be94b3013722851833c6f8068b809b7ca425555e6ae40acb95d880c6cd41a75b5d7b4717a8023321fae2f3d7ea'
  '0531be8bd5c26dd63af87ac373d036a36cc7ad597ce9f882040e3843d2831354b6637e0c557725402dce6e2a3dc47563542aa7585118f5cd104bd09d2c351b20'
  '7bc3ec31058bc4f2d96ad90bfaf5f1babec15e8930e33f36cc302127b745786e2b2ffd889be7ba9d06b5cb662503c5d8de97921267dfa820014d85cb7a3d5321'
  '8cc7aa4603fbd2f3877118f55cf52f25678888f998eb0367059d1895a65f1532934dc9bdb9278fb5063343fbcded6217b11edc34ff45eff94ccff3d2c627250c'
  '0f15119e94f612ce545b9a4f59a5a2d3aa4fbed5edc76f4a25077c38f71cbc03529401a2a643ee96a703706c3df4afd92c65c095c8a11f90ca9ce0266e314ed2'
	)

prepare() {
  # patch scst pr_file vdev_mode_pages and dif_file directory management
  # making it reliable when /var is not mounted
  # administration utility is responsible for setting target files to permanent storage facilities
  for p in "${srcdir}"/*.patch;
  do
  	echo Applying patch $p
    patch -d ${_pkgbase} -p1 -i $p
  done

  # note that provided -admin-util package handles that correctly
  #   systemd unit create permanent directories
  #   scstadmin script is patched to update device files accordingly
}

build() {
  cd ${_pkgbase}
  make 2perf

  # prebuild scst modules infrastructure source files
  make -C scst include/build_mode.h
  make -C ${_pkgbase}/src ../include/scst_itf_ver.h
}

_scstver="${pkgver}r${pkgrel}"
package_scst-dkms() {
  pkgdesc="Generic SCSI Target Subsystem For Linux (SCST) kernel modules (dkms)"
  depends=(${_supported_linux} 'dkms')
  conflicts=("scst")
  provides=("scst=$pkgver")
  license=(GPL-2.0-only)

  # special dkms script for scst optional modules dependency handling
  install -Dm755 smart-build "${pkgdir}"/usr/lib/${pkgname}/smart-build
  install -Dm755 clean-build "${pkgdir}"/usr/lib/${pkgname}/clean-build
  # set script's /var/path names
  sed -i "s/@_PKGPATH@/${pkgname}/ ;s/@_PKGVER@/${_scstver}/" "${pkgdir}"/usr/lib/${pkgname}/{smart,clean}-build

  dkmsdir="${pkgdir}"/usr/src/${pkgname%-*}-modules-${_scstver}
  # Copy dkms.conf
  install -Dm644 dkms-scst.conf "${dkmsdir}"/dkms.conf
  ln -s "/usr/lib/${pkgname}/smart-build" "${dkmsdir}"/smart-build

  # Set name and version
  sed -e "s/@_PKGBASE@/${pkgname%-*}/" \
      -e "s/@_PKGVER@/${_scstver}/" \
      -i "${dkmsdir}"/dkms.conf

  # keep source files in a state other modules can be built from
  sed -i '/rm -f \$(SCST_INTF_VER_FILE)/d' ${_pkgbase}/scst/src/Makefile
  # fix headers location
  # note: KBUILD_EXTRA_SYMBOLS is not changed because it's natively built there
  sed -i 's@\s*-I\$(src)/\.\.@ -I$(src)@' ${_pkgbase}/scst/src/{,dev_handlers/}Kbuild
  sed -i '/SCST_INC_DIR\s*:=\s*\.\.\/include/c\SCST_INC_DIR := include' ${_pkgbase}/scst/src/Makefile

  # Copy source tree (including Makefile)
  cp -r ${_pkgbase}/scst/include "${dkmsdir}"/
  cp -r ${_pkgbase}/scst/src/* "${dkmsdir}"/
  cp ${_pkgbase}/scst/README "${dkmsdir}"/
}

package_scst-local-dkms() {
  pkgdesc="SCST local target support kernel module (dkms)"
  depends=("$_pkgbase-dkms=$pkgver" 'dkms')
  conflicts=("scst-local")
  provides=("scst-local=$pkgver")
  license=(GPL-2.0-or-later)

  dkmsdir="${pkgdir}"/usr/src/${pkgname%-*}-modules-${_scstver}
  # Copy dkms.conf
  install -Dm644 dkms-local.conf "${dkmsdir}"/dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${pkgname%-*}/" \
      -e "s/@_PKGVER@/${_scstver}/" \
      -i "${dkmsdir}"/dkms.conf

  # fix headers location
  sed -i 's@KBUILD_EXTRA_SYMBOLS\s*=\s*\$(src)/\.\./scst/src/@KBUILD_EXTRA_SYMBOLS = $(src)/scst-@
          s@\s*-I\$(src)/\.\.@ -I$(src)@' ${_pkgbase}/scst_local/Kbuild
  sed -i '/SCST_DIR\s*:=\s*\$(shell echo "\$\$PWD")\/\.\.\/scst\/src/c\SCST_DIR := $(shell echo "$$PWD")/scst' ${_pkgbase}/scst_local/Makefile

  # Copy source files (including Makefile)
  find -H ${_pkgbase}/scst_local -mindepth 1 -maxdepth 1 -type f -exec cp {} "${dkmsdir}"/ \;
  # Use scst-dkms base source directory
  ln -s "/usr/src/$_pkgbase-modules-${_scstver}/" "${dkmsdir}"/scst
}

package_scst-fc-dkms() {
  pkgdesc="SCST fibre-channel target support kernel module (dkms)"
  depends=("$_pkgbase-dkms=$pkgver" 'dkms')
  conflicts=("scst-fc")
  provides=("scst-fc=$pkgver")
  license=(GPL-2.0-only)

  dkmsdir="${pkgdir}"/usr/src/${pkgname%-*}-modules-${_scstver}
  # Copy dkms.conf
  install -Dm644 dkms-fc.conf "${dkmsdir}"/dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${pkgname%-*}/" \
      -e "s/@_PKGVER@/${_scstver}/" \
      -i "${dkmsdir}"/dkms.conf

  # fix headers location
  sed -i 's@KBUILD_EXTRA_SYMBOLS\s*=\s*\$(src)/\.\./scst/src/@KBUILD_EXTRA_SYMBOLS = $(src)/scst-@
          s@\s*-I\$(src)/\.\.@ -I$(src)@' ${_pkgbase}/fcst/Kbuild
  sed -i '/SCST_DIR\s*:=\s*\$(shell echo "\$\$PWD")\/\.\.\/scst\/src/c\SCST_DIR := $(shell echo "$$PWD")/scst' ${_pkgbase}/fcst/Makefile

  # Copy source files (including Makefile)
  find -H ${_pkgbase}/fcst -mindepth 1 -maxdepth 1 -type f -exec cp {} "${dkmsdir}"/ \;
  # Use scst-dkms base source directory
  ln -s "/usr/src/$_pkgbase-modules-${_scstver}/" "${dkmsdir}"/scst
}

package_scst-rdma-dkms() {
  pkgdesc="SCST rdma srp target support kernel module (dkms)"
  depends=("$_pkgbase-dkms=$pkgver" 'dkms')
  conflicts=("scst-rdma")
  provides=("scst-rdma=$pkgver")
  license=(GPL-2.0-only)

  dkmsdir="${pkgdir}"/usr/src/${pkgname%-*}-modules-${_scstver}
  # Copy dkms.conf
  install -Dm644 dkms-rdma.conf "${dkmsdir}"/dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${pkgname%-*}/" \
      -e "s/@_PKGVER@/${_scstver}/" \
      -i "${dkmsdir}"/dkms.conf

  # fix headers location
  sed -i 's@KBUILD_EXTRA_SYMBOLS\s*=\s*\$(src)/\.\./\.\./scst/src/@KBUILD_EXTRA_SYMBOLS = $(src)/scst-@
          s@\s*-I\$(src)/\.\./\.\.@ -I$(src)@' ${_pkgbase}/srpt/src/Kbuild
  sed -i '/SCST_DIR\s*:=\s*\$(shell echo "\$\$PWD")\/\.\.\/scst\/src/c\SCST_DIR := $(shell echo "$$PWD")/scst
          s@\$(shell pwd)/src@$(shell pwd)@' ${_pkgbase}/srpt/Makefile

  # Copy/clean source tree (including Makefile)
  cp -r ${_pkgbase}/srpt/conftest "${dkmsdir}"/
  rm "${dkmsdir}"/conftest/.gitignore
  cp -r ${_pkgbase}/srpt/src/* "${dkmsdir}"/
  rm "${dkmsdir}"/Makefile.in_kernel
  cp ${_pkgbase}/srpt/Makefile "${dkmsdir}"/
  cp ${_pkgbase}/srpt/README "${dkmsdir}"/
  cp ${_pkgbase}/srpt/LICENSE "${dkmsdir}"/
  # Use scst-dkms base source directory
  ln -s "/usr/src/$_pkgbase-modules-${_scstver}/" "${dkmsdir}"/scst
}

package_scst-qla2x-dkms() {
  pkgdesc="SCST qla2x00 appliance target support kernel modules (dkms)"
  depends=("$_pkgbase-dkms=$pkgver" 'dkms')
  conflicts=("scst-qla2x")
  provides=("scst-qla2x=$pkgver")
  license=(GPL-2.0-only)

  dkmsdir="${pkgdir}"/usr/src/${pkgname%-*}-modules-${_scstver}
  # Copy dkms.conf
  install -Dm644 dkms-qla2x.conf "${dkmsdir}"/dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${pkgname%-*}/" \
      -e "s/@_PKGVER@/${_scstver}/" \
      -i "${dkmsdir}"/dkms.conf

  # fix headers location
  sed -i 's@\s*-I\$(src)/\.\.@ -I$(src)@' ${_pkgbase}/qla2x00t-32gbit/Kbuild
  sed -i 's@KBUILD_EXTRA_SYMBOLS\s*=\s*\$(src)/\.\./\.\./scst/src/@KBUILD_EXTRA_SYMBOLS = $(src)/../scst-@
          s@\s*-I\$(src)/\.\./\.\.@ -I$(src)/..@' ${_pkgbase}/qla2x00t-32gbit/qla2x00-target/Kbuild
  sed -i '/SCST_DIR\s*:=\s*\$(shell echo "\$\$PWD\/\.\.\/\.\.\/scst\/src")/c\SCST_DIR := $(shell echo "$$PWD")/../scst' ${_pkgbase}/qla2x00t-32gbit/qla2x00-target/Makefile

  # Copy/clean source tree (including Makefile)
  cp -r ${_pkgbase}/qla2x00t-32gbit/qla2x00-target "${dkmsdir}"/
  find -H ${_pkgbase}/qla2x00t-32gbit -mindepth 1 -maxdepth 1 -type f -exec cp {} "${dkmsdir}"/ \;
  ln -sf "scst/include/backport.h" "${dkmsdir}"/backport.h
  rm "${dkmsdir}"/extract-qla2xxx-orig
  rm "${dkmsdir}"/generate-in-tree-patches
  rm "${dkmsdir}"/Makefile_in-tree
  # Use scst-dkms base source directory
  ln -s "/usr/src/$_pkgbase-modules-${_scstver}/" "${dkmsdir}"/scst
}


package_scst-iscsi-dkms() {
  pkgdesc="SCST iscsi/iser target support kernel modules (dkms) and daemon"
  depends=("$_pkgbase-dkms=$pkgver" 'dkms')
  conflicts=("scst-iscsi")
  provides=("scst-iscsi=$pkgver")
  license=(GPL-2.0-only)

  dkmsdir="${pkgdir}"/usr/src/${pkgname%-*}-modules-${_scstver}
  # Copy dkms.conf
  install -Dm644 dkms-iscsi.conf "${dkmsdir}"/dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${pkgname%-*}/" \
      -e "s/@_PKGVER@/${_scstver}/" \
      -i "${dkmsdir}"/dkms.conf

  # fix headers location (and Makefile clean target)
  sed -i 's@KBUILD_EXTRA_SYMBOLS\s*=\s*\$(src)/\.\./\.\./scst/src/@KBUILD_EXTRA_SYMBOLS = $(src)/scst-@
          s@\s*-I\$(src)/\.\./\.\.@ -I$(src)@
          s@\s*-I\$(src)/\.\.@ -I$(src)@' ${_pkgbase}/iscsi-scst/kernel/Kbuild
  sed -i 's@KBUILD_EXTRA_SYMBOLS\s*+=\s*\$(src)/\.\./\.\./\.\./scst/src/@KBUILD_EXTRA_SYMBOLS += $(src)/../scst-@
          s@\s*\$(src)/\.\./\.\./kernel@ $(src)/..@
          s@\s*-I\$(src)/\.\./\.\./\.\.@ -I$(src)/..@
          s@\s*-I\$(src)/\.\./\.\.@ -I$(src)/..@' ${_pkgbase}/iscsi-scst/kernel/isert-scst/Kbuild
  sed -i '/SCST_DIR\s*:=\s*\$(shell echo "\$\$PWD")\/\.\.\/scst\/src/c\SCST_DIR := $(shell echo "$$PWD")/scst
          /KMOD\s*:=\s*\$(shell pwd)\/kernel/c\KMOD := $(shell pwd)
          s@kernel kernel/isert-scst@. isert-scst@
          /wait/d
          /\$(MAKE) -C usr \$@/d' ${_pkgbase}/iscsi-scst/Makefile

  # Copy/clean source tree (including Makefile)
  cp -r ${_pkgbase}/iscsi-scst/conftest "${dkmsdir}"/
  rm "${dkmsdir}"/conftest/.gitignore
  cp -r ${_pkgbase}/iscsi-scst/include "${dkmsdir}"/
  cp -r ${_pkgbase}/iscsi-scst/kernel/* "${dkmsdir}"/
  rm "${dkmsdir}"/Makefile.in-kernel
  rm "${dkmsdir}"/isert-scst/TODO
  rm "${dkmsdir}"/isert-scst/Makefile.in-kernel
  cp ${_pkgbase}/iscsi-scst/Makefile "${dkmsdir}"/
  cp ${_pkgbase}/iscsi-scst/README "${dkmsdir}"/
  cp ${_pkgbase}/iscsi-scst/README.iser "${dkmsdir}"/
  # Use scst-dkms base source directory
  ln -s "/usr/src/$_pkgbase-modules-${_scstver}/" "${dkmsdir}"/scst

  ## compile iscsi-scst daemon
  # remove obsolete code path
  sed -i '/err = config_load(config)/d
          /{"config", required_argument, 0,/d
          /-c, --config=\[path\]/,+1d
          s@getopt_long(argc, argv, "c:fd:@getopt_long(argc, argv, "fd:@' ${_pkgbase}/iscsi-scst/usr/iscsi_scstd.c
  # remove obsolete documentation
  sed -i '/-c.*filename/,+3d
          /-c/,+1d
          /\.SH FILES/,+6d
          s@iscsi-scstd.conf@scst@' ${_pkgbase}/iscsi-scst/doc/manpages/iscsi-scstd.8

  export DESTDIR="${pkgdir}/usr"
  # fix $prefix/sbin to standard file location
  sed -i '/^SBINDIR/d' ${_pkgbase}/iscsi-scst/Makefile_user_space_only
  export SBINDIR="/lib/scst"
  export MANDIR="/share/man"
  make -C ${_pkgbase}/iscsi-scst -f Makefile_user_space_only install

  # remove obsolete features
  rm -fr "${pkgdir}"/usr/{share/man/{man5,man8/iscsi-scst-adm.8},lib/scst/iscsi-scst-adm}
}

package_scst-admin-util() {
  pkgdesc="SCST scstadmin administration utility"
  depends=("scst=$pkgver" 'perl')
  conflicts=("scst-admin-util")
  license=(GPL-2.0-only)

  export DESTDIR="${pkgdir}"
  # fix $prefix/sbin to bin # fixed since c934aee1a87d93f2cccb2fe83fb43bc6e7965792
  #sed -i '/^SBINDIR/d' ${_pkgbase}/scstadmin/scstadmin.sysfs/Makefile
  export SBINDIR="/usr/bin"
  # move scst init script to service manager agnostic location
  sed -i 's@^INITDIR :=@INITDIR ?=@' ${_pkgbase}/scstadmin/Makefile
  export INITDIR="/usr/lib/scst"
  # mandir is not relative here
  export MANDIR="${pkgdir}/usr/share/man"
  # fix perl-module install settings
  export PREFIX="/usr"
  make -C ${_pkgbase}/scstadmin install
  # remove unprefixed unrequested systemd unit file
  rm -fr "${pkgdir}"/lib
  # rename scst init script to more explicit name
  mv "${pkgdir}"/usr/lib/scst/{scst,service}

  # fix documentation about scst init script location
  sed -i 's@/etc/init\.d/scst@/usr/lib/scst/service@' "${pkgdir}"/usr/share/man/man5/scst.5

  # fix :
  #   later kernel crc32c optimization module conditions
  #   iscsi-scstd daemon file location,
  #   temporary system file location,
  #   shutdown and reloading checking and cleaning shutdown procedures,
  #	  rmmod use as we are manually removing modules in a specific order,
  		# this is mostly work around scst modules crashing host on removal (after use), remove them manually
  #   as well as "echo '-n'" typos
  # iscsi-scstd is no longer in user search paths
  patch -i "${srcdir}"/servicing.patch.generated "${pkgdir}"/usr/lib/scst/service
  # direct iscsi-scstd/iscsi-scst-adm call/use is obsolete anyway

  # systemd unit for scst
  install -Dm644 scstadmin.service "${pkgdir}"/usr/lib/systemd/system/scstadmin.service
}
