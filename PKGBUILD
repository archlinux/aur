# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

### BUILD OPTIONS
# Set these variables to ANYTHING that is not null to enable them

# Tweak kernel options prior to a build via nconfig
_makenconfig=

# Optionally select a sub architecture by number if building in a clean chroot
# Leaving this entry blank will require user interaction during the build
# which will cause a failure to build if using makechrootpkg. Note that the
# generic (default) option is 30.
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
#  12. AMD Zen 2 (MZEN2)
#  13. Intel P4 / older Netburst based Xeon (MPSC)
#  14. Intel Atom (MATOM)
#  15. Intel Core 2 (MCORE2)
#  16. Intel Nehalem (MNEHALEM)
#  17. Intel Westmere (MWESTMERE)
#  18. Intel Silvermont (MSILVERMONT)
#  19. Intel Goldmont (MGOLDMONT)
#  20. Intel Goldmont Plus (MGOLDMONTPLUS)
#  21. Intel Sandy Bridge (MSANDYBRIDGE)
#  22. Intel Ivy Bridge (MIVYBRIDGE)
#  23. Intel Haswell (MHASWELL)
#  24. Intel Broadwell (MBROADWELL)
#  25. Intel Skylake (MSKYLAKE)
#  26. Intel Skylake X (MSKYLAKEX)
#  27. Intel Cannon Lake (MCANNONLAKE)
#  28. Intel Ice Lake (MICELAKE)
#  29. Intel Cascade Lake (MCASCADELAKE)
#  30. Intel Cooper Lake (MCOOPERLAKE)
#  31. Intel Tiger Lake (MTIGERLAKE)
#  32. Generic-x86-64 (GENERIC_CPU)
#  33. Native optimizations autodetected by GCC (MNATIVE)
_subarch=

# Compile ONLY used modules to VASTLYreduce the number of modules built
# and the build time.
#
# To keep track of which modules are needed for your specific system/hardware,
# give module_db script a try: https://aur.archlinux.org/packages/modprobed-db
# This PKGBUILD read the database kept if it exists
#
# More at this wiki page ---> https://wiki.archlinux.org/index.php/Modprobed-db
_localmodcfg=

### IMPORTANT: Do no edit below this line unless you know what you're doing

pkgbase=linux-mainline-bcachefs
pkgver=5.9.14
_pkgverpntrel=14
pkgrel=1
_smt_nice="true"
_runqueue_sharing="mc-llc"
_timer_freq="500"
_default_cpu_gov="performance"
arch=(x86_64)
url="https://wiki.archlinux.org/index.php/Bcachefs"
license=(GPL2)
makedepends=(
  bc kmod libelf
)
options=('!strip')

#_reponame="bcachefs"
#_repo_url="https://github.com/koverstreet/$_reponame"

source=(
  "https://www.kernel.org/pub/linux/kernel/v5.x/linux-$pkgver.tar".{xz,sign}
  config
  "https://raw.githubusercontent.com/Frogging-Family/linux-tkg/master/linux-tkg-patches/5.9/0001-add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER-by.patch"
  "https://raw.githubusercontent.com/Frogging-Family/linux-tkg/master/linux-tkg-patches/5.9/0002-clear-patches.patch"
  "https://raw.githubusercontent.com/Frogging-Family/linux-tkg/master/linux-tkg-patches/5.9/0003-glitched-base.patch"
  "https://raw.githubusercontent.com/Frogging-Family/linux-tkg/master/linux-tkg-patches/5.9/0006-add-acs-overrides_iommu.patch"
  "https://raw.githubusercontent.com/Frogging-Family/linux-tkg/master/linux-tkg-patches/5.9/0007-v5.9-fsync.patch"
  "https://raw.githubusercontent.com/Frogging-Family/linux-tkg/master/linux-tkg-patches/5.9/0008-5.9-bcachefs.patch"
)

validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)
md5sums=('4727d38ee292c83c230a30a1db067983'
         'SKIP'
         'acaec169590211b789b7873145f84564'
         'a4eb432da721ad9a721d62a8bbed6d1d'
         '31a83ad2d5c11e560c7bfdfd59659c84'
         '825adea276dddc5ce88e9484d1dd4575'
         '168a924c7c83ecdc872a9a1c6d1c8bdb'
         'bc259da4c80e5847ba6b4ad21b2b3f16'
         'bff07060407a694a7bac6cbf0e75aa71')

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  echo "Remember to set _subarch and _localmodcfg, as well as _smt_nice and _runqueue_sharing"
  
  cd linux-${pkgver}

#  git init

#  git fetch --tags

#  git remote add $_reponame $_repo_url || true
#  git fetch --prune --jobs=5 --ipv4 $_reponame master
#  git reset --hard $_reponame/master

#  export EDITOR=true

#  git rebase bcachefs/master

  # fix pkgver to chosen pkgver
  sed -i "s/SUBLEVEL = 0/SUBLEVEL = $_pkgverpntrel/g" $srcdir/linux-${pkgver}/Makefile

  echo "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux}" > localversion.20-pkgname
    
#  local src
#  for src in "${source[@]}"; do
#    src="${src%%::*}"
#    src="${src##*/}"
#    [[ $src = 000*.patch ]] || continue
#    echo "Applying patch $src..."
#    patch -Np1 < "../$src"
#  done
  
  patch -Np1 -i ../0001-add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER-by.patch
  
    # TkG
  patch -Np1 -i ../0002-clear-patches.patch

  patch -Np1 -i ../0003-glitched-base.patch
  
  echo "Setting config..."
  cp ../config .config
  
  # Set some -tkg defaults
  echo "# CONFIG_DYNAMIC_FAULT is not set" >> ./.config
  sed -i -e 's/CONFIG_DEFAULT_FQ_CODEL=y/# CONFIG_DEFAULT_FQ_CODEL is not set/' ./.config
  echo "CONFIG_DEFAULT_CAKE=y" >> ./.config
  echo "CONFIG_NR_TTY_DEVICES=63" >> ./.config
  echo "CONFIG_RAID6_USE_PREFER_GEN=y" >> ./.config
  echo "# CONFIG_NTP_PPS is not set" >> ./.config
  sed -i -e 's/CONFIG_CRYPTO_LZ4=m/CONFIG_CRYPTO_LZ4=y/' ./.config
  sed -i -e 's/CONFIG_CRYPTO_LZ4HC=m/CONFIG_CRYPTO_LZ4HC=y/' ./.config
  sed -i -e 's/CONFIG_LZ4_COMPRESS=m/CONFIG_LZ4_COMPRESS=y/' ./.config
  sed -i -e 's/CONFIG_LZ4HC_COMPRESS=m/CONFIG_LZ4HC_COMPRESS=y/' ./.config
  #sed -i -e 's/CONFIG_RCU_BOOST_DELAY=500/CONFIG_RCU_BOOST_DELAY=0/' ./.config
  sed -i -e 's/# CONFIG_CMDLINE_BOOL is not set/CONFIG_CMDLINE_BOOL=y/' ./.config
  echo "CONFIG_CMDLINE=\"${_custom_commandline}\"" >> ./.config
  echo "# CONFIG_CMDLINE_OVERRIDE is not set" >> ./.config

  if [ "$_font_autoselect" != "false" ]; then
    sed -i -e 's/CONFIG_FONT_TER16x32=y/# CONFIG_FONT_TER16x32 is not set\nCONFIG_FONT_AUTOSELECT=y/' ./.config
  fi

  # Inject cpuopts options
  echo "# CONFIG_MK8SSE3 is not set" >> ./.config
  echo "# CONFIG_MK10 is not set" >> ./.config
  echo "# CONFIG_MBARCELONA is not set" >> ./.config
  echo "# CONFIG_MBOBCAT is not set" >> ./.config
  echo "# CONFIG_MJAGUAR is not set" >> ./.config
  echo "# CONFIG_MBULLDOZER is not set" >> ./.config
  echo "# CONFIG_MPILEDRIVER is not set" >> ./.config
  echo "# CONFIG_MSTEAMROLLER is not set" >> ./.config
  echo "# CONFIG_MEXCAVATOR is not set" >> ./.config
  echo "# CONFIG_MZEN is not set" >> ./.config
  echo "# CONFIG_MZEN2 is not set" >> ./.config
  echo "# CONFIG_MATOM is not set" >> ./.config
  echo "# CONFIG_MNEHALEM is not set" >> ./.config
  echo "# CONFIG_MWESTMERE is not set" >> ./.config
  echo "# CONFIG_MSILVERMONT is not set" >> ./.config
  echo "# CONFIG_MSANDYBRIDGE is not set" >> ./.config
  echo "# CONFIG_MIVYBRIDGE is not set" >> ./.config
  echo "# CONFIG_MHASWELL is not set" >> ./.config
  echo "# CONFIG_MBROADWELL is not set" >> ./.config
  echo "# CONFIG_MSKYLAKE is not set" >> ./.config
  echo "# CONFIG_MSKYLAKEX is not set" >> ./.config
  echo "# CONFIG_MCANNONLAKE is not set" >> ./.config
  echo "# CONFIG_MICELAKE is not set" >> ./.config
  echo "# CONFIG_MGOLDMONT is not set" >> ./.config
  echo "# CONFIG_MGOLDMONTPLUS is not set" >> ./.config
  echo "# CONFIG_MCASCADELAKE is not set" >> ./.config
  echo "# CONFIG_MCOOPERLAKE is not set" >> ./.config
  echo "# CONFIG_MTIGERLAKE is not set" >> ./.config
  
  # cpu opt
  if [ -n "" ] && [ "$_subarch" != "33" ]; then
    echo "# CONFIG_MNATIVE is not set" >> ./.config
  fi

  if [ -n "" ] && [ "$_subarch" != "32" ]; then
    sed -i -e 's/CONFIG_GENERIC_CPU=y/# CONFIG_GENERIC_CPU is not set/' ./.config
  fi

  if [ "$_subarch" == "33" ] || [ "$_subarch" == "" ]; then
    echo "CONFIG_MNATIVE=y" >> ./.config
  elif [ "$_subarch" == "1" ]; then
    sed -i -e 's/# CONFIG_MK8 is not set/CONFIG_MK8=y/' ./.config
  elif [ "$_subarch" == "2" ]; then
    sed -i -e 's/# CONFIG_MK8SSE3 is not set/CONFIG_MK8SSE3=y/' ./.config
  elif [ "$_subarch" == "3" ]; then
    sed -i -e 's/# CONFIG_MK10 is not set/CONFIG_MK10=y/' ./.config
  elif [ "$_subarch" == "4" ]; then
    sed -i -e 's/# CONFIG_MBARCELONA is not set/CONFIG_MBARCELONA=y/' ./.config
  elif [ "$_subarch" == "5" ]; then
    sed -i -e 's/# CONFIG_MBOBCAT is not set/CONFIG_MBOBCAT=y/' ./.config
  elif [ "$_subarch" == "6" ]; then
    sed -i -e 's/# CONFIG_MJAGUAR is not set/CONFIG_MJAGUAR=y/' ./.config
  elif [ "$_subarch" == "7" ]; then
    sed -i -e 's/# CONFIG_MBULLDOZER is not set/CONFIG_MBULLDOZER=y/' ./.config
  elif [ "$_subarch" == "8" ]; then
    sed -i -e 's/# CONFIG_MPILEDRIVER is not set/CONFIG_MPILEDRIVER=y/' ./.config
  elif [ "$_subarch" == "9" ]; then
    sed -i -e 's/# CONFIG_MSTEAMROLLER is not set/CONFIG_MSTEAMROLLER=y/' ./.config
  elif [ "$_subarch" == "10" ]; then
    sed -i -e 's/# CONFIG_MEXCAVATOR is not set/CONFIG_MEXCAVATOR=y/' ./.config
  elif [ "$_subarch" == "11" ]; then
    sed -i -e 's/# CONFIG_MZEN is not set/CONFIG_MZEN=y/' ./.config
  elif [ "$_subarch" == "12" ]; then
    sed -i -e 's/# CONFIG_MZEN2 is not set/CONFIG_MZEN2=y/' ./.config
  elif [ "$_subarch" == "13" ]; then
    sed -i -e 's/# CONFIG_MPSC is not set/CONFIG_MPSC=y/' ./.config
  elif [ "$_subarch" == "14" ]; then
    sed -i -e 's/# CONFIG_MATOM is not set/CONFIG_MATOM=y/' ./.config
  elif [ "$_subarch" == "15" ]; then
    sed -i -e 's/# CONFIG_MCORE2 is not set/CONFIG_MCORE2=y/' ./.config
  elif [ "$_subarch" == "16" ]; then
    sed -i -e 's/# CONFIG_MNEHALEM is not set/CONFIG_MNEHALEM=y/' ./.config
  elif [ "$_subarch" == "17" ]; then
    sed -i -e 's/# CONFIG_MWESTMERE is not set/CONFIG_MWESTMERE=y/' ./.config
  elif [ "$_subarch" == "18" ]; then
    sed -i -e 's/# CONFIG_MSILVERMONT is not set/CONFIG_MSILVERMONT=y/' ./.config
  elif [ "$_subarch" == "19" ]; then
    sed -i -e 's/# CONFIG_MGOLDMONT is not set/CONFIG_MGOLDMONT=y/' ./.config
  elif [ "$_subarch" == "20" ]; then
    sed -i -e 's/# CONFIG_MGOLDMONTPLUS is not set/CONFIG_MGOLDMONTPLUS=y/' ./.config
  elif [ "$_subarch" == "21" ]; then
    sed -i -e 's/# CONFIG_MSANDYBRIDGE is not set/CONFIG_MSANDYBRIDGE=y/' ./.config
  elif [ "$_subarch" == "22" ]; then
    sed -i -e 's/# CONFIG_MIVYBRIDGE is not set/CONFIG_MIVYBRIDGE=y/' ./.config
  elif [ "$_subarch" == "23" ]; then
    sed -i -e 's/# CONFIG_MHASWELL is not set/CONFIG_MHASWELL=y/' ./.config
  elif [ "$_subarch" == "24" ]; then
    sed -i -e 's/# CONFIG_MBROADWELL is not set/CONFIG_MBROADWELL=y/' ./.config
  elif [ "$_subarch" == "25" ]; then
    sed -i -e 's/# CONFIG_MSKYLAKE is not set/CONFIG_MSKYLAKE=y/' ./.config
  elif [ "$_subarch" == "26" ]; then
    sed -i -e 's/# CONFIG_MSKYLAKEX is not set/CONFIG_MSKYLAKEX=y/' ./.config
  elif [ "$_subarch" == "27" ]; then
    sed -i -e 's/# CONFIG_MCANNONLAKE is not set/CONFIG_MCANNONLAKE=y/' ./.config
  elif [ "$_subarch" == "28" ]; then
    sed -i -e 's/# CONFIG_MICELAKE is not set/CONFIG_MICELAKE=y/' ./.config
  elif [ "$_subarch" == "29" ]; then
    sed -i -e 's/# CONFIG_MCASCADELAKE is not set/CONFIG_MCASCADELAKE=y/' ./.config
  elif [ "$_subarch" == "30" ]; then
    sed -i -e 's/# CONFIG_MCOOPERLAKE is not set/CONFIG_MCOOPERLAKE=y/' ./.config
  elif [ "$_subarch" == "31" ]; then
    sed -i -e 's/# CONFIG_MTIGERLAKE is not set/CONFIG_MTIGERLAKE=y/' ./.config
  fi

  # smt nice
  if [ "$_smt_nice" == "true" ]; then
    echo "CONFIG_SMT_NICE=y" >> ./.config
  elif [ "$_smt_nice" == "false" ]; then
    echo "# CONFIG_SMT_NICE is not set" >> ./.config
  fi
  
    # rq sharing
  if [ "$_runqueue_sharing" == "none" ]; then
    echo -e "CONFIG_RQ_NONE=y\n# CONFIG_RQ_SMT is not set\n# CONFIG_RQ_MC is not set\n# CONFIG_RQ_MC_LLC is not set\n# CONFIG_RQ_SMP is not set\n# CONFIG_RQ_ALL is not set" >> ./.config
  elif [ -z "$_runqueue_sharing" ] || [ "$_runqueue_sharing" == "smt" ]; then
    echo -e "# CONFIG_RQ_NONE is not set\nCONFIG_RQ_SMT=y\n# CONFIG_RQ_MC is not set\n# CONFIG_RQ_MC_LLC is not set\n# CONFIG_RQ_SMP is not set\n# CONFIG_RQ_ALL is not set" >> ./.config
  elif [ "$_runqueue_sharing" == "mc" ]; then
    echo -e "# CONFIG_RQ_NONE is not set\n# CONFIG_RQ_SMT is not set\nCONFIG_RQ_MC=y\n# CONFIG_RQ_MC_LLC is not set\n# CONFIG_RQ_SMP is not set\n# CONFIG_RQ_ALL is not set" >> ./.config
  elif [ "$_runqueue_sharing" == "smp" ]; then
    echo -e "# CONFIG_RQ_NONE is not set\n# CONFIG_RQ_SMT is not set\n# CONFIG_RQ_MC is not set\n# CONFIG_RQ_MC_LLC is not set\nCONFIG_RQ_SMP=y\n# CONFIG_RQ_ALL is not set" >> ./.config
  elif [ "$_runqueue_sharing" == "all" ]; then
    echo -e "# CONFIG_RQ_NONE is not set\n# CONFIG_RQ_SMT is not set\n# CONFIG_RQ_MC is not set\n# CONFIG_RQ_MC_LLC is not set\n# CONFIG_RQ_SMP is not set\nCONFIG_RQ_ALL=y" >> ./.config
  elif [ "$_runqueue_sharing" == "mc-llc" ]; then
    echo -e "# CONFIG_RQ_NONE is not set\n# CONFIG_RQ_SMT is not set\n# CONFIG_RQ_MC is not set\nCONFIG_RQ_MC_LLC=y\n# CONFIG_RQ_SMP is not set\n# CONFIG_RQ_ALL is not set" >> ./.config
  fi
  
  # timer freq
  if [ -n "$_timer_freq" ] && [ "$_timer_freq" != "300" ]; then
    sed -i -e 's/CONFIG_HZ_300=y/# CONFIG_HZ_300 is not set/' ./.config
    sed -i -e 's/CONFIG_HZ_300_NODEF=y/# CONFIG_HZ_300_NODEF is not set/' ./.config
    if [ "$_timer_freq" == "1000" ]; then
      sed -i -e 's/# CONFIG_HZ_1000 is not set/CONFIG_HZ_1000=y/' ./.config
      sed -i -e 's/CONFIG_HZ=300/CONFIG_HZ=1000/' ./.config
      echo "# CONFIG_HZ_500 is not set" >> ./.config
      echo "# CONFIG_HZ_500_NODEF is not set" >> ./.config
      echo "# CONFIG_HZ_750 is not set" >> ./.config
      echo "# CONFIG_HZ_750_NODEF is not set" >> ./.config
      echo "CONFIG_HZ_1000_NODEF=y" >> ./.config
      echo "# CONFIG_HZ_250_NODEF is not set" >> ./.config
      echo "# CONFIG_HZ_300_NODEF is not set" >> ./.config
    elif [ "$_timer_freq" == "750" ]; then
      sed -i -e 's/CONFIG_HZ=300/CONFIG_HZ=750/' ./.config
      echo "# CONFIG_HZ_500 is not set" >> ./.config
      echo "# CONFIG_HZ_500_NODEF is not set" >> ./.config
      echo "CONFIG_HZ_750=y" >> ./.config
      echo "CONFIG_HZ_750_NODEF=y" >> ./.config
      echo "# CONFIG_HZ_1000_NODEF is not set" >> ./.config
      echo "# CONFIG_HZ_250_NODEF is not set" >> ./.config
      echo "# CONFIG_HZ_300_NODEF is not set" >> ./.config
    elif [ "$_timer_freq" == "500" ]; then
      sed -i -e 's/CONFIG_HZ=300/CONFIG_HZ=500/' ./.config
      echo "CONFIG_HZ_500=y" >> ./.config
      echo "CONFIG_HZ_500_NODEF=y" >> ./.config
      echo "# CONFIG_HZ_750 is not set" >> ./.config
      echo "# CONFIG_HZ_750_NODEF is not set" >> ./.config
      echo "# CONFIG_HZ_1000_NODEF is not set" >> ./.config
      echo "# CONFIG_HZ_250_NODEF is not set" >> ./.config
      echo "# CONFIG_HZ_300_NODEF is not set" >> ./.config
    elif [ "$_timer_freq" == "100" ]; then
      sed -i -e 's/CONFIG_HZ=300/CONFIG_HZ=100/' ./.config
      echo "# CONFIG_HZ_500 is not set" >> ./.config
      echo "# CONFIG_HZ_750 is not set" >> ./.config
      echo "# CONFIG_HZ_1000_NODEF is not set" >> ./.config
      echo "# CONFIG_HZ_750_NODEF is not set" >> ./.config
      echo "# CONFIG_HZ_500_NODEF is not set" >> ./.config
      echo "# CONFIG_HZ_250_NODEF is not set" >> ./.config
      echo "# CONFIG_HZ_300_NODEF is not set" >> ./.config
      echo "CONFIG_HZ_100=y" >> ./.config
      echo "CONFIG_HZ_100_NODEF=y" >> ./.config
    fi
  elif [ "${_cpusched}" == "MuQSS" ] && [ -z "$_timer_freq" ]; then
      sed -i -e 's/CONFIG_HZ=300/CONFIG_HZ=100/' ./.config
      echo "# CONFIG_HZ_500 is not set" >> ./.config
      echo "# CONFIG_HZ_750 is not set" >> ./.config
      echo "# CONFIG_HZ_1000_NODEF is not set" >> ./.config
      echo "# CONFIG_HZ_750_NODEF is not set" >> ./.config
      echo "# CONFIG_HZ_500_NODEF is not set" >> ./.config
      echo "# CONFIG_HZ_250_NODEF is not set" >> ./.config
      echo "# CONFIG_HZ_300_NODEF is not set" >> ./.config
      echo "CONFIG_HZ_100=y" >> ./.config
      echo "CONFIG_HZ_100_NODEF=y" >> ./.config
  else
    sed -i -e 's/CONFIG_HZ_300=y/# CONFIG_HZ_300 is not set/' ./.config
    sed -i -e 's/CONFIG_HZ_300_NODEF=y/# CONFIG_HZ_300_NODEF is not set/' ./.config
    sed -i -e 's/CONFIG_HZ=300/CONFIG_HZ=500/' ./.config
    echo "CONFIG_HZ_500=y" >> ./.config
    echo "CONFIG_HZ_500_NODEF=y" >> ./.config
    echo "# CONFIG_HZ_250_NODEF is not set" >> ./.config
    echo "# CONFIG_HZ_300_NODEF is not set" >> ./.config
  fi

    # default cpu gov
  if [ "$_default_cpu_gov" == "performance" ]; then
    sed -i -e 's/CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL=y/# CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set/' ./.config
    sed -i -e 's/# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set/CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y/' ./.config
  elif [ "$_default_cpu_gov" == "ondemand" ]; then
    sed -i -e 's/CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL=y/# CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set/' ./.config
    sed -i -e 's/# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set/CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y/' ./.config
  fi
  
  # disable numa
    sed -i -e 's/CONFIG_NUMA=y/# CONFIG_NUMA is not set/' \
        -i -e '/CONFIG_AMD_NUMA=y/d' \
        -i -e '/CONFIG_X86_64_ACPI_NUMA=y/d' \
        -i -e '/CONFIG_NODES_SPAN_OTHER_NODES=y/d' \
        -i -e '/# CONFIG_NUMA_EMU is not set/d' \
        -i -e '/CONFIG_NODES_SHIFT=6/d' \
        -i -e '/CONFIG_NEED_MULTIPLE_NODES=y/d' \
        -i -e '/CONFIG_USE_PERCPU_NUMA_NODE_ID=y/d' \
        -i -e '/CONFIG_ACPI_NUMA=y/d' ./.config
    
  # acs override
  patch -Np1 -i ../0006-add-acs-overrides_iommu.patch
  
  # fsync support
  patch -Np1 -i ../0007-v5.9-fsync.patch

  # bcachefs
  patch -Np1 -i ../0008-5.9-bcachefs.patch
  
  # https://bbs.archlinux.org/viewtopic.php?pid=1824594#p1824594
  sed -i -e 's/# CONFIG_PSI_DEFAULT_DISABLED is not set/CONFIG_PSI_DEFAULT_DISABLED=y/' ./.config

  # https://bbs.archlinux.org/viewtopic.php?pid=1863567#p1863567
  sed -i -e '/CONFIG_LATENCYTOP=/ s,y,n,' \
      -i -e '/CONFIG_SCHED_DEBUG=/ s,y,n,' ./.config

  make prepare
  
  ### Optionally load needed modules for the make localmodconfig
  # See https://aur.archlinux.org/packages/modprobed-db
    if [ -n "$_localmodcfg" ]; then
      if [ -f $HOME/.config/modprobed.db ]; then
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

  # save configuration for later reuse
  cat .config > "${startdir}/config.last"
}

