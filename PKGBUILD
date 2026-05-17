# Maintainer: Chris Billington <chrisjbillington@gmail.com>
_pkgname=linux-hardened
_pkgver=7.0.8.hardened1
_kernver=7.0.8
_hardenedver=hardened1
_pkgrel=1
pkgbase="${_pkgname}-versioned-bin"
_KERNNAME=7.0.8-hardened1-1-hardened
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

_kernpkg=linux-hardened-7.0.8.hardened1-1-x86_64.pkg.tar.zst
_headerspkg=linux-hardened-headers-7.0.8.hardened1-1-x86_64.pkg.tar.zst
_docspkg=linux-hardened-docs-7.0.8.hardened1-1-x86_64.pkg.tar.zst

source=("https://archive.archlinux.org/packages/.all/${_kernpkg}"
        "https://archive.archlinux.org/packages/.all/${_headerspkg}"
        "https://archive.archlinux.org/packages/.all/${_docspkg}")

noextract=("${source[@]##*/}")

sha256sums=('75c8f66d642c630805a7a16671a55018c6eab02100ae62015d15c32f1123e6b7'
            'da1854662639ffc1e74132e37af843df57a75189bf7fdcefa599e9fad15cdc77'
            'da13a20dfe8d55a35708aacfc2d679adc5fba613ce62f3b1323a226be9499776')

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

package_linux7.0.8.hardened1-1-hardened-bin() {
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

package_linux7.0.8.hardened1-1-hardened-headers-bin() {
  pkgdesc="Headers and scripts for building modules for the Security-Hardened Linux kernel ${_KERNNAME}"
  depends=(pahole)
  conflicts=("${_pkgname}-headers")
  provides=(LINUX-HEADERS)
  tar -xf "${_headerspkg}" -C "${pkgdir}"
  rm "${pkgdir}"/{.MTREE,.BUILDINFO,.PKGINFO}
  mv "${pkgdir}/usr/src/"{"${_pkgname}","${_versioned_pkgname}"}
}

package_linux7.0.8.hardened1-1-hardened-docs-bin() {
  pkgdesc="Documentation for the Security-Hardened Linux kernel ${_KERNNAME}"
  conflicts=("${_pkgname}-docs")
  tar -xf "${_docspkg}" -C "${pkgdir}"
  rm "${pkgdir}"/{.MTREE,.BUILDINFO,.PKGINFO}
  mv "${pkgdir}/usr/share/doc/"{"${_pkgname}","${_versioned_pkgname}"}
}
