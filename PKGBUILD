# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: memoarfaa (https://github.com/memoarfaa)
# Contributor: chrisl (https://aur.archlinux.org/account/chris_l)
# Contributor: Leandro Britez
# Contributor: Daniel YC Lin

# Infrastructure to build with specific compiler due to issues with up to date GCC (see https://github.com/chenall/grub4dos/issues/444)
_compiler=gcc    # Supported: 'gcc', 'clang'.
#_compiler=clang  # Supported: 'gcc', 'clang'.
#_gccver=14       # If not set or empty, use up to date.
#_clangver=10     # If not set or empty, use up to date.
case "${_compiler}" in
  "gcc")
    _CC=gcc
    _CXX=g++
    _compilermakedep="gcc"
    if [ -n "${_gccver}" ]; then
      _CC+="-${_gccver}"
      _CXX+="-${_gccver}"
      _compilermakedep+="${_gccver}"
    fi
  ;;
  "clang")
    _CC=clang
    _CXX=clang++
    _compilermakedep="clang"
    if [ -n "${_clangver}" ]; then
      _CC+="-${_clangver}"
      _CXX+="-${_clangver}"
      _compilermakedep+="${_clangver}"
    fi
  ;;
  *)
    error "PKGBUILD: Non-supported compiler '${_compiler}' set."
    error "Aborting."
    exit 1
  ;;
esac

_pkgname=grub4dos-efi
pkgname="${_pkgname}-git"
pkgver=r770.20250819.09b91b6
pkgrel=1
pkgdesc="GRUB4DOS EFI binaries."
arch=(
  'i386'
  'i486'
  'i586'
  'i686'
  'x86_64'
)
url="http://grub4dos.chenall.net/"
license=('GPL-2.0-only')
backup=("boot/efi/grub4dos/menu.lst")
makedepends=(
  'git'
  "${_compilermakedep}"
  "clang"
  'nasm'
  'upx'
)
if [ "$CARCH" = x86_64 ]; then
  makedepends+=(
    'gcc-multilib'
    'gcc-libs-multilib'
  )
fi
optdepends=(
  "grub: For adding GRUB4DOS to the GRUB menu."
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
# options=('!strip' '!buildflags' '!makeflags' '!lto')
options+=('!strip' '!lto')

source=(
  # "${_pkgname}-dos::git+https://github.com/chenall/grub4dos.git" # This fails to build.
  "${_pkgname}-efi::git+https://github.com/chenall/grub4dos.git#branch=efi"
  "preset_menu-efi.fixsearchpath.diff"
  "menu.list-efi.customisations.diff"
  "configure_efi.fixgcc15.diff"  # By guthub-user @memoarfaa, https://github.com/memoarfaa/aur/blob/6fc12e81a141149e5ca3b60837f7c851c495e03c/configure_efi.fixgcc15.diff.
  "79_grub4dos"
  "menu_arch.lst"
)

sha256sums=(
  # 'SKIP'                                                              # Upstream source, default branch
  'SKIP'                                                              # Upstream source, efi branch
  '12543085edbcc7467a0e981e42040ee08d1026206cd4a7f8861b00c005bcef11'  # preset_menu-efi.fixsearchpath.diff
  'e79008c08505b8db515bc461e9c0e5ae65889f4ec608708f6648ad9605884eea'  # menu.list-efi.customisations.diff
  '28eb75191ee59a048becf24efc1911978722c101aea754301efe26cc623828a5'  # configure_efi.fixgcc15.diff
  '2b0c54aa048efbe2dabdb4d3503788a5002a6d62252b504871833b4b470a74e6'  # 79_grub4dos
  '457c17d8660aadeb7c6ef844319fa24ae77183b428c9ce5d438423ba75728052'  # menu_arch.lst
)

prepare() {
  export CC="${_CC}"
  export CXX="${_CXX}"

  cd "${srcdir}/${_pkgname}-efi"
  local _efipatch
  for _efipatch in "${srcdir}/preset_menu-efi.fixsearchpath.diff" "${srcdir}/configure_efi.fixgcc15.diff" "${srcdir}/menu.list-efi.customisations.diff"; do
    msg2 "Applying patch '$(basename "${_efipatch}")' ..."
    patch -Np1 --binary --follow-symlinks -i "${_efipatch}"
  done

  cd "${srcdir}"
  mkdir -p build
  local _builds
  local _build
  local _builddir
  _builds=("i386-efi" "x86_64-efi")
  for _build in "${_builds[@]}"; do
    _builddir="${srcdir}/build/${_build}"
    if [ -d "${_builddir}" ]; then
      msg2 "Removing leftover working directory 'build/${_build}' ..."
      rm -r "${_builddir}"
    fi
  done
  msg2 "Creating working directory 'build/i386-efi' ..."
  cp -a "${_pkgname}-efi" "build/i386-efi"
  mv    "build/i386-efi/stage2/Makefile.in"      "build/i386-efi/stage2/Makefile.in-x86_64"
  mv -v "build/i386-efi/stage2/Makefile.in-i386" "build/i386-efi/stage2/Makefile.in"
  msg2 "Creating working directory 'build/x86_64-efi' ..."
  cp -a "${_pkgname}-efi" "build/x86_64-efi"

  cd "${srcdir}/${_pkgname}-efi"
  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgname}-efi"

  # _ver="$(git describe  --tags | sed 's|^[vV]||' | sed 's|-g[0-9a-fA-F]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  # if [ -z "${_ver}" ]; then
  #   error "Version could not be determined."
  #   return 1
  # fi
  if [ -z "${_rev}" ]; then
    error "Git commit count could not be determined."
    return 1
  fi
  printf '%s' "r${_rev}.${_date}.${_hash}"
}

