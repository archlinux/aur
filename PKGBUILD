# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Kevin Stolp <kevinstolp@gmail.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Iacopo Isimbaldi <isiachi@rhye.it>
# Contributor: Jan Houben <jan@nexttrex.de>
# Contributor: Jesus Alvarez <jeezusjr at gmail dot com>

# todo: why is -git in the middle of linux-git-headers?

_opt_DKMS=0

_opt_UTIL=2 # default 2
# 0 - zfs-utils is a separate package
# 1 - zfs-utils is a package split here
# 2 - zfs-utils is integrated into zfs-linux

_opt_git=''
_opt_git='-git'

# Additional option: see _commit below
# Commit branches with newer version numbers have both newer and older code than master.

set -u
pkgbase="zfs-linux${_opt_git}"
pkgname=("${pkgbase}")
if [ "${_opt_DKMS}" -eq 0 ]; then
  pkgname+=("${pkgbase}-headers")
fi
if [ "${_opt_UTIL}" -eq 1 ]; then
  pkgname+=("zfs-utils${_opt_git}")
fi
pkgver=2.3.99.r212.gfe674998bb
pkgrel=1
_pkgver="${pkgver%%.r*}"
#_commit="#branch=zfs-${_pkgver%.*}-release"
arch=('x86_64' 'aarch64')
url='https://zfsonlinux.org/'
license=('CDDL-1.0')
depends=('kmod' 'linux')
if [ "${_opt_UTIL}" -ge 1 ]; then
  depends+=('glibc' 'gcc-libs' 'python' 'bash' 'zlib' 'openssl' 'util-linux-libs' 'pam' 'systemd-libs' 'libtirpc')
fi
makedepends=('perl' 'python')
if [ ! -z "${_opt_git}" ]; then
  makedepends+=('git' 'linux-headers')
  _srcdir='zfs'
else
  _srcdir="zfs-${_pkgver}"
fi
#options=('!strip')
source=(
  "https://github.com/zfsonlinux/zfs/releases/download/zfs-${_pkgver}/zfs-${_pkgver}.tar.gz"
  '0001-only-build-the-module-in-dkms.conf.patch'
)
if [ "$(vercmp "${_pkgver}" '0.8.3')" -eq 0 ]; then
  source+=('linux-5.5-compat-blkg_tryget.patch')
fi
source+=(
  'zfs-node-permission.conf'
  'zfs.initcpio.install'
  'zfs.initcpio.hook'
  'zfs.initcpio.zfsencryptssh.install'
)
md5sums=('SKIP'
         'f607f969110a7b36a7a45b28b1f4343d'
         '64ea2befebf1e9fa1556e464e80eb528'
         'eca615c602740315333aedd417d83541'
         'fa15be4761c8a56ad0177d1a06a4c7f8'
         '2c11143d6d54c817f77efd1fdfea1b5c')
sha256sums=('SKIP'
            '0b28be1e55248435739c9d68fd85acd969b150a5b6216fd63d05cf892e352dac'
            '7ad45fd291aa582639725f14d88d7da5bd3d427012b25bddbe917ca6d1a07c1a'
            'da1cdc045d144d2109ec7b5d97c53a69823759d8ecff410e47c3a66b69e6518d'
            '9c20256093997f7cfa9e7eb5d85d4a712d528a6ff19ef35b83ad03fb1ceae3bc'
            'ac9ed396465e26fa6896762c52a93eb7aaf8af6d7b2c69bd826d219ff821b2c9')
b2sums=('SKIP'
        'becb6d74105f79e41b653abe41e3666d0c67c5640de30a512a425deaed83a49113526e66930a30fb0f61d04867f7b9b5c562c8638ab095f0c1be5db46cab7950'
        '7eb3408b1354a4dd504000739101afc7ec0aed1afcdfa029552bf6989e9a8cd4a95b3d3563b3fb7902afa30a80fb01a3f5a2d5af82f9c734c48b5cc23aac25ca'
        '570e995bba07ea0fb424dff191180b8017b6469501964dc0b70fd51e338a4dad260f87cc313489866cbfd1583e4aac2522cf7309c067cc5314eb83c37fe14ff3'
        'e14366cbf680e3337d3d478fe759a09be224c963cc5207bee991805312afc49a49e6691f11e5b8bbe8dde60e8d855bd96e7f4f48f24a4c6d4a8c1bab7fc2bba0'
        'fcd871d72c62a7c99d6cf29cb40a4751bfc08238ff39e8c9440d119754e92ded4705414710db86e99d044011f3524e54c778bda94696dde2c06b3289da6628d0')

