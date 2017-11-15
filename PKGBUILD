# Maintainer: Benoit Brummer <trougnouf at gmail dot com>
pkgname='mabe-dev-git'
pkgver=r231.754e7e2
pkgrel=1
pkgdesc='Modular Agent Based Evolution Framework (development version)'
url='https://github.com/Hintzelab/MABE'
depends=()
makedepends=('python' 'git' 'gcc')
license=('GPL3')
arch=('i686' 'x86_64')
source=(git+"${url}.git#branch=development")
sha256sums=('SKIP')

pkgver() {
  cd MABE
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
build() {
	cd "${srcdir}/MABE"
	sed -i 's~"World/NumeralClassifierWorld/mnist.train.discrete.28x28-only100"~"/usr/share/MABE-dev/World/NumeralClassifierWorld/mnist.train.discrete.28x28-only100"~g' World/NumeralClassifierWorld/NumeralClassifierWorld.cpp
	sed -i 's~"World/SOFWorld/scoreMap_20x20_2peaks.txt"~"/usr/share/MABE-dev/World/SOFWorld/scoreMap_20x20_2peaks.txt"~g' World/SOFWorld/SOFWorld.cpp
	python "PythonTools/MBuild.py"
}


package() {
	mkdir -p "${pkgdir}/usr/bin"
	cp "${srcdir}/MABE/MABE" "${pkgdir}/usr/bin/MABE-dev"
	mkdir -p "${pkgdir}/usr/share/MABE-dev/World/NumeralClassifierWorld"
	cp "${srcdir}/MABE/World/NumeralClassifierWorld/mnist.train.discrete.28x28-only100" "${pkgdir}/usr/share/MABE-dev/World/NumeralClassifierWorld"
	cp "${srcdir}/MABE/World/NumeralClassifierWorld/mnist.train.subset.discrete.28x28" "${pkgdir}/usr/share/MABE-dev/World/NumeralClassifierWorld"
	mkdir -p "${pkgdir}/usr/share/MABE-dev/World/SOFWorld"
	cp "${srcdir}/MABE/World/SOFWorld/scoreMap_20x20_2peaks.txt" "${pkgdir}/usr/share/MABE-dev/World/SOFWorld"
	cp "${srcdir}/MABE/World/SOFWorld/scoreMap_100x100_smallANDlarge.txt" "${pkgdir}/usr/share/MABE-dev/World/SOFWorld"
}
