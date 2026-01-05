# Maintainer: Eisuke Kawashima <e DOT kawaschima+arch AT gmail DOT com>
# Contributor: Eric Berquist <eric DOT berquist AT gmail DOT com>

_pkgname=nwchem
_MPI=OpenMPI
_mpi=${_MPI,,}
pkgname=${_pkgname}-bin
_pkgver=7.3.1-1
pkgver="${_pkgver//-/\.}"
pkgrel=1
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
options=('!debug' '!strip')
source=(
  "http://httpredir.debian.org/debian/pool/main/n/${_pkgname}/${_pkgname}_${_pkgver}_all.deb"
)
sha256sums=(
  '35dfd294816b90ffec217b9d8369240f5671d2757800e24c0ebc215539530bbc'
)
source_x86_64=(
  "http://httpredir.debian.org/debian/pool/main/n/${_pkgname}/${_pkgname}-${_mpi}_${_pkgver}_amd64.deb"
)
sha256sums_x86_64=(
  'a2b6b87b61a85611ef504486cd4a54a053a836eb2a385ba525add60ecc270097'
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
