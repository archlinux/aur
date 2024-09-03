# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: chrisl (https://aur.archlinux.org/account/chris_l)
# Contributor: Leandro Britez
# Contributor: Daniel YC Lin

_pkgname=grub4dos-efi
pkgname="${_pkgname}-git"
pkgver=r764.20240901.9115ba9
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
license=('GPL2')
backup=("boot/efi/grub4dos/menu.lst")
makedepends=(
  'git'
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
options=('!strip' '!buildflags' '!makeflags' '!lto')

source=(
  # "${_pkgname}-dos::git+https://github.com/chenall/grub4dos.git" # This fails to build.
  "${_pkgname}-efi::git+https://github.com/chenall/grub4dos.git#branch=efi"
  "preset_menu-efi.fixsearchpath.diff"
  "menu.list-efi.customisations.diff"
  "79_grub4dos"
  "menu_arch.lst"
)

sha256sums=(
  # 'SKIP'                                                              # Upstream source, default branch
  'SKIP'                                                              # Upstream source, efi branch
  '0fe8292c02e28ee181c43a694d156ccc6a16e34962d774dd745350a77eb42f09'  # preset_menu-efi.fixsearchpath.diff
  'e1c59f6c08271f11f5b8f9833a452e5d77f5f00fe5aeeea46e798cce5914b1b1'  # menu.list-efi.customisations.diff
  '2b0c54aa048efbe2dabdb4d3503788a5002a6d62252b504871833b4b470a74e6'  # "79_grub4dos"
  '457c17d8660aadeb7c6ef844319fa24ae77183b428c9ce5d438423ba75728052'  # menu_arch.lst
)


prepare() {
  cd "${srcdir}/${_pkgname}-efi"
  local _efipatch
  for _efipatch in "${srcdir}/preset_menu-efi.fixsearchpath.diff" "${srcdir}/menu.list-efi.customisations.diff"; do
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
  unset CFLAGS
  unset CFLAGS
  unset CXXFLAGS
  unset LDFLGAS
  unset CPPFLAGS
  temp_flags=(`grep -E '^CFLAGS=.+' /etc/makepkg.conf | cut -d '"' -f 2`)
  for i in ${temp_flags[@]};do [ "$i" != "-fstack-protector" ] && CFLAGS+="$i ";done
  CXXFLAGS=("`grep -E '^CXXFLAGS=.+' /etc/makepkg.conf | cut -d '"' -f 2`")
  LDFLAGS=("`grep -E '^LDFLAGS=.+' /etc/makepkg.conf | cut -d '"' -f 2`")
  CPPFLAGS=("`grep -E '^CPPFLAGS=.+' /etc/makepkg.conf | cut -d '"' -f 2`")

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