_configure_opts=(
  --prefix=/efi/grub4dos
  --enable-ext2fs
  --enable-fat
  --enable-ntfs
  --enable-ffs
  --enable-ufs2
  --enable-minix
  --enable-reiserfs
  --enable-vstafs
  --enable-jfs
  --enable-xfs
  --enable-iso9660
  --enable-ipxe
  --enable-pxe
  --enable-initrdfs
  --enable-fb
  --enable-gunzip
  --enable-md5-password
  --enable-graphics
  --enable-gfxmenu
  --enable-hercules
  --enable-serial
  --disable-serial-speed-simulation
  --enable-preset-menu=preset_menu.lst
  --enable-example-kernel
  --disable-auto-linux-mem-opt
)

_build_i386-efi() {
  cd "${srcdir}/build/i386-efi"

  ./configure "${_configure_opts[@]}"

  make -j1

  mkdir -p i386-efi
  cp -v stage2/pre_stage2.exec i386-efi/kernel.img
  case "$CARCH" in
    'i386'|'i486'|'i586'|'i686')
      ./mkimage.i386 -v -d i386-efi -p /efi/grub4dos -o 'gr4dos32.efi' -O i386-efi -c preset_menu.lst
    ;;
    'x86_64')
      ./mkimage      -v -d i386-efi -p /efi/grub4dos -o 'gr4dos32.efi' -O i386-efi -c preset_menu.lst
    ;;
  esac
}

_build_x86_64-efi() {
  cd "${srcdir}/build/x86_64-efi"

  ./configure "${_configure_opts[@]}"

  make -j1

  mkdir -p x86_64-efi
  cp -v stage2/pre_stage2.exec x86_64-efi/kernel.img
  case "$CARCH" in
    'i386'|'i486'|'i586'|'i686')
      ./mkimage.i386 -v -d x86_64-efi -p /efi/grub4dos -o 'gr4dos64.efi' -O x86_64-efi -c preset_menu.lst
    ;;
    'x86_64')
      ./mkimage      -v -d x86_64-efi -p /efi/grub4dos -o 'gr4dos64.efi' -O x86_64-efi -c preset_menu.lst
    ;;
  esac
}

