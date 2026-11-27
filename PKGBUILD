# Maintainer: Chris Billington <chrisjbillington@gmail.com>
_pkgname=linux-zen
_pkgver=7.3.6.zen1
_kernver=7.3.6
_zenver=zen1
_pkgrel=1
pkgbase="${_pkgname}-versioned-bin"
_KERNNAME=7.3.6-zen1-1-zen
_versioned_pkgname="linux${_pkgver}-${_pkgrel}-zen"
pkgname=("${_pkgname}-versioned-bin"
         "${_pkgname}-versioned-headers-bin"
         "${_pkgname}-versioned-docs-bin"
         "${_versioned_pkgname}-bin"
         "${_versioned_pkgname}-headers-bin"
         "${_versioned_pkgname}-docs-bin")
pkgver=${_pkgver}
pkgrel=${_pkgrel}
pkgdesc="The Linux ZEN kernel and modules | repackaged with a unique package name for each version"
url="https://github.com/zen-kernel/zen-kernel"
arch=(x86_64)
license=(GPL2)
options=('!strip')

_kernpkg=linux-zen-7.3.6.zen1-1-x86_64.pkg.tar.zst
_headerspkg=linux-zen-headers-7.3.6.zen1-1-x86_64.pkg.tar.zst
_docspkg=linux-zen-docs-7.3.6.zen1-1-x86_64.pkg.tar.zst

source=("https://archive.archlinux.org/packages/.all/${_kernpkg}"
        "https://archive.archlinux.org/packages/.all/${_headerspkg}"
        "https://archive.archlinux.org/packages/.all/${_docspkg}")

noextract=("${source[@]##*/}")

sha256sums=('8b520788c213ac42dcd36d96d0a6e5737190eb6f7c7838c5dd62640884ddd4b3'
            '0e782ca7a01cc9ca3ad95c4812379a64d8b1509f3b2c9116d10c5f665612d8b6'
            '0539c8a28041ddddefc74274794c1f3c43ae64aa12df5a959d74dffdfc977081')

package_linux-zen-versioned-bin() {
  pkgdesc="Metapackage depending on ${_versioned_pkgname}-bin"  
  depends=("${_versioned_pkgname}-bin")
  optdepends=('grub-hook: to run grub-mkconfig when kernels are added/removed')
}

package_linux-zen-versioned-headers-bin() {
  pkgdesc="Metapackage depending on ${_versioned_pkgname}-headers-bin"  
  depends=("${_versioned_pkgname}-headers-bin")
}

package_linux-zen-versioned-docs-bin() {
  pkgdesc="Metapackage depending on ${_versioned_pkgname}-docs-bin"  
  depends=("${_versioned_pkgname}-docs-bin")
}

package_linux7.3.6.zen1-1-zen-bin() {
  pkgdesc="The Linux ZEN kernel and modules, version ${_KERNNAME}"
  depends=(coreutils
           initramfs
           kmod)
  conflicts=("${_pkgname}")
  optdepends=('linux-firmware: firmware images needed for some devices'
              'linux-zen-headers: headers and scripts for building modules'
              'scx-scheds: to use sched-ext schedulers'
              'wireless-regdb: to set the correct wireless channels of your country')
  provides=(KSMBD-MODULE
            NTSYNC-MODULE
            VHBA-MODULE
            VIRTUALBOX-GUEST-MODULES
            WIREGUARD-MODULE)
  tar -xf "${_kernpkg}" -C "${pkgdir}"
  rm "${pkgdir}"/{.MTREE,.BUILDINFO,.PKGINFO}
  sed -ic "s/${_pkgname}/${_KERNNAME}/" "${pkgdir}/usr/lib/modules/${_KERNNAME}/pkgbase"
}

package_linux7.3.6.zen1-1-zen-headers-bin() {
  pkgdesc="Headers and scripts for building modules for the Linux ZEN kernel ${_KERNNAME}"
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

package_linux7.3.6.zen1-1-zen-docs-bin() {
  pkgdesc="Documentation for the Linux ZEN kernel ${_KERNNAME}"
  conflicts=("${_pkgname}-docs")
  tar -xf "${_docspkg}" -C "${pkgdir}"
  rm "${pkgdir}"/{.MTREE,.BUILDINFO,.PKGINFO}
  mv "${pkgdir}/usr/share/doc/"{"${_pkgname}","${_versioned_pkgname}"}
}
