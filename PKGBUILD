# Maintainer: Chris Billington <chrisjbillington@gmail.com>
_pkgname=linux-zen
_pkgver=6.11.9.zen1
_kernver=6.11.9
_zenver=zen1
_pkgrel=1
pkgbase="${_pkgname}-versioned-bin"
_KERNNAME=6.11.9-zen1-1-zen
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

_kernpkg=linux-zen-6.11.9.zen1-1-x86_64.pkg.tar.zst
_headerspkg=linux-zen-headers-6.11.9.zen1-1-x86_64.pkg.tar.zst
_docspkg=linux-zen-docs-6.11.9.zen1-1-x86_64.pkg.tar.zst

source=("https://archive.archlinux.org/packages/.all/${_kernpkg}"
        "https://archive.archlinux.org/packages/.all/${_headerspkg}"
        "https://archive.archlinux.org/packages/.all/${_docspkg}")

noextract=("${source[@]##*/}")

sha256sums=('4380c665918fd6250f4cf6b059549d3df9a7821d13a596aa0fc2ca298bfd347c'
            'a601154c75caa32d6ffe995b83037130ca90ce9ada1b13cbe5b5120514f640b6'
            'b82a47dc953cd318e8cd0a935a824f18b5f5901adcbfaf3888e4cd20e070659c')

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

package_linux6.11.9.zen1-1-zen-bin() {
  pkgdesc="The Linux ZEN kernel and modules, version ${_KERNNAME}"
  depends=(coreutils
           initramfs
           kmod)
  conflicts=("${_pkgname}")
  optdepends=('linux-firmware: firmware images needed for some devices'
              'wireless-regdb: to set the correct wireless channels of your country')
  provides=(KSMBD-MODULE
            UKSMD-BUILTIN
            VHBA-MODULE
            VIRTUALBOX-GUEST-MODULES
            WIREGUARD-MODULE)
  tar -xf "${_kernpkg}" -C "${pkgdir}"
  rm "${pkgdir}"/{.MTREE,.BUILDINFO,.PKGINFO}
  sed -ic "s/${_pkgname}/${_KERNNAME}/" "${pkgdir}/usr/lib/modules/${_KERNNAME}/pkgbase"
}

package_linux6.11.9.zen1-1-zen-headers-bin() {
  pkgdesc="Headers and scripts for building modules for the Linux ZEN kernel ${_KERNNAME}"
  depends=(pahole)
  conflicts=("${_pkgname}-headers")
  tar -xf "${_headerspkg}" -C "${pkgdir}"
  rm "${pkgdir}"/{.MTREE,.BUILDINFO,.PKGINFO}
  mv "${pkgdir}/usr/src/"{"${_pkgname}","${_versioned_pkgname}"}
}

package_linux6.11.9.zen1-1-zen-docs-bin() {
  pkgdesc="Documentation for the Linux ZEN kernel ${_KERNNAME}"
  conflicts=("${_pkgname}-docs")
  tar -xf "${_docspkg}" -C "${pkgdir}"
  rm "${pkgdir}"/{.MTREE,.BUILDINFO,.PKGINFO}
  mv "${pkgdir}/usr/share/doc/"{"${_pkgname}","${_versioned_pkgname}"}
}
