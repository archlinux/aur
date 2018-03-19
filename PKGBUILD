# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>

pkgname=pgi-compilers
_release='17.10'
_REL_VERSION='2017'
pkgver=${_release}
pkgrel=1
pkgdesc='PGI compilers and tools (Community Edition)'
arch=('x86_64')
url="https://www.pgroup.com/products/community.htm"
license=('custom')
depends=('gtk2')
makedepends=('bash')
source=("file://pgilinux-${_REL_VERSION}-${_release//./}-x86_64.tar.gz"
        "https://www.pgroup.com/doc/LICENSE.txt"
        "pgi-compilers.sh")
sha256sums=('9da8f869fb9b70c0c4423c903d40a9e22d54b997af359a43573c0841165cd1b6'
            '78abb626ddb93482b9169e2b6da205067702c8da40a201f9b1a557c261c47270'
            '4aa862aece1c4df8a67b6677837fd4827d576619c67fed80af1578346c11f497')
options=(!strip)

package(){
  cd "${srcdir}"

  # See ${srcdir}/install_components/install
  export PGI_SILENT=true
  export PGI_ACCEPT_EULA=accept
  export PGI_INSTALL_DIR="${pkgdir}/opt/pgi"
  export PGI_INSTALL_NVIDIA=true
  export PGI_INSTALL_JAVA=true
  export PGI_INSTALL_MPI=true
  export PGI_MPI_GPU_SUPPORT=true
  export PGI_INSTALL_MANAGED=true

  bash ./install

  # Fix symlinks
  while read -r symlink
  do
    newsource=$(readlink "${symlink}" | sed "s:${pkgdir}::g")
    rm "${symlink}"
    ln -sf "${newsource}" "${symlink}"
  done < <(find "${pkgdir}" -lname "${pkgdir}/*")

  # Install licence
  install -Dm644 "${srcdir}/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

  # Install script to set path
  install -Dm755 "${srcdir}/pgi-compilers.sh" \
    "${pkgdir}/etc/profile.d/pgi-compilers.sh"
  sed -i "s/@release@/${_release}/g" "${pkgdir}/etc/profile.d/pgi-compilers.sh"
}

# vim:set ts=2 sw=2 et:
