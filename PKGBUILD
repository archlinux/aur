# Maintainer: Fernando Canata (Maintainer) <fernandocanatta5@gmail.com>
pkgbase=linux-xanmod-x64v3
pkgname=('linux-xanmod-x64v3' 'linux-xanmod-x64v3-headers')
pkgver=6.19.12
_xanmod=1
pkgrel=1
pkgdesc='XanMod Linux kernel optimized for x86-64-v3 (kernel + headers)'
arch=('x86_64')
url='https://xanmod.org/'
license=('GPL-2.0-only')

makedepends=(
  bc
  bison
  cpio
  flex
  gettext
  inetutils
  kmod
  libelf
  pahole
  perl
  python
  rsync
  tar
  xz
  zstd
)

source=(
  "https://gitlab.com/xanmod/linux/-/archive/${pkgver}-xanmod${_xanmod}/linux-${pkgver}-xanmod${_xanmod}.tar.bz2"
)

validpgpkeys=('A509E685CA6460C8E76F67812FE95BE743E321FB')

sha256sums=('ac06a50a48bf7270cdfee12663706b05e237a04c3e7b8674cc8905c7e409b1cc')

options=(
  !debug
  !strip
)

_srcname="linux-${pkgver}-xanmod${_xanmod}"

prepare() {
  cd "${srcdir}/${_srcname}"

  cp -vf CONFIGS/x86_64/config .config

  scripts/config --file .config \
    --set-str LOCALVERSION "-x64v3" \
    --set-str SYSTEM_TRUSTED_KEYS "" \
    --set-str SYSTEM_REVOCATION_KEYS "" \
    --disable DEBUG_INFO \
    --disable DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT \
    --disable DEBUG_INFO_BTF \
    --disable GDB_SCRIPTS

  yes "" | make olddefconfig
}

build() {
  cd "${srcdir}/${_srcname}"

  export KBUILD_BUILD_HOST='archlinux'
  export KBUILD_BUILD_USER="${pkgbase}"

  export KCFLAGS="${KCFLAGS} -march=x86-64-v3 -mtune=generic -O2 -pipe -ffile-prefix-map=${srcdir}=."
  export KCPPFLAGS="${KCPPFLAGS} -march=x86-64-v3 -mtune=generic -ffile-prefix-map=${srcdir}=."
  export HOSTCFLAGS="${HOSTCFLAGS} -O2 -pipe -ffile-prefix-map=${srcdir}=."
  export HOSTCXXFLAGS="${HOSTCXXFLAGS} -O2 -pipe -ffile-prefix-map=${srcdir}=."

  make -j"$(nproc)" bzImage modules
  make -j"$(nproc)" scripts
  make -j"$(nproc)" prepare modules_prepare

  [[ -f modules.order ]] && sed -i 's|^\./||' modules.order
  [[ -f modules.builtin ]] && sed -i 's|^\./||' modules.builtin
}

_package_kernel() {
  pkgdesc='The XanMod Linux kernel and modules for x86-64-v3'
  depends=('coreutils' 'kmod' 'mkinitcpio')

  cd "${srcdir}/${_srcname}"

  local _kernver
  _kernver="$(make -s kernelrelease)"

  make INSTALL_MOD_PATH="${pkgdir}/usr" INSTALL_MOD_STRIP=1 modules_install

  [[ -f "${pkgdir}/usr/lib/modules/${_kernver}/modules.order" ]] && \
    sed -i 's|^\./||' "${pkgdir}/usr/lib/modules/${_kernver}/modules.order"
  [[ -f "${pkgdir}/usr/lib/modules/${_kernver}/modules.builtin" ]] && \
    sed -i 's|^\./||' "${pkgdir}/usr/lib/modules/${_kernver}/modules.builtin"

  install -Dm644 .config "${pkgdir}/usr/lib/modules/${_kernver}/config"
  install -Dm644 System.map "${pkgdir}/usr/lib/modules/${_kernver}/System.map"
  install -Dm644 arch/x86/boot/bzImage "${pkgdir}/usr/lib/modules/${_kernver}/vmlinuz"

  install -Dm644 .config "${pkgdir}/boot/config-${pkgbase}"
  install -Dm644 System.map "${pkgdir}/boot/System.map-${pkgbase}"
  install -Dm644 arch/x86/boot/bzImage "${pkgdir}/boot/vmlinuz-${pkgbase}"

  printf '%s\n' "${pkgbase}" > "${pkgdir}/usr/lib/modules/${_kernver}/pkgbase"

  install -d "${pkgdir}/etc/mkinitcpio.d"
  cat > "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset" << EOF2
ALL_config="/etc/mkinitcpio.conf"
ALL_kver="/boot/vmlinuz-${pkgbase}"

PRESETS=('default' 'fallback')

default_image="/boot/initramfs-${pkgbase}.img"
fallback_options="-S autodetect"
fallback_image="/boot/initramfs-${pkgbase}-fallback.img"
EOF2

  rm -f "${pkgdir}/usr/lib/modules/${_kernver}/build"
  rm -f "${pkgdir}/usr/lib/modules/${_kernver}/source"
}

_package_headers() {
  pkgdesc='Headers and build scripts for XanMod Linux x86-64-v3'

  cd "${srcdir}/${_srcname}"

  local _kernver
  _kernver="$(make -s kernelrelease)"
  local _builddir="${pkgdir}/usr/lib/modules/${_kernver}/build"

  install -d "${_builddir}"
  install -d "${pkgdir}/usr/lib/modules/${_kernver}"

  install -Dm644 .config "${_builddir}/.config"
  install -Dm644 Makefile "${_builddir}/Makefile"
  install -Dm644 Module.symvers "${_builddir}/Module.symvers"
  install -Dm644 System.map "${_builddir}/System.map"

  cp -a include "${_builddir}/"
  cp -a scripts "${_builddir}/"

  install -d "${_builddir}/arch/x86"
  cp -a arch/x86/include "${_builddir}/arch/x86/"
  cp -a arch/x86/Makefile "${_builddir}/arch/x86/" 2>/dev/null || true
  cp -a arch/x86/module.lds "${_builddir}/arch/x86/" 2>/dev/null || true

  install -d "${_builddir}/tools/objtool"
  [[ -f tools/objtool/objtool ]] && install -Dm755 tools/objtool/objtool "${_builddir}/tools/objtool/objtool"
  [[ -f scripts/sign-file ]] && install -Dm755 scripts/sign-file "${_builddir}/scripts/sign-file"

  [[ -f modules.order ]] && cp -f modules.order "${_builddir}/"
  [[ -f modules.builtin ]] && cp -f modules.builtin "${_builddir}/"
  [[ -f modules.builtin.modinfo ]] && cp -f modules.builtin.modinfo "${_builddir}/"

  find "${_builddir}" -type f \( \
    -name '*.a' -o -name '*.o' -o -name '*.so' -o -name '*.so.*' \
    -o -name '*.ko' -o -name '*.ko.*' \
    -o -name 'vmlinux' -o -name 'vmlinuz' -o -name 'bzImage' \
    -o -name '*.dtb' -o -name '*.dtbo' \
  \) -delete

  find "${_builddir}" -type f -name '*.cmd' -delete

  find "${_builddir}" -type d \( \
    -name '.git' -o -name '.tmp_versions' -o -name 'Documentation' \
  \) -prune -exec rm -rf {} +

  ln -s build "${pkgdir}/usr/lib/modules/${_kernver}/source"
}

package_linux-xanmod-x64v3() {
  _package_kernel
}

package_linux-xanmod-x64v3-headers() {
  _package_headers
}
