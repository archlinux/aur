# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>

pkgname=pgi-compilers
_release='18.10'
_REL_VERSION='2018'
pkgver=${_release}
pkgrel=1
pkgdesc='PGI compilers and tools (Community Edition)'
arch=('x86_64')
url="https://www.pgroup.com/products/community.htm"
license=('custom')
depends=('gtk2')
makedepends=('bash')
source=("file://pgilinux-${_REL_VERSION}-${_release//./}-x86-64.tar.gz"
        "https://www.pgroup.com/doc/LICENSE.txt"
        "pgi-compilers.sh")
md5sums=('0e1598c05aa8faeb84e351c0f68274c3'
         '6ce643d0145bf318cddbc186b8da40d2'
         '5591f7344c4ec974db4be9ad35a80b3b')
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

  # Fix reference to $pkgdir
  sed -i "s:${pkgdir}::g" $(grep -rl "${pkgdir}" "${pkgdir}")
}

# vim:set ts=2 sw=2 et:
