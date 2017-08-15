# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>

pkgname=pgi-compilers
_release='17.4'
_REL_VERSION='2017'
pkgver=${_release}
pkgrel=3
pkgdesc='PGI compilers and tools (Community Edition)'
arch=('x86_64')
url="https://www.pgroup.com/products/community.htm"
license=('custom')
depends=('gtk2')
makedepends=('bash')
source=("file://pgilinux-${_REL_VERSION}-${_release//./}-x86_64.tar.gz"
        "https://www.pgroup.com/doc/LICENSE.txt"
        "pgi-compilers.sh")
sha256sums=('115c212d526695fc116fe44f1e722793e60b6f7d1b341cd7e77a95da8e7f6c34'
            '78abb626ddb93482b9169e2b6da205067702c8da40a201f9b1a557c261c47270'
            '23d71aa379bed34f72eb47cc3e03ef189261b172d3a07bc9c7e472d34288a244')
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
