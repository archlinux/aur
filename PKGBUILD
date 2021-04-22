# Maintainer: Michael Duell <reg@akurei.me>
# Contributor: Fabian Köhler <fabian.koehler (AT) protonmail.ch>

pkgname=dieharder-bin
pkgver=3.31.1
_pkgsubver="1"
_bin_file="dieharder-${pkgver}-${_pkgsubver}.x86_64.rpm"
pkgrel=1
pkgdesc="A Random Number Test Suite (Binary version)"
arch=('x86_64')
depends=('gsl')
builddepends=('rpmextract')
url="http://www.phy.duke.edu/~rgb/General/dieharder.php"
license=('GPL')

source=("http://webhome.phy.duke.edu/~rgb/General/dieharder/${_bin_file}"
        "http://webhome.phy.duke.edu/~rgb/General/dieharder/lib${_bin_file}")
noextract=("${_bin_file}"
           "lib${_bin_file}")
provides=("dieharder=${pkgver}" "libdieharder=${pkgver}")
conflicts=('dieharder' 'libdieharder')

prepare() {
  cd "${srcdir}"
  rpm2cpio "${_bin_file}" | bsdtar -xf -
  rpm2cpio "lib${_bin_file}" | bsdtar -xf -
  chmod +x usr/include/dieharder
}

package() {
  cd "${srcdir}"
  install -D -m755 {,${pkgdir}/}usr/bin/dieharder
  
  install -d -m755 "${pkgdir}/usr/lib"
  ln -s /usr/lib/libgsl.so "${pkgdir}/usr/lib/libgsl.so.0"
  install -t "${pkgdir}/usr/lib" usr/lib64/*

  install -d -m755 "${pkgdir}/usr/include/dieharder"
  install -t "${pkgdir}/usr/include/dieharder" usr/include/dieharder/*

  install -D -m644 {,${pkgdir}/}usr/share/man/man1/dieharder.1.gz
  install -D -m644 {,${pkgdir}/}usr/share/man/man3/libdieharder.3.gz

  install -d -m755 "${pkgdir}/usr/share/doc/dieharder-${pkgver}"
  install -t "${pkgdir}/usr/share/doc/dieharder-${pkgver}" usr/share/doc/dieharder-${pkgver}/*
  
  install -D -m644 "${pkgdir}/usr/share/doc/dieharder-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"


}

# vim:set ts=2 sw=2 et:
b2sums=('06f124b4bdaea0e21ad43bd414c0d6f851ce78a63581f0a7cfdd6bffd0cd510be8fe9d670584fa0753feab5eefa9691dedc39de6bd865e8456eb65bb85999502'
        '31f4a252382b273e2d506e21c8f29cd495751e079615f3ce66daf55848db6bd1f6f34768b6ed27ca916a637b0135e4a60296e9963a73ddff8f81ee572b4e3687')
