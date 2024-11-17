# Maintainer: Chris Billington <chrisjbillington@gmail.com>
_pkgname=linux
_kernver=6.11.8
_archver=arch1
_pkgrel=2
_pkgver="${_kernver}.${_archver}"
_KERNNAME=6.11.8-arch1-2
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

_kernpkg=linux-6.11.8.arch1-2-x86_64.pkg.tar.zst
_headerspkg=linux-headers-6.11.8.arch1-2-x86_64.pkg.tar.zst
_docspkg=linux-docs-6.11.8.arch1-2-x86_64.pkg.tar.zst

source=("https://archive.archlinux.org/packages/.all/${_kernpkg}"
        "https://archive.archlinux.org/packages/.all/${_headerspkg}"
        "https://archive.archlinux.org/packages/.all/${_docspkg}")

noextract=("${source[@]##*/}")

sha256sums=('490dfa436c37619a5ba7d5bb2d3e1e9bcce2cfeffc1211300665e78a7733eff6'
            '982157609253221552f269bb37055806829b12694a67c97333b366e0fdf40a0b'
            '7246b2789872e16f50108204875637cdc6f2b8f86e94af3390cf39a16e49e8c8')

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

package_linux6.11.8.arch1-2-bin() {
  pkgdesc="The Linux kernel and modules, version ${_KERNNAME}"
  depends=(coreutils
           initramfs
           kmod)
  conflicts=("${_pkgname}")
  optdepends=('linux-firmware: firmware images needed for some devices'
              'wireless-regdb: to set the correct wireless channels of your country')
  provides=(KSMBD-MODULE
            VIRTUALBOX-GUEST-MODULES
            WIREGUARD-MODULE)
  replaces=(virtualbox-guest-modules-arch
            wireguard-arch)
  tar -xf "${_kernpkg}" -C "${pkgdir}"
  rm "${pkgdir}"/{.MTREE,.BUILDINFO,.PKGINFO}
  sed -ic "s/${_pkgname}/${_KERNNAME}/" "${pkgdir}/usr/lib/modules/${_KERNNAME}/pkgbase"
}

package_linux6.11.8.arch1-2-headers-bin() {
  pkgdesc="Headers and scripts for building modules for the Linux kernel ${_KERNNAME}"
  depends=(pahole)
  conflicts=("${_pkgname}-headers")
  tar -xf "${_headerspkg}" -C "${pkgdir}"
  rm "${pkgdir}"/{.MTREE,.BUILDINFO,.PKGINFO}
  mv "${pkgdir}/usr/src/"{"${_pkgname}","${_versioned_pkgname}"}
}

package_linux6.11.8.arch1-2-docs-bin() {
  pkgdesc="Documentation for the Linux kernel ${_KERNNAME}"
  conflicts=("${_pkgname}-docs")
  tar -xf "${_docspkg}" -C "${pkgdir}"
  rm "${pkgdir}"/{.MTREE,.BUILDINFO,.PKGINFO}
  mv "${pkgdir}/usr/share/doc/"{"${_pkgname}","${_versioned_pkgname}"}
}
