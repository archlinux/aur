# Maintainer: Eisuke Kawashima <e DOT kawaschima+arch AT gmail DOT com>
# Contributor: Eric Berquist <eric DOT berquist AT gmail DOT com>

_pkgname=nwchem
_mpi=openmpi
pkgname=${_pkgname}-bin
_pkgver=7.2.3-10
pkgver="${_pkgver//-/\.}"
pkgrel=1
pkgdesc='High-performance computational chemistry software (OpenMPI build) — Debian binary build'
arch=('x86_64')
url='https://nwchemgit.github.io'
license=('custom:ECL2.0' 'GPL3')
depends=(
  'blas' 'lapack' 'nwchem-data' "$_mpi" 'python'
  # AUR
  'scalapack'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
source=(
  "http://httpredir.debian.org/debian/pool/main/n/${_pkgname}/${_pkgname}_${_pkgver}_all.deb"
  "http://httpredir.debian.org/debian/pool/main/n/${_pkgname}/${_pkgname}_${_pkgver}.debian.tar.xz"
)
sha256sums=(
  'b02ec5fd9e8e31b5468c50ba780e717d8282c7e2fb21d99a76ef236e55e2523c'
  '26b633d015321328950053c217a0e345697497813ee15123b25bee44f4e14d32'
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

  local man1dir="${pkgdir}/usr/share/man/man1"
  mkdir -p "${man1dir}"
  bsdtar -xvOf "${source[1]##*/}" debian/nwchem.1 |
    gzip -c > "${man1dir}/nwchem.1.gz"

  bsdtar -C "${pkgdir}/" "${tar_exclude[@]}" -xvf data.tar.xz

  # Don't modify the scalapack PKGBUILD.
  mkdir -p "${pkgdir}"/usr/lib
  ln -fsv /usr/lib/libscalapack.so "${pkgdir}"/usr/lib/libscalapack-${_mpi}.so.2.2
}