build() {
  echo "Remember to set _subarch and _localmodcfg, as well as _smt_nice and _runqueue_sharing"
  
  cd linux-${pkgver}
  make all
}

_package() {
  pkgdesc="The ${pkgbase/linux/Linux} kernel and modules with the ck1 patchset featuring MuQSS CPU scheduler"
  depends=(coreutils kmod initramfs)
  optdepends=('crda: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices')
  provides=("linux-mainline-bcachefs=${pkgver}")
  #groups=('ck-generic')

  cd linux-${pkgver}

  local kernver="$(<version)"
  local modulesdir="$pkgdir/usr/lib/modules/$kernver"

  echo "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  #install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"
  #
  # hard-coded path in case user defined CC=xxx for build which causes errors
  # see this FS https://bugs.archlinux.org/task/64315
  install -Dm644 arch/x86/boot/bzImage "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  echo "Installing modules..."
  make INSTALL_MOD_PATH="$pkgdir/usr" modules_install

  # remove build and source links
  rm "$modulesdir"/{source,build}
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for ${pkgbase/linux/Linux} kernel"
  depends=('linux-mainline-bcachefs') # added to keep kernel and headers packages matched
  provides=("linux-mainline-bcachefs-headers=${pkgver}")
  #groups=('ck-generic')

  cd linux-${pkgver}
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

# vim:set ts=8 sts=2 sw=2 et:
