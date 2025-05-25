# Maintainer: Chris Billington <chrisjbillington@gmail.com>
_pkgname=linux
_kernver=6.14.7
_archver=arch2
_pkgrel=1
_pkgver="${_kernver}.${_archver}"
_KERNNAME=6.14.7-arch2-1
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

_kernpkg=linux-6.14.7.arch2-1-x86_64.pkg.tar.zst
_headerspkg=linux-headers-6.14.7.arch2-1-x86_64.pkg.tar.zst
_docspkg=linux-docs-6.14.7.arch2-1-x86_64.pkg.tar.zst

source=("https://archive.archlinux.org/packages/.all/${_kernpkg}"
        "https://archive.archlinux.org/packages/.all/${_headerspkg}"
        "https://archive.archlinux.org/packages/.all/${_docspkg}")

noextract=("${source[@]##*/}")

sha256sums=('9bf35d788fa9ddf19b1897af658cc2ece51b048028113dbf37b8729350de08a1'
            '2e18cb9d4b72d90269df5baa2613e292d92cb568463250f170a90c0f9c46dbe8'
            '4b149c3ba128d64bafeee92d487134683cb09a5de957d909247018a77a56598e')

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

package_linux6.14.7.arch2-1-bin() {
  pkgdesc="The Linux kernel and modules, version ${_KERNNAME}"
  depends=(coreutils
           initramfs
           kmod)
  conflicts=("${_pkgname}")
  optdepends=('linux-firmware: firmware images needed for some devices'
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

package_linux6.14.7.arch2-1-headers-bin() {
  pkgdesc="Headers and scripts for building modules for the Linux kernel ${_KERNNAME}"
  depends=(pahole)
  conflicts=("${_pkgname}-headers")
  tar -xf "${_headerspkg}" -C "${pkgdir}"
  rm "${pkgdir}"/{.MTREE,.BUILDINFO,.PKGINFO}
  mv "${pkgdir}/usr/src/"{"${_pkgname}","${_versioned_pkgname}"}
}

package_linux6.14.7.arch2-1-docs-bin() {
  pkgdesc="Documentation for the Linux kernel ${_KERNNAME}"
  conflicts=("${_pkgname}-docs")
  tar -xf "${_docspkg}" -C "${pkgdir}"
  rm "${pkgdir}"/{.MTREE,.BUILDINFO,.PKGINFO}
  mv "${pkgdir}/usr/share/doc/"{"${_pkgname}","${_versioned_pkgname}"}
}
