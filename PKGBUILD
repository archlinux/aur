# Maintainer: Chris Billington <chrisjbillington@gmail.com>
_pkgname=linux-hardened
_pkgver=7.2.6.hardened1
_kernver=7.2.6
_hardenedver=hardened1
_pkgrel=1
pkgbase="${_pkgname}-versioned-bin"
_KERNNAME=7.2.6-hardened1-1-hardened
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

_kernpkg=linux-hardened-7.2.6.hardened1-1-x86_64.pkg.tar.zst
_headerspkg=linux-hardened-headers-7.2.6.hardened1-1-x86_64.pkg.tar.zst
_docspkg=linux-hardened-docs-7.2.6.hardened1-1-x86_64.pkg.tar.zst

source=("https://archive.archlinux.org/packages/.all/${_kernpkg}"
        "https://archive.archlinux.org/packages/.all/${_headerspkg}"
        "https://archive.archlinux.org/packages/.all/${_docspkg}")

noextract=("${source[@]##*/}")

sha256sums=('0a7f89dd931b2def64ef2dccf548e7b6b7c89ac23365fbb83c88d2bd747a0ea8'
            '771e86058bcd828ddb2889d31c31a4800b0b3161a675fc21977ab13134b67588'
            'f67040bbab6516e1f6508140d1e761636d99ad1dc78c874fa6ed2ea1809f12fa')

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

package_linux7.2.6.hardened1-1-hardened-bin() {
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

package_linux7.2.6.hardened1-1-hardened-headers-bin() {
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

package_linux7.2.6.hardened1-1-hardened-docs-bin() {
  pkgdesc="Documentation for the Security-Hardened Linux kernel ${_KERNNAME}"
  conflicts=("${_pkgname}-docs")
  tar -xf "${_docspkg}" -C "${pkgdir}"
  rm "${pkgdir}"/{.MTREE,.BUILDINFO,.PKGINFO}
  mv "${pkgdir}/usr/share/doc/"{"${_pkgname}","${_versioned_pkgname}"}
}
