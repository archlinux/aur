# Maintainer: Chris Billington <chrisjbillington@gmail.com>
_pkgname=linux-lts
_pkgver=6.12.58
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

_kernpkg=linux-lts-6.12.58-1-x86_64.pkg.tar.zst
_headerspkg=linux-lts-headers-6.12.58-1-x86_64.pkg.tar.zst
_docspkg=linux-lts-docs-6.12.58-1-x86_64.pkg.tar.zst

source=("https://archive.archlinux.org/packages/.all/${_kernpkg}"
        "https://archive.archlinux.org/packages/.all/${_headerspkg}"
        "https://archive.archlinux.org/packages/.all/${_docspkg}")

noextract=("${source[@]##*/}")

sha256sums=('7f4e3c72df8be47d47ff61789900740cd3b5346ba7179a83312ba9cd80ad8b95'
            '01c096a38faa0352ff71e9cb6a31aa5ac07790fc41e4681405a217964b752efb'
            'db532afff5541c012f652e5fa7c5991ef24bf0849d2d5b9bd8dc8d005e5fbc0c')

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

package_linux6.12.58-1-lts-bin() {
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

package_linux6.12.58-1-lts-headers-bin() {
  pkgdesc="Headers and scripts for building modules for the LTS Linux kernel ${_KERNNAME}"
  depends=(pahole)
  conflicts=("${_pkgname}-headers")
  tar -xf "${_headerspkg}" -C "${pkgdir}"
  rm "${pkgdir}"/{.MTREE,.BUILDINFO,.PKGINFO}
  mv "${pkgdir}/usr/src/"{"${_pkgname}","${_versioned_pkgname}"}
  mv "${pkgdir}/usr/share/licenses/"{"${_pkgname}-headers","${_versioned_pkgname}-headers-bin"}
}

package_linux6.12.58-1-lts-docs-bin() {
  pkgdesc="Documentation for the LTS Linux kernel ${_KERNNAME}"
  conflicts=("${_pkgname}-docs")
  tar -xf "${_docspkg}" -C "${pkgdir}"
  rm "${pkgdir}"/{.MTREE,.BUILDINFO,.PKGINFO}
  mv "${pkgdir}/usr/share/doc/"{"${_pkgname}","${_versioned_pkgname}"}
  mv "${pkgdir}/usr/share/licenses/"{"${_pkgname}-docs","${_versioned_pkgname}-docs-bin"}
}
