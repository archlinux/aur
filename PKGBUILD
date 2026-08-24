# Maintainer: Chris Billington <chrisjbillington@gmail.com>
_pkgname=linux-hardened
_pkgver=7.1.9.hardened1
_kernver=7.1.9
_hardenedver=hardened1
_pkgrel=1
pkgbase="${_pkgname}-versioned-bin"
_KERNNAME=7.1.9-hardened1-1-hardened
_versioned_pkgname="linux${_pkgver}-${_pkgrel}-hardened"
pkgname=("${_pkgname}-versioned-bin"
         "${_pkgname}-versioned-headers-bin"
         "${_pkgname}-versioned-docs-bin"
         "${_versioned_pkgname}-bin"
         "${_versioned_pkgname}-headers-bin"
         "${_versioned_pkgname}-docs-bin")
pkgver=${_pkgver}
pkgrel=${_pkgrel}
pkgdesc="The Security-Hardened Linux kernel and modules | repackaged with a unique package name for each version"
url="https://github.com/anthraxx/linux-hardened"
arch=(x86_64)
license=(GPL2)
options=('!strip')

_kernpkg=linux-hardened-7.1.9.hardened1-1-x86_64.pkg.tar.zst
_headerspkg=linux-hardened-headers-7.1.9.hardened1-1-x86_64.pkg.tar.zst
_docspkg=linux-hardened-docs-7.1.9.hardened1-1-x86_64.pkg.tar.zst

source=("https://archive.archlinux.org/packages/.all/${_kernpkg}"
        "https://archive.archlinux.org/packages/.all/${_headerspkg}"
        "https://archive.archlinux.org/packages/.all/${_docspkg}")

noextract=("${source[@]##*/}")

sha256sums=('260ef210357b56f3911f602341d038da40607e6be2c76eb9a2f7108c46769fa7'
            'd7b7d88e71d2ea5a41a9d3cb56e8ab7d3abfbaae3e715dc0fefdcb57670d3601'
            'c675b2a41203207465610baafda3a658a6cd92d2ac4b3d95dec7058af43c6760')

package_linux-hardened-versioned-bin() {
  pkgdesc="Metapackage depending on ${_versioned_pkgname}-bin"  
  depends=("${_versioned_pkgname}-bin")
  optdepends=('grub-hook: to run grub-mkconfig when kernels are added/removed')
}

package_linux-hardened-versioned-headers-bin() {
  pkgdesc="Metapackage depending on ${_versioned_pkgname}-headers-bin"  
  depends=("${_versioned_pkgname}-headers-bin")
}

package_linux-hardened-versioned-docs-bin() {
  pkgdesc="Metapackage depending on ${_versioned_pkgname}-docs-bin"  
  depends=("${_versioned_pkgname}-docs-bin")
}

package_linux7.1.9.hardened1-1-hardened-bin() {
  pkgdesc="The Security-Hardened Linux kernel and modules, version ${_KERNNAME}"
  depends=(coreutils
           initramfs
           kmod)
  conflicts=("${_pkgname}")
  optdepends=('linux-firmware: firmware images needed for some devices'
              'linux-hardened-headers: headers and scripts for building modules'
              'scx-scheds: to use sched-ext schedulers'
              'usbctl: deny_new_usb control'
              'wireless-regdb: to set the correct wireless channels of your country')
  provides=(KSMBD-MODULE
            NTSYNC-MODULE
            VIRTUALBOX-GUEST-MODULES
            WIREGUARD-MODULE)
  tar -xf "${_kernpkg}" -C "${pkgdir}"
  rm "${pkgdir}"/{.MTREE,.BUILDINFO,.PKGINFO}
  sed -ic "s/${_pkgname}/${_KERNNAME}/" "${pkgdir}/usr/lib/modules/${_KERNNAME}/pkgbase"
}

package_linux7.1.9.hardened1-1-hardened-headers-bin() {
  pkgdesc="Headers and scripts for building modules for the Security-Hardened Linux kernel ${_KERNNAME}"
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

package_linux7.1.9.hardened1-1-hardened-docs-bin() {
  pkgdesc="Documentation for the Security-Hardened Linux kernel ${_KERNNAME}"
  conflicts=("${_pkgname}-docs")
  tar -xf "${_docspkg}" -C "${pkgdir}"
  rm "${pkgdir}"/{.MTREE,.BUILDINFO,.PKGINFO}
  mv "${pkgdir}/usr/share/doc/"{"${_pkgname}","${_versioned_pkgname}"}
}
