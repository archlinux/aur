# Maintainer: Chris Billington <chrisjbillington@gmail.com>
_pkgname=linux-lts
_pkgver=6.18.55
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

_kernpkg=linux-lts-6.18.55-1-x86_64.pkg.tar.zst
_headerspkg=linux-lts-headers-6.18.55-1-x86_64.pkg.tar.zst
_docspkg=linux-lts-docs-6.18.55-1-x86_64.pkg.tar.zst

source=("https://archive.archlinux.org/packages/.all/${_kernpkg}"
        "https://archive.archlinux.org/packages/.all/${_headerspkg}"
        "https://archive.archlinux.org/packages/.all/${_docspkg}")

noextract=("${source[@]##*/}")

sha256sums=('d7b80550feb4309cd812bb21d0965d6e26f5ec72241c96a7ad57a3eb8b5f7e12'
            'e4ef03c9a97d40cc8f58c8c4f731aa80d132b2290e0854709b82ef8bfa68bd7d'
            'e236286d46bd481959328c147871769b50ffb997031182b4297dfddb23ac57fa')

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

package_linux6.18.55-1-lts-bin() {
  pkgdesc="The LTS Linux kernel and modules, version ${_KERNNAME}"
  depends=(coreutils
           initramfs
           kmod)
  conflicts=("${_pkgname}")
  optdepends=('linux-firmware: firmware images needed for some devices'
              'linux-lts-headers: headers and scripts for building modules'
              'scx-scheds: to use sched-ext schedulers'
              'wireless-regdb: to set the correct wireless channels of your country')
  provides=(KSMBD-MODULE
            NTSYNC-MODULE
            VIRTUALBOX-GUEST-MODULES
            WIREGUARD-MODULE)
  replaces=(wireguard-lts)
  tar -xf "${_kernpkg}" -C "${pkgdir}"
  rm "${pkgdir}"/{.MTREE,.BUILDINFO,.PKGINFO}
  sed -ic "s/${_pkgname}/${_KERNNAME}/" "${pkgdir}/usr/lib/modules/${_KERNNAME}/pkgbase"
  mv "${pkgdir}/usr/share/licenses/"{"${_pkgname}","${_versioned_pkgname}-bin"}
}

package_linux6.18.55-1-lts-headers-bin() {
  pkgdesc="Headers and scripts for building modules for the LTS Linux kernel ${_KERNNAME}"
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
  mv "${pkgdir}/usr/share/licenses/"{"${_pkgname}-headers","${_versioned_pkgname}-headers-bin"}
}

package_linux6.18.55-1-lts-docs-bin() {
  pkgdesc="Documentation for the LTS Linux kernel ${_KERNNAME}"
  conflicts=("${_pkgname}-docs")
  tar -xf "${_docspkg}" -C "${pkgdir}"
  rm "${pkgdir}"/{.MTREE,.BUILDINFO,.PKGINFO}
  mv "${pkgdir}/usr/share/doc/"{"${_pkgname}","${_versioned_pkgname}"}
  mv "${pkgdir}/usr/share/licenses/"{"${_pkgname}-docs","${_versioned_pkgname}-docs-bin"}
}
