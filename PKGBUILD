# Contributor: Paul Mattal <pjmattal@elys.com>
# Maintainer: Calimero <calimeroteknik@free.fr>

# Uncomment one of the following blocks to match your aufs-friendly kernel.

# for an AUFS-patched core kernel:
#_kerntree="-ARCH"
#depends=('aufs_friendly')
#makedepends=('git' 'linux-headers')

# for the kernel branded aufs_friendly:
_kerntree="-aufs_friendly"
depends=('linux-aufs_friendly')
makedepends=('git' 'linux-aufs_friendly-headers')


# Detect the installed kernel version to build for
_kernel="$(cd /usr/lib/modules;p=$(echo extramodules-*"${_kerntree}"/version);p=${p#extramodules-};echo "${p%${_kerntree}/version}")"
_kernver="${_kernel}${_kerntree}"

pkgname=aufs
pkgver=4.0_20150427
pkgrel=1
pkgdesc="Another UnionFS implementation"
arch=('i686' 'x86_64')
url="http://aufs.sourceforge.net/"
license=('GPL2')
replaces=('aufs2' 'aufs3')
conflicts=('aufs2' 'aufs3')
install='aufs.install'
options=('!makeflags' '!strip')
source=("${pkgname}::git+https://github.com/sfjro/aufs4-standalone")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  # Checkout the most recent branch for the AUFS-friendly kernel version installed
  git checkout -q "$(git for-each-ref --format='%(refname:short)' --sort=-refname:short "*/*/*/aufs${_kernel}*" --count=1)"
  echo "${_kernel}_$(sed -n '/AUFS_VERSION/s/^.*-\([0-9]*\)"$/\1/p' include/uapi/linux/aufs_type.h)"
}

build() {
  cd "${srcdir}/${pkgname}"

  sed -i 's|CONFIG_AUFS_HNOTIFY =.*|CONFIG_AUFS_HNOTIFY = y|' \
     config.mk
  sed -i 's|CONFIG_AUFS_HFSNOTIFY =.*|CONFIG_AUFS_HFSNOTIFY = y|' \
     config.mk
  sed -i 's|CONFIG_AUFS_EXPORT =.*|CONFIG_AUFS_EXPORT = y|' \
     config.mk
  sed -i 's|CONFIG_AUFS_SHWH =.*|CONFIG_AUFS_SHWH = y|' \
     config.mk
  sed -i 's|CONFIG_AUFS_BDEV_LOOP =.*|CONFIG_AUFS_BDEV_LOOP = y|' \
     config.mk
  sed -i 's|CONFIG_AUFS_BR_RAMFS =.*|CONFIG_AUFS_BR_RAMFS = y|' \
     config.mk
  sed -i 's|CONFIG_AUFS_DEBUG =.*|CONFIG_AUFS_DEBUG =|' \
     config.mk
  if [ "${CARCH}" = "x86_64" ]; then
    inot64=" y"
  else
    inot64=""
  fi
  sed -i "s|CONFIG_AUFS_INO_T_64 =.*|CONFIG_AUFS_INO_T_64 =${inot64}|" \
     config.mk
  # build, sed fixes are from gentoo portage build
  sed -i "s:aufs.ko usr/include/linux/aufs_type.h:aufs.ko:g" Makefile
  sed -i "s:__user::g" include/uapi/linux/aufs_type.h
  ln -s "/usr/lib/modules/$(</usr/lib/modules/extramodules-${_kernver}/version)/build/include/linux/mount.h" fs/mount.h
  make KDIR="/usr/lib/modules/$(</usr/lib/modules/extramodules-${_kernver}/version)/build"
}

package() {
  cd "${srcdir}/${pkgname}"

  install -D -m644 fs/aufs/aufs.ko \
    "${pkgdir}/usr/lib/modules/extramodules-${_kernver}/aufs.ko"
    #"${pkgdir}/usr/lib/modules/${_kernver}/kernel/fs/aufs/aufs.ko"

  # tweak the install script for the right kernel version
  sed -i -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" "${startdir}/aufs.install"

  # install include file
  install -D -m 644 include/uapi/linux/aufs_type.h "${pkgdir}/usr/include/linux/aufs_type.h"

  # gzip -9 the module
  find "${pkgdir}" -name '*.ko' -exec gzip -9 {} \;
}