_extramodules="$(uname -r)"

# Find valid installed kernel to build for next boot after upgrading kernel
_fn_calc_extramodules() {
  local _ev="${_extramodules%%-*}"
  local _fmax=''
  local _f _fv
  for _f in /usr/lib/modules/${_ev%.*}.*/build/Makefile; do
    _f="${_f#/usr/lib/modules/}"
    _f="${_f%/build/Makefile}"
    _fv="${_f%%-*}"
    if [ -z "${_fmax}" ] || [ "$(pkgver "${_ev}" "${_fmax}")" -ge 0 ]; then
      _fmax="${_f}"
    fi
  done
  if [ ! -z "${_fmax}" ] && [ "${_extramodules}" != "${_fmax}" ]; then
    set +u; msg "Found upgraded kernel ${_fmax}"; set -u
    _extramodules="${_fmax}"
  fi
}

if [ ! -z "${_opt_git}" ]; then
  source[0]="git+https://github.com/zfsonlinux/zfs.git${_commit:-}"
  md5sums[0]='SKIP'
  sha256sums[0]='SKIP'
  b2sums[0]='SKIP'
pkgver() {
  set -u
  cd "${_srcdir}"
  git describe --long | sed -e 's/^zfs-//' -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
  set +u
}
elif [ "${_pkgver}" != "${pkgver}" ]; then
pkgver() {
  set -u
  echo "${_pkgver}"
  set +u
}
fi

if [ ! -z "${HOME:-}" ]; then # block mksrcinfo
  _fn_calc_extramodules
  _fn_calc_extramodules() { true; }
  if [ "${_opt_DKMS}" -eq 0 ]; then
    pkgver+=".k${_extramodules%%-*}"
  fi
fi

prepare() {
  set -u
  cd "${_srcdir}"

  #From: Eli Schwartz <eschwartz@archlinux.org>
  #Date: Sun, 28 Oct 2018 15:01:58 -0400
  #Subject: [PATCH] only build the module in dkms.conf
  #cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
  # diff -pNaru4 'a' 'b' > '0001-only-build-the-module-in-dkms.conf.patch'
  patch -Nup1 -i "${srcdir}/0001-only-build-the-module-in-dkms.conf.patch"

  # DKMS install customized all the way back to autoconf
  local _dkmsdir="${srcdir}/dkms.Arch"
  # makepkg -i on git packages reruns prepare()
  if [ ! -z "${_opt_git}" ]; then
    rm -rf "${_dkmsdir}"
  fi
  if [ "${_opt_DKMS}" -ne 0 ] && [ ! -d "${_dkmsdir}" ]; then
    install -d "${_dkmsdir}"
    cp -rp . "${_dkmsdir}"
    pushd "${_dkmsdir}" > /dev/null
    rm -f 'configure'
    # remove unneeded sections from module build
    sed -re "/AC_CONFIG_FILES/,/]\)/{
/AC_CONFIG_FILES/n
/]\)/n
/^\s*(module\/.*)?(${pkgname%-dkms}.release|Makefile)/!d
}" -i 'configure.ac'
    popd > /dev/null
  fi
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  if [ ! -s 'configure' ]; then
    ./autogen.sh
  fi
  if [ "${_opt_DKMS}" -ne 0 ]; then
    local _dkmsdir="${srcdir}/dkms.Arch"
    pushd "${_dkmsdir}" > /dev/null
    if [ ! -s 'configure' ]; then
      ./autogen.sh
      ./scripts/dkms.mkconf -n 'zfs' -v "${_pkgver}" -f 'dkms.conf'
      if [ ! -z "${_opt_git}" ]; then
        # update metadata
        ./scripts/make_gitrev.sh
        local _meta_release="${pkgver#*.r}"
        sed -e "s/Release:[[:print:]]*/Release:      ${_meta_release/./_}/" -i 'META'
      fi
    fi
    popd > /dev/null
  fi
  if [ ! -s 'Makefile' ]; then
    _fn_calc_extramodules
    local _cf=(
      --prefix='/usr'
      --sysconfdir='/etc'
      --sbindir='/usr/bin'
      #--libdir='/usr/lib'
      #--datadir='/usr/share'
      #--includedir='/usr/include'
      #--with-mounthelperdir='/usr/bin'
      --with-udevdir='/usr/lib/udev'
      --libexecdir='/usr/lib'
      --localstatedir='/var'
      --without-libunwind
      #--with-python="$PWD/python3-fake"
      #--enable-pyzfs='no'
      --enable-systemd
      #--with-config='user'
      # kernel module build
      --with-config='kernel'
      --with-linux="/usr/lib/modules/${_extramodules}/build"
      --with-linux-obj="/usr/lib/modules/${_extramodules}/build"
    )
    if [ "${_opt_UTIL}" -ge 1 ]; then
      _cf+=(
      # utils build
      --with-config='user'
      --enable-pyzfs='no'
      --with-mounthelperdir='/usr/bin'
      # all build
      --with-config='all'
      )
      if [ "$(vercmp "${pkgver}" '0.8.0')" -le 0 ] && [ -z "${_opt_git}" ]; then
        # pyzfs is not built, but build system tries to check for python anyway
        # fixed in master
        ln -s '/bin/true' 'python3-fake'
        _cf+=(
          --with-python="${PWD}/python3-fake"
        )
      fi
    fi
    # Disable tree vectorization. Related issues:
    # https://github.com/openzfs/zfs/issues/13605
    # https://github.com/openzfs/zfs/issues/13620
    CFLAGS="${CFLAGS} -fno-tree-vectorize" \
    CXXFLAGS="${CXXFLAGS} -fno-tree-vectorize" \
    nice -n1 \
    ./configure "${_cf[@]}"
  fi
  nice -n1 make -s

  # make install is very slow. Much faster to do this once and copy
  rm -rf "${srcdir}/inst"
  install -d "${srcdir}/inst"
  make -s -j1 DESTDIR="${srcdir}/inst" install
  set +u
}

