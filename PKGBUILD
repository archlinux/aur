# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>

_pkgname=nwchem
pkgname=${_pkgname}-bin
_pkgver=7.0.2-1
_pkgver_tmp="${_pkgver//\+/\.}"
pkgver="${_pkgver_tmp//-/\.}"
pkgrel=1
pkgdesc="Open Source High-Performance Computational Chemistry (Debian binary build)"
arch=("x86_64")
url="http://www.nwchem-sw.org"
license=("custom:ECL2.0" "GPL3")
depends=("lapack" "python39" "openmpi" "nwchem-data" "scalapack")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=("!strip" "libtool" "staticlibs")
source=("http://ftp.us.debian.org/debian/pool/main/n/nwchem/nwchem_${_pkgver}_amd64.deb")
sha256sums=('45eb58dcc79c54e778748170636147945782cde919584b6a3e1ac816e8f57b77')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "${pkgdir}/"

  msg2 "Adding license..."
  install -Dm644 "${pkgdir}"/usr/share/doc/"${_pkgname}"/copyright "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE

  msg2 "Removing Debian extras..."
  rm "${pkgdir}"/usr/share/doc/nwchem/changelog.*
  rm "${pkgdir}"/usr/share/doc/nwchem/TODO.Debian
  rm -r "${pkgdir}"/usr/share/lintian

  # Don't modify the scalapack PKGBUILD.
  mkdir -p "${pkgdir}"/usr/lib
  ln -fsv /usr/lib/libscalapack.so "${pkgdir}"/usr/lib/libscalapack-openmpi.so.2.1
}
