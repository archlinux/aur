# Maintainer: Chris Billington <chrisjbillington@gmail.com>
_pkgname=linux-lts
_pkgver=6.12.57
_pkgrel=1
pkgbase="${_pkgname}-versioned-bin"
_KERNNAME="${_pkgver}-${_pkgrel}-lts"
_versioned_pkgname="linux${_pkgver}-${_pkgrel}-lts"
pkgname=("${_pkgname}-versioned-bin"
         "${_pkgname}-versioned-headers-bin"
         "${_pkgname}-versioned-docs-bin"
         "${_versioned_pkgname}-bin"
         "${_versioned_pkgname}-headers-bin"
         "${_versioned_pkgname}-docs-bin")
pkgver=${_pkgver}
pkgrel=${_pkgrel}
pkgdesc="The LTS Linux kernel and modules | repackaged with a unique package name for each version"
url="https://www.kernel.org"
arch=(x86_64)
license=(GPL2)
options=('!strip')

_kernpkg=linux-lts-6.12.57-1-x86_64.pkg.tar.zst
_headerspkg=linux-lts-headers-6.12.57-1-x86_64.pkg.tar.zst
_docspkg=linux-lts-docs-6.12.57-1-x86_64.pkg.tar.zst

source=("https://archive.archlinux.org/packages/.all/${_kernpkg}"
        "https://archive.archlinux.org/packages/.all/${_headerspkg}"
        "https://archive.archlinux.org/packages/.all/${_docspkg}")

noextract=("${source[@]##*/}")

sha256sums=('17670fca98483574bb2546b3e3a4c695c8939ceadb0af9224a67f170587abe7a'
            'c0ff87971ea207f0e9c2a8d6235ed022ef248973ef5d77b42e4517ffd6a6bf45'
            'ff5366fb22b63a111f1a5649486e9b41e836dd8b789be6a2693585d1f1c6fcfa')

package_linux-lts-versioned-bin() {
  pkgdesc="Metapackage depending on ${_versioned_pkgname}-bin"  
  depends=("${_versioned_pkgname}-bin")
  optdepends=('grub-hook: to run grub-mkconfig when kernels are added/removed')
}

package_linux-lts-versioned-headers-bin() {
  pkgdesc="Metapackage depending on ${_versioned_pkgname}-headers-bin"  
  depends=("${_versioned_pkgname}-headers-bin")
}

package_linux-lts-versioned-docs-bin() {
  pkgdesc="Metapackage depending on ${_versioned_pkgname}-docs-bin"  
  depends=("${_versioned_pkgname}-docs-bin")
}

package_linux6.12.57-1-lts-bin() {
  pkgdesc="The LTS Linux kernel and modules, version ${_KERNNAME}"
  depends=(coreutils
           initramfs
           kmod)
  conflicts=("${_pkgname}")
  optdepends=('linux-firmware: firmware images needed for some devices'
              'scx-scheds: to use sched-ext schedulers'
              'wireless-regdb: to set the correct wireless channels of your country')
  provides=(KSMBD-MODULE
            VIRTUALBOX-GUEST-MODULES
            WIREGUARD-MODULE)
  replaces=(wireguard-lts)
  tar -xf "${_kernpkg}" -C "${pkgdir}"
  rm "${pkgdir}"/{.MTREE,.BUILDINFO,.PKGINFO}
  sed -ic "s/${_pkgname}/${_KERNNAME}/" "${pkgdir}/usr/lib/modules/${_KERNNAME}/pkgbase"
  mv "${pkgdir}/usr/share/licenses/"{"${_pkgname}","${_versioned_pkgname}-bin"}
}

package_linux6.12.57-1-lts-headers-bin() {
  pkgdesc="Headers and scripts for building modules for the LTS Linux kernel ${_KERNNAME}"
  depends=(pahole)
  conflicts=("${_pkgname}-headers")
  tar -xf "${_headerspkg}" -C "${pkgdir}"
  rm "${pkgdir}"/{.MTREE,.BUILDINFO,.PKGINFO}
  mv "${pkgdir}/usr/src/"{"${_pkgname}","${_versioned_pkgname}"}
  mv "${pkgdir}/usr/share/licenses/"{"${_pkgname}-headers","${_versioned_pkgname}-headers-bin"}
}

package_linux6.12.57-1-lts-docs-bin() {
  pkgdesc="Documentation for the LTS Linux kernel ${_KERNNAME}"
  conflicts=("${_pkgname}-docs")
  tar -xf "${_docspkg}" -C "${pkgdir}"
  rm "${pkgdir}"/{.MTREE,.BUILDINFO,.PKGINFO}
  mv "${pkgdir}/usr/share/doc/"{"${_pkgname}","${_versioned_pkgname}"}
  mv "${pkgdir}/usr/share/licenses/"{"${_pkgname}-docs","${_versioned_pkgname}-docs-bin"}
}
