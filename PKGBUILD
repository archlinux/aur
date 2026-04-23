# Maintainer: Chris Billington <chrisjbillington@gmail.com>
_pkgname=linux
_kernver=6.19.13
_archver=arch1
_pkgrel=1
_pkgver="${_kernver}.${_archver}"
_KERNNAME=6.19.13-arch1-1
pkgbase="${_pkgname}-versioned-bin"
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
url="https://github.com/archlinux/linux"
arch=(x86_64)
license=(GPL2)
options=('!strip')

_kernpkg=linux-6.19.13.arch1-1-x86_64.pkg.tar.zst
_headerspkg=linux-headers-6.19.13.arch1-1-x86_64.pkg.tar.zst
_docspkg=linux-docs-6.19.13.arch1-1-x86_64.pkg.tar.zst

source=("https://archive.archlinux.org/packages/.all/${_kernpkg}"
        "https://archive.archlinux.org/packages/.all/${_headerspkg}"
        "https://archive.archlinux.org/packages/.all/${_docspkg}")

noextract=("${source[@]##*/}")

sha256sums=('fcf9ab19b827c503a77bd222d9c1b4d0cd5718b894b3042da49f5a330e705d31'
            '8739749d19f0a2db590af2e5a448c14f8a84e725d1cfe65030b6051639dfacfd'
            '820cfa556d46698ec023783f6251a8b0cf0d568aa3dfa03fb3a56ed3dfadb7a2')

package_linux-versioned-bin() {
  pkgdesc="Metapackage depending on ${_versioned_pkgname}-bin"  
  depends=("${_versioned_pkgname}-bin")
  optdepends=('grub-hook: to run grub-mkconfig when kernels are added/removed')
}

package_linux-versioned-headers-bin() {
  pkgdesc="Metapackage depending on ${_versioned_pkgname}-headers-bin"  
  depends=("${_versioned_pkgname}-headers-bin")
}

package_linux-versioned-docs-bin() {
  pkgdesc="Metapackage depending on ${_versioned_pkgname}-docs-bin"  
  depends=("${_versioned_pkgname}-docs-bin")
}

package_linux6.19.13.arch1-1-bin() {
  pkgdesc="The Linux kernel and modules, version ${_KERNNAME}"
  depends=(coreutils
           initramfs
           kmod)
  conflicts=("${_pkgname}")
  optdepends=('linux-firmware: firmware images needed for some devices'
              'linux-headers: headers and scripts for building modules'
              'scx-scheds: to use sched-ext schedulers'
              'wireless-regdb: to set the correct wireless channels of your country')
  provides=(KSMBD-MODULE
            NTSYNC-MODULE
            VIRTUALBOX-GUEST-MODULES
            WIREGUARD-MODULE)
  replaces=(virtualbox-guest-modules-arch
            wireguard-arch)
  tar -xf "${_kernpkg}" -C "${pkgdir}"
  rm "${pkgdir}"/{.MTREE,.BUILDINFO,.PKGINFO}
  sed -ic "s/${_pkgname}/${_KERNNAME}/" "${pkgdir}/usr/lib/modules/${_KERNNAME}/pkgbase"
}

package_linux6.19.13.arch1-1-headers-bin() {
  pkgdesc="Headers and scripts for building modules for the Linux kernel ${_KERNNAME}"
  depends=(binutils
           glibc
           libelf
           libgcc
           openssl
           pahole
           xxhash
           zlib
           zstd)
  conflicts=("${_pkgname}-headers")
  provides=(LINUX-HEADERS)
  tar -xf "${_headerspkg}" -C "${pkgdir}"
  rm "${pkgdir}"/{.MTREE,.BUILDINFO,.PKGINFO}
  mv "${pkgdir}/usr/src/"{"${_pkgname}","${_versioned_pkgname}"}
}

package_linux6.19.13.arch1-1-docs-bin() {
  pkgdesc="Documentation for the Linux kernel ${_KERNNAME}"
  conflicts=("${_pkgname}-docs")
  tar -xf "${_docspkg}" -C "${pkgdir}"
  rm "${pkgdir}"/{.MTREE,.BUILDINFO,.PKGINFO}
  mv "${pkgdir}/usr/share/doc/"{"${_pkgname}","${_versioned_pkgname}"}
}
