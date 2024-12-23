# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=namd
pkgver=3.0.1
_charmver=8.0.0
pkgrel=1
pkgdesc="Scalable molecular dynamic engine"
url="http://www.ks.uiuc.edu/Research/namd/"
license=(LicenseRef-NAMD)
arch=(x86_64)
depends=(
	bash
	fftw
	gcc-libs
	glibc
	perl
	python-numpy
	python-scipy
	tcl
	zlib
)
makedepends=(gcc make patch)
b2sums=('e12efa3b229b4568bea586f3fe613ec1b0561c946e4fd0c06f937e95eac0c6d1f266cf95e26feac46a5257645ba3671e433f306ea4ede783c2883f1db5613f82'
        '21c13ba66436c11721f0a20abf13a32cb4e89908e71bff53022adcbbf0984c8a88f2b27e51a7086d873aa17164ae8865d440d08cc1281838d6ac7cdb38eb9110'
        '04d8df9bacbbd1cf6718a591b52686623cb9be3884c023ff4c70c2d6d4524003ebea132dbfb75fd345dd2ae97115ae66fc69deaf59a9803870ab95abb0e88535')
options=(!buildflags)

# You MUST download the package from the NAMD url and put it in the PKGBUILD folder!
source=("http://charm.cs.illinois.edu/distrib/charm-${_charmver}.tar.gz"
        "local://NAMD_${pkgver}_Source.tar.gz"
        "Make.charm.patch")

prepare() {
  # cd "${srcdir}/NAMD_${pkgver}_Source" || exit

  # move Charm++ in place
  cp -ru "${srcdir}/charm-${_charmver}" "${srcdir}/NAMD_${pkgver}_Source/charm-${_charmver}"

  # apply patch
  # patch -Np0 -i "${srcdir}/namd.patch"

	# apply patch
	patch "${srcdir}/NAMD_${pkgver}_Source/Make.charm" ../Make.charm.patch
}

build() {
  # build Charm++
  cd "${srcdir}/NAMD_${pkgver}_Source/charm-${_charmver}" || exit

  ./build charm++ "multicore-linux-${CARCH}" --with-production --force

  # go to the NAMD build
  cd "${srcdir}/NAMD_${pkgver}_Source" || exit

  # configure and build NAMD
	# remove old directory
	rm -rf "${srcdir}/NAMD_${pkgver}_Source/Linux-${CARCH}-g++"
  ./config "Linux-${CARCH}-g++" --charm-arch "multicore-linux-${CARCH}" --tcl-prefix /usr --fftw-prefix /usr --with-fftw3
  cd "Linux-${CARCH}-g++" || exit
  make
}

package() {
  cd "${srcdir}/NAMD_${pkgver}_Source/Linux-${CARCH}-g++" || exit

  make release

  # prepare directories
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/${pkgname}"

  cd "NAMD_${pkgver}_Linux-${CARCH}-multicore" || exit

  # install binaries
  install -Dm755 charmrun "${pkgdir}/usr/bin/charmrun"
  install -Dm755 flipbinpdb "${pkgdir}/usr/bin/flipbinpdb"
  install -Dm755 flipdcd "${pkgdir}/usr/bin/flipdcd"
  install -Dm755 namd3 "${pkgdir}/usr/bin/namd3"
  install -Dm755 psfgen "${pkgdir}/usr/bin/psfgen"
  install -Dm755 sortreplicas "${pkgdir}/usr/bin/sortreplicas"

  # install license
  install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # install other stuff
  cp -ar lib README.txt announce.txt notes.txt "${pkgdir}/usr/share/${pkgname}/"
}