build() {
  export CC="${_CC}"
  export CXX="${_CXX}"

  ## Remove some compiler options, otherwise linking/ compilation might fail:
  local _cflag _cxxflag _CFLAGS_ORIG _CXXFLAGS_ORIG
  _CFLAGS_ORIG="${CFLAGS}"
  _CXXFLAGS_ORIG="${CXXFLAGS}"
  unset CFLAGS
  unset CXXFLAGS
  for _cflag in ${_CFLAGS_ORIG}; do
    case "${_cflag}" in
      '-march'*|'-mtune'*|'-mcpu'*)
        true  # Do not add this flag.
      ;;
      '-fstack-protector')
        true  # Do not add this flag.
      ;;
      *)
        CFLAGS+=" ${_cflag}" # Add all other flags.
      ;;
    esac
  done
  for _cxxflag in ${_CXXFLAGS_ORIG}; do
    case "${_cxxflag}" in
      '-march'*|'-mtune'*|'-mcpu'*)
        true  # Do not add this flag.
      ;;
      '-fstack-protector')
        true  # Do not add this flag.
      ;;
      *)
        CXXFLAGS+=" ${_cxxflag}" # Add all other flags.
      ;;
    esac
  done

  local _NO_WERRORS _no_werror _NO_WARNINGS _no_warning _CFLAGSADDITIONS _CXXFLAGSADDITIONS
  _CFLAGSADDITIONS=" -fno-stack-protector"
  _NO_WERRORS=("incompatible-pointer-types") # See https://github.com/chenall/grub4dos/issues/444
  _NO_WARNINGS=("${_NO_WERRORS[@]}" "array-bounds" "maybe-uninitialized")
  for _no_werror in "${_NO_WERRORS[@]}"; do
    _CFLAGSADDITIONS+=" -Wno-error=${_no_werror}"
  done
  for _no_warning in "${_NO_WARNINGS[@]}"; do
    _CFLAGSADDITIONS+=" -Wno-${_no_warning}"
  done
  _CXXFLAGSADDITIONS="${_CFLAGSADDITIONS}"
  CFLAGS+="${_CFLAGSADDITIONS}"
  CXXFLAGS+="${_CXXFLAGSADDITIONS}"
  export CFLAGS
  export CXXFLAGS

  case "$CARCH" in
    'i386'|'i486'|'i586'|'i686')
      msg2 "Building i386-efi ..."
      _build_i386-efi
    ;;
    'x86_64')
      msg2 "Building x86_64-efi ..."
      _build_x86_64-efi
    ;;
  esac
}

_package_i386-efi() {
  cd "${srcdir}/build/i386-efi"

  install -Dvm755 -t "${pkgdir}/boot/efi/grub4dos"  'gr4dos32.efi'
}

_package_x86_64-efi() {
  cd "${srcdir}/build/x86_64-efi"

  install -Dvm755 -t "${pkgdir}/boot/efi/grub4dos"  'gr4dos64.efi'
}

_package_common() {
  cd "${srcdir}/${_pkgname}-efi"

  install -Dvm644 -t "${pkgdir}/boot/efi/grub4dos"  'default' 'preset_menu.lst' 'menu.lst'
  install -Dvm755 -t "${pkgdir}/etc/grub.d"  "${srcdir}/79_grub4dos"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}"      git.log AUTHORS BUGS ChangeLog* INSTALL MAINTENANCE NEWS README* THANKS TODO "${srcdir}/menu_arch.lst"
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  COPYING
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"     "${pkgdir}/usr/share/doc/${_pkgname}/COPYING"
}

package() {
  export CC="${_CC}"
  export CXX="${_CXX}"

  case "$CARCH" in
    'i386'|'i486'|'i586'|'i686')
      msg2 "Packaging i386-efi ..."
      _package_i386-efi
    ;;
    'x86_64')
      msg2 "Packaging x86_64-efi ..."
      _package_x86_64-efi
    ;;
  esac
  msg2 "Packaging common files ..."
  _package_common
}
