# Maintainer: Eisuke Kawashima <e DOT kawaschima+arch AT gmail DOT com>
# Contributor: Eric Berquist <eric DOT berquist AT gmail DOT com>

_pkgname=nwchem
_MPI=OpenMPI
_mpi=${_MPI,,}
pkgname=${_pkgname}-bin
_pkgver=7.2.3-10
pkgver="${_pkgver//-/\.}"
pkgrel=2
pkgdesc="High-performance computational chemistry software (${_MPI} build) — Debian binary build"
arch=('x86_64')
url='https://nwchemgit.github.io'
license=('custom:ECL2.0' 'GPL3')
depends=(
  'blas' 'lapack' "$_mpi" 'python'
  # AUR
  'nwchem-data'
  'scalapack'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
source=(
  "http://httpredir.debian.org/debian/pool/main/n/${_pkgname}/${_pkgname}_${_pkgver}_all.deb"
)
sha256sums=(
  'b02ec5fd9e8e31b5468c50ba780e717d8282c7e2fb21d99a76ef236e55e2523c'
)
source_x86_64=(
  "http://httpredir.debian.org/debian/pool/main/n/${_pkgname}/${_pkgname}-${_mpi}_${_pkgver}_amd64.deb"
)
sha256sums_x86_64=(
  'f2dc16b130fc10bb1784307a21cc6ff24362b30c74d82cb739eb8d8f0c0c5adc'
)
noextract=("${source[@]##*/}")

package() {
  local tar_exclude=(--exclude '*Debian*' --exclude lintian) # exclude debian-specific files

  bsdtar -xOf "${source[0]##*/}" data.tar.xz |
    bsdtar -C "${pkgdir}/" "${tar_exclude[@]}" -xvf -

  bsdtar -C "${pkgdir}/" "${tar_exclude[@]}" -xvf data.tar.xz

  # Don't modify the scalapack PKGBUILD.
  mkdir -p "${pkgdir}"/usr/lib
  ln -fsv /usr/lib/libscalapack.so "${pkgdir}"/usr/lib/libscalapack-${_mpi}.so.2.2
}
