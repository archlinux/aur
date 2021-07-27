# Maintainer: Chris Billington <chrisjbillington@gmail.com>
_pkgname=linux
_kernver=5.13.5
_archver=arch1
_pkgrel=1
_pkgver="${_kernver}.${_archver}"
pkgbase="${_pkgname}-versioned-bin"
KERNNAME="${_kernver}-${_archver}-${_pkgrel}"
_versioned_pkgname="linux${_pkgver}-${_pkgrel}"
pkgname=("${_pkgname}-versioned-bin"
         "${_pkgname}-versioned-headers-bin"
         "${_pkgname}-versioned-docs-bin"
         "${_versioned_pkgname}-bin"
         "${_versioned_pkgname}-headers-bin"
         "${_versioned_pkgname}-docs-bin")
pkgver=${_pkgver}
pkgrel=${_pkgrel}
pkgdesc="The Linux kernel and modules | repackaged with a unique package name for each version"
url="https://github.com/archlinux/linux/commits/v5.13.5-arch1"
arch=(x86_64)
license=(GPL2)
options=('!strip')

_kernpkg=${_pkgname}-${_pkgver}-${_pkgrel}-${arch}.pkg.tar.zst
_headerspkg=${_pkgname}-headers-${_pkgver}-${_pkgrel}-${arch}.pkg.tar.zst
_docspkg=${_pkgname}-docs-${_pkgver}-${_pkgrel}-${arch}.pkg.tar.zst

# See if the sources are available from our own mirror:
_kernsrc=$(pacman -Spdd "${_pkgname}" 2> /dev/null)
_headerssrc=$(pacman -Spdd "${_pkgname}-headers" 2> /dev/null)
_docssrc=$(pacman -Spdd "${_pkgname}-docs" 2> /dev/null)

# If not, then use the Arch Linux archive:
if [ "$(basename "${_kernsrc}" 2> /dev/null)" != "${_kernpkg}" ]; then
  _arch_archive=https://archive.archlinux.org/packages/.all
  _kernsrc=${_arch_archive}/${_kernpkg}
  _headerssrc=${_arch_archive}/${_headerspkg}
  _docssrc=${_arch_archive}/${_docspkg}
fi

source=("${_kernsrc}"
        "${_headerssrc}"
        "${_docssrc}")

noextract=("${source[@]##*/}")

sha256sums=('cc77ac67b069b0ae424b40d2ab745c469f9952e31c19db03fbcce35f967b41ea'
            '575abab3ea79c10b7b76d506c6466d47ae60d861b88e03efc93f74a2c4d4c6ad'
            '033d062e429000b5f66da9fed0d90c3d158d6cf65e005e648f26aff7a93cd328')

package_linux-versioned-bin() {
  pkgdesc="Dummy package depending on ${_versioned_pkgname}-bin"  
  depends=("${_versioned_pkgname}-bin")
  optdepends=('grub-hook: to run grub-mkconfig when kernels are added/removed')
}

package_linux-versioned-headers-bin() {
  pkgdesc="Dummy package depending on ${_versioned_pkgname}-headers-bin"  
  depends=("${_versioned_pkgname}-headers-bin")
}

package_linux-versioned-docs-bin() {
  pkgdesc="Dummy package depending on ${_versioned_pkgname}-docs-bin"  
  depends=("${_versioned_pkgname}-docs-bin")
}

package_linux5.13.5.arch1-1-bin() {
  pkgdesc="The Linux kernel and modules, version ${KERNNAME}"
  depends=(coreutils
           initramfs
           kmod)
  conflicts=("${_pkgname}")
  optdepends=('crda: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices')
  provides=(VIRTUALBOX-GUEST-MODULES
            WIREGUARD-MODULE)
  replaces=(virtualbox-guest-modules-arch
            wireguard-arch)
  tar -xf "${_kernpkg}" -C "${pkgdir}"
  rm "${pkgdir}"/{.MTREE,.BUILDINFO,.PKGINFO}
  sed -ic "s/${_pkgname}/${KERNNAME}/" "${pkgdir}/usr/lib/modules/${KERNNAME}/pkgbase"
}

package_linux5.13.5.arch1-1-headers-bin() {
  pkgdesc="Headers and scripts for building modules for the Linux kernel ${KERNNAME}"
  depends=(pahole)
  conflicts=("${_pkgname}-headers")
  tar -xf "${_headerspkg}" -C "${pkgdir}"
  rm "${pkgdir}"/{.MTREE,.BUILDINFO,.PKGINFO}
  mv "${pkgdir}/usr/src/"{"${_pkgname}","${_versioned_pkgname}"}
}

package_linux5.13.5.arch1-1-docs-bin() {
  pkgdesc="Documentation for the Linux kernel ${KERNNAME}"
  conflicts=("${_pkgname}-docs")
  tar -xf "${_docspkg}" -C "${pkgdir}"
  rm "${pkgdir}"/{.MTREE,.BUILDINFO,.PKGINFO}
  mv "${pkgdir}/usr/share/doc/"{"${_pkgname}","${_versioned_pkgname}"}
}
