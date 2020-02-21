# Maintainer: Chris Billington <chrisjbillington@gmail.com>
_pkgname=linux
_kernver=5.5.4
_archver=arch1
_pkgrel=1
pkgbase='linux-versioned-bin'
KERNNAME=${_kernver}-${_archver}-${_pkgrel}
_versioned_pkgname=${_pkgname}${KERNNAME}
pkgname=("linux-versioned-bin"
         "linux-versioned-headers-bin"
         "linux-versioned-docs-bin"
         "${_versioned_pkgname}-bin"
         "${_versioned_pkgname}-headers-bin"
         "${_versioned_pkgname}-docs-bin")
pkgver=${_kernver}
pkgrel=5
pkgdesc='Repackaging of the Arch kernel with a unique package name for each version'
url="https://git.archlinux.org/linux.git/log/?h=v${_kernver}-${_archver}"
arch=(x86_64)
license=(GPL2)
options=('!strip')

_kernpkg=${_pkgname}-${_kernver}.${_archver}-${_pkgrel}-${arch}.pkg.tar.zst
_headerspkg=${_pkgname}-headers-${_kernver}.${_archver}-${_pkgrel}-${arch}.pkg.tar.zst
_docspkg=${_pkgname}-docs-${_kernver}.${_archver}-${_pkgrel}-${arch}.pkg.tar.zst

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

sha256sums=('7b9e536050d8bf740b00fab87a52ab843ff9dedbb9ece35f45b219cef91cf7db'
            'cb52382de2492f878d297ad0a6dfc06c6da9fbd812fc40a26b8aef20c3e199c2'
            'c390ff437d20cd9a8418d722c5734d4ef71c67796c5e81f6c5c0ded928ee40c8')

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

package_linux5.5.4-arch1-1-bin() {
  pkgdesc="The Linux kernel and modules, version ${KERNNAME}"
  depends=(coreutils kmod initramfs)
  optdepends=('crda: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices')
  # Ignore already decompressed source, since kernel, docs and headers are all mixed
  # together in there:
  tar -xf "${_kernpkg}" -C "${pkgdir}"
  rm "${pkgdir}"/{.MTREE,.BUILDINFO,.PKGINFO}
  MODULES=${pkgdir}/usr/lib/modules

  # Modify the name used by mkinitcpio to include the version: 
  echo "linux-${KERNNAME}" | install -Dm644 /dev/stdin "${MODULES}/${KERNNAME}/pkgbase"
  
  # Rename the modules directory to have the suffix '-versioned' so we don't conflict
  # with the 'linux' package:
  mv "${MODULES}/${KERNNAME}" "${MODULES}/${KERNNAME}-versioned"
}

package_linux5.5.4-arch1-1-headers-bin() {
  pkgdesc="Headers and scripts for building modules for the Linux kernel ${KERNNAME}"
  # Ignore already decompressed source, since kernel, docs and headers are all mixed
  # together in there:
  tar -xf "${_headerspkg}" -C "${pkgdir}"
  rm "${pkgdir}"/{.MTREE,.BUILDINFO,.PKGINFO}

  MODULES=${pkgdir}/usr/lib/modules
  # Rename the modules directory to have the suffix '-versioned' so we don't conflict
  # with the 'linux-headers' package:
  mv "${MODULES}/${KERNNAME}" "${MODULES}/${KERNNAME}-versioned"

  # Change the src directory symlink to include the version, and link to the renamed
  # modules directory:
  rm "${pkgdir}/usr/src/linux" 
  ln -s "../../lib/modules/${KERNNAME}-versioned/build" \
    "${pkgdir}/usr/src/linux-${KERNNAME}"
}

package_linux5.5.4-arch1-1-docs-bin() {
  pkgdesc="Documentation for the Linux kernel ${KERNNAME}"
  # Ignore already decompressed source, since kernel, docs and headers are all mixed
  # together in there:
  tar -xf "${_docspkg}" -C "${pkgdir}"
  rm "${pkgdir}"/{.MTREE,.BUILDINFO,.PKGINFO}

  MODULES=${pkgdir}/usr/lib/modules
  # Rename the modules directory to have the suffix '-versioned' so we don't conflict
  # with the 'linux-docs' package:
  mv "${MODULES}/${KERNNAME}" "${MODULES}/${KERNNAME}-versioned"

  # Change the doc directory symlink to include the version, and link to the renamed
  # modules directory:
  rm "${pkgdir}/usr/share/doc/linux" 
  ln -s "../../lib/modules/${KERNNAME}-versioned/build/Documentation" \
    "${pkgdir}/usr/share/doc/linux-${KERNNAME}"
}
