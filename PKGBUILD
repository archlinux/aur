# Maintainer: Guoyi Zhang <myname at malacology dot net>
# Contributor: vlad0x00 <see github>

pkgname=btllib
pkgver=1.7.8
pkgrel=1
pkgdesc="Bioinformatics Technology Lab common code library https://doi.org/10.21105/joss.04720"
arch=('x86_64')
url="https://github.com/bcgsc/btllib"
license=(GPL3)
depends=('gcc-libs' 'samtools' 'python')
makedepends=('meson' 'ninja' 'cmake' 'git' 'doxygen' 'swig')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/btllib-${pkgver}.tar.gz")
sha256sums=('cd213d20a971ae3441551dd61b0e46a08559e3d9da19cb59ee8dc3397807f121')
options=('!strip')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  
  # fix sdsl-lite 
  sed -i 's/tree.m_select1/tree.m_bv_select1/g' subprojects/sdsl-lite/include/sdsl/louds_tree.hpp
  sed -i 's/tree.m_select0/tree.m_bv_select0/g' subprojects/sdsl-lite/include/sdsl/louds_tree.hpp
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export CXXFLAGS="${CXXFLAGS} -Wno-ignored-qualifiers"
    CMAKE_POLICY_VERSION_MINIMUM=3.5 ./compile
}

package() {
    # Install binary files
    install -d "${pkgdir}/usr/bin"
    for file in "$srcdir/$pkgname-$pkgver/install/bin/"*; do
        install -m 755 "${file}" "${pkgdir}/usr/bin/"
    done

    # Install include files
    install -d "${pkgdir}/usr/include"
    cp -a "$srcdir/$pkgname-$pkgver/install/include/"* "${pkgdir}/usr/include/"

    # Install library files
    install -d "${pkgdir}/usr/lib"
    cp -a "$srcdir/$pkgname-$pkgver/install/lib/"* "${pkgdir}/usr/lib/"
}