package_zfs-linux-git() {
  set -u
  pkgdesc='Kernel modules for the Zettabyte File System.'
  install='zfs.install'
  provides=("zfs=${_pkgver}" "zfs-linux=${_pkgver}" "spl=${_pkgver}")
  #groups=('archzfs-linux-git')
  conflicts=('zfs-dkms' 'zfs-dkms-git' 'zfs-dkms-rc' 'spl-dkms' 'spl-dkms-git' 'zfs-linux' 'spl-linux-git' 'spl-linux')
  replaces=('spl-linux-git')
  #if [ "${_opt_UTIL}" -le 1 ]; then
    depends+=("zfs-utils>=${_pkgver}")
  #fi

  cd "${_srcdir}"
  cp -rp "${srcdir}/inst"/* "${pkgdir}"

  _fix_modules
  if [ "${_opt_UTIL}" -eq 2 ]; then
    provides+=("zfs-utils=${_pkgver}")
    conflicts+=('zfs-linux' 'zfs-utils')
    _fix_utils
  else
    _del_utils
  fi
  _del_headers

  if [ "${_opt_DKMS}" -eq 0 ]; then
    # linux not maintained by severach are broken without provides
    if [ "$(vercmp "${_extramodules%%-*}" '4.19')" -lt 0 ]; then
      # I don't want Linux version info showing on AUR web. After a few months 'linux<0.0.0' makes it look like an out of date package.
      _fn_calc_extramodules
      local _kernelversionsmall="${_extramodules}"
      _kernelversionsmall="${_kernelversionsmall%%-*}"
      _kernelversionsmall="${_kernelversionsmall%.0}" # trim 4.0.0 -> 4.0, 4.1.0 -> 4.1
      # prevent the mksrcinfo bash emulator from getting these vars!
      #eval 'conf''licts+=("linux>${_kernelversionsmall}" "linux<${_kernelversionsmall}")'
      eval 'dep''ends+=("linux=${_kernelversionsmall}")'
    fi
  else
    depends+=('dkms')
    conflicts+=('zfs-linux-headers')
    #depends+=('lsb-release') # patched away
    _del_modules
    pushd "${srcdir}/dkms.Arch" > /dev/null
    local _dkmsdir="${pkgdir}/usr/src/zfs-${_pkgver}"
    install -d "${_dkmsdir}"/{config,scripts}
    cp -a configure dkms.conf Makefile.in META zfs_config.h.in zfs.release.in include/ module/ "${_dkmsdir}"/
    cp config/config.* config/missing config/*sh "${_dkmsdir}"/config/
    cp scripts/enum-extract.pl scripts/dkms.postbuild "${_dkmsdir}"/scripts/
    popd > /dev/null
  fi
  set +u
}
_z="$(declare -f package_zfs-linux-git)"; eval "${_z//-git/}"

_fix_modules() {
  pushd "${pkgdir}" > /dev/null
  install -d 'usr/lib'
  mv lib/* 'usr/lib/'
  rmdir 'lib'
  popd > /dev/null
}

_del_utils() {
  pushd "${pkgdir}" > /dev/null
  if [ -d 'usr/share' ]; then
    mv 'usr/lib/modules' .
    mv 'usr/src' .
    rm -r 'etc' 'usr'
    install -d 'usr/lib'
    mv 'src' 'usr/'
    mv 'modules' 'usr/lib/'
  fi
  popd > /dev/null
}

_del_headers() {
  pushd "${pkgdir}" > /dev/null
  rm -r 'usr/src'
  popd > /dev/null
}

_del_modules() {
  pushd "${pkgdir}" > /dev/null
  rm -r 'usr/lib/modules'
  rmdir --ignore-fail-on-non-empty -p 'usr/lib'
  popd > /dev/null
}

package_zfs-utils-git() {
  set -u
  pkgdesc='Userspace utilities for the Zettabyte File System.'
  depends=('systemd')
  optdepends=(
    'python: for arcstat/arc_summary/dbufstat'
  )
  provides=("${pkgname%-git}=${pkgver%%.r*}")
  conflicts=("${pkgname%-git}")
  cd "${_srcdir}"

  cp -rp "${srcdir}/inst"/* "${pkgdir}"

  _fix_utils
  _fix_modules
  _del_modules
  _del_headers
  set +u
}
_z="$(declare -f package_zfs-utils-git)"; eval "${_z//-git/}"

_fix_utils() {
  install -D -m644 contrib/bash_completion.d/zfs "${pkgdir}"/usr/share/bash-completion/completions/zfs

  # Fix for permissions being overwritten on /dev/zfs. Related issues:
  # https://github.com/openzfs/zfs/issues/15146
  # https://github.com/systemd/systemd/issues/28653
  install -D -m644 "${srcdir}"/zfs-node-permission.conf "${pkgdir}"/usr/lib/tmpfiles.d/zfs-node-permission.conf

  # Remove uneeded files
  rm -r "${pkgdir}"/etc/init.d
  rm -r "${pkgdir}"/etc/sudoers.d #???
  # We're experimenting with dracut in [extra], so start installing this.
  #rm -r "${pkgdir}"/usr/lib/dracut
  rm -r "${pkgdir}"/usr/lib/modules-load.d
  rm -r "${pkgdir}"/usr/share/initramfs-tools
  rm -r "${pkgdir}"/usr/share/zfs/zfs-tests # For zpool set compatibility

  install -D -m644 "${srcdir}"/zfs.initcpio.hook "${pkgdir}"/usr/lib/initcpio/hooks/zfs
  install -D -m644 "${srcdir}"/zfs.initcpio.install "${pkgdir}"/usr/lib/initcpio/install/zfs
  install -D -m644 "${srcdir}"/zfs.initcpio.zfsencryptssh.install "${pkgdir}"/usr/lib/initcpio/install/zfsencryptssh
}

package_zfs-linux-git-headers() {
  set -u
  pkgdesc='Kernel headers for the Zettabyte File System.'
  depends=("zfs-utils=${_pkgver}")
  provides=("zfs-headers=${_pkgver}" "zfs-linux-headers=${_pkgver}" "spl-headers=${_pkgver}")
  conflicts=('zfs-headers' 'zfs-dkms' 'zfs-dkms-git' 'zfs-dkms-rc' 'spl-dkms' 'spl-dkms-git' 'spl-headers')

  cd "${_srcdir}"
  cp -rp "${srcdir}/inst"/* "${pkgdir}/"

  _fix_modules
  _del_utils
  _del_modules

  # Remove reference to ${srcdir}
  _fn_calc_extramodules
  sed -e "s+${srcdir}++" -i "${pkgdir}"/usr/src/zfs-*/${_extramodules}/Module.symvers
  set +u
}
_z="$(declare -f package_zfs-linux-git-headers)"; eval "${_z//-git/}"
unset _z

set +u
