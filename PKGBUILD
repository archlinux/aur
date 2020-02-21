# Maintainer: Chris Billington <chrisjbillington@gmail.com>
_pkgname=linux
_kernver=5.5.5
_archver=arch1
_pkgrel=1
_pkgver=${_kernver}.${_archver}
pkgbase="${_pkgname}-versioned-bin"
KERNNAME=${_kernver}-${_archver}-${_pkgrel}
_versioned_pkgname=${_pkgname}${_pkgver}-${_pkgrel}
pkgname=("${_pkgname}-versioned-bin"
         "${_pkgname}-versioned-headers-bin"
         "${_pkgname}-versioned-docs-bin"
         "${_versioned_pkgname}-bin"
         "${_versioned_pkgname}-headers-bin"
         "${_versioned_pkgname}-docs-bin")
pkgver=${_pkgver}
pkgrel=${_pkgrel}
pkgdesc='Repackaging of the Arch kernel with a unique package name for each version'
url="https://git.archlinux.org/linux.git/log/?h=v${_kernver}-${_archver}"
arch=(x86_64)
license=(GPL2)
options=('!strip')

_kernpkg=${_pkgname}-${_pkgver}-${_pkgrel}-${arch}.pkg.tar.zst
_headerspkg=${_pkgname}-headers-${_pkgver}-${_pkgrel}-${arch}.pkg.tar.zst
_docspkg=${_pkgname}-docs-${_pkgver}-${_pkgrel}-${arch}.pkg.tar.zst

# See if the sources are available from our own mirror:
_kernsrc=$(pacman -Sp "${_pkgname}" 2> /dev/null) 
_headerssrc=$(pacman -Sp "${_pkgname}-headers" 2> /dev/null) 
_docssrc=$(pacman -Sp "${_pkgname}-docs" 2> /dev/null) 

_arch_archive=https://archive.archlinux.org/packages/.all

# If not, then use the Arch Linux archive:
if [ $(basename "${_kernsrc}" 2> /dev/null) != "${_kernpkg}" ]; then
  _kernsrc=${_arch_archive}/${_kernpkg}
fi
if [ $(basename "${_headerssrc}" 2> /dev/null) != "${_headerspkg}" ]; then
  _headerssrc=${_arch_archive}/${_headerspkg}
fi
if [ $(basename "${_docssrc}" 2> /dev/null) != "${_docspkg}" ]; then
  _docssrc=${_arch_archive}/${_docspkg}
fi

source=("${_kernsrc}"
        "${_headerssrc}"
        "${_docssrc}")

sha256sums=('8a5831a8df34bc83f95e493406dfa8eaafebae1fb68a33697df7f2e630841aad'
            'aa6474d4c4077d218e41d38894fcd4491c7c3829d4c92d7ab3c19f326c3fde61'
            '227c420e6a05b83aea63cf3add0429d2d694e0f955c7cdc56207513b000441c3')

package_linux-versioned-bin() {
    pkgdesc="Dummy package depending on ${_versioned_pkgname}-bin"  
    depends=("${_versioned_pkgname}-bin")
    optdepends=('grub-mkconfig-hook: to run grub-mkconfig when kernels are added/removed')
}

package_linux-versioned-headers-bin() {
    pkgdesc="Dummy package depending on ${_versioned_pkgname}-headers-bin"  
    depends=("${_versioned_pkgname}-headers-bin")
}

package_linux-versioned-docs-bin() {
    pkgdesc="Dummy package depending on ${_versioned_pkgname}-docs-bin"  
    depends=("${_versioned_pkgname}-docs-bin")
}

package_linux5.5.5.arch1-1-bin() {
  pkgdesc="The Linux kernel and modules, version ${KERNNAME}"
  depends=(coreutils kmod initramfs)
  conflicts=("${_pkgname}")
  optdepends=('crda: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices')
  tar -xf "${_kernpkg}" -C "${pkgdir}"
  rm "${pkgdir}"/{.MTREE,.BUILDINFO,.PKGINFO}
  sed -ic "s/${_pkgname}/${KERNNAME}/" "${pkgdir}/usr/lib/modules/${KERNNAME}/pkgbase"
}

package_linux5.5.5.arch1-1-headers-bin() {
  pkgdesc="Headers and scripts for building modules for the Linux kernel ${KERNNAME}"
  conflicts=("${_pkgname}-headers")
  tar -xf "${_headerspkg}" -C "${pkgdir}"
  rm "${pkgdir}"/{.MTREE,.BUILDINFO,.PKGINFO}
  mv "${pkgdir}/usr/src/linux"{,"-${KERNNAME}"}
}

package_linux5.5.5.arch1-1-docs-bin() {
  pkgdesc="Documentation for the Linux kernel ${KERNNAME}"
  conflicts=("${_pkgname}-docs")
  tar -xf "${_docspkg}" -C "${pkgdir}"
  rm "${pkgdir}"/{.MTREE,.BUILDINFO,.PKGINFO}
  mv "${pkgdir}/usr/share/doc/linux"{,"-${KERNNAME}"}
}
