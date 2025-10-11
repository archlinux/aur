# Maintainer:Bipin Kumar <kbipinkumar@pm.me>
pkgbase=abpoa
pkgname=('abpoa' 'pyabpoa')
pkgname=abpoa
pkgdesc="SIMD-based C library for fast partial order alignment. https://dx.doi.org/10.1093/bioinformatics/btaa963"
_name=abPOA
pkgver=1.5.5
pkgrel=1
arch=(x86_64)
url="https://github.com/yangao07/abPOA"
license=('MIT')
makedepends=('cmake' 'git' 'python-build' 'simde' 'python'
             'python-installer' 'python-setuptools'
             'python-wheel'
             'cython')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/yangao07/abPOA/archive/refs/tags/v${pkgver}.tar.gz"
        "simde.patch"
        )

b2sums=('d6bda8c41951fd4b9ae2e80d475416f80775bd9628e17632e1112e6d52cbf5a0b62bd369342ed5c4ae0d5a460dc05c5da918005d58d4b0c95069f195071e63dd'
        'c1bfc21cdc6ba1b592879069cc883c4bd0d9408faec35710e982ba587f2e2f305ecda29ea565273853cdedfeec956069a561d0b9267b95f7aee8c0213a40e40c')

prepare() {
    # adapt patches from debian to make use SIMDe from Archlinux repo 
    cd ${_name}-${pkgver}
    patch -p1 < ${srcdir}/simde.patch
}
build() {
  cd ${_name}-${pkgver}
  cmake -B build \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_SKIP_INSTALL_RPATH=YES \
        -DCMAKE_INSTALL_INCLUDEDIR='include/${pkgname}' \
        -Wno-dev
    cmake --build build
    python -m build --wheel --no-isolation
}

check() {
    cd ${_name}-${pkgver}/build
    ./bin/abpoa ../test_data/seq.fa > cons.fa
}
package_abpoa() {
  pkgdesc="SIMD-based C library for fast partial order alignment. https://dx.doi.org/10.1093/bioinformatics/btaa963"
  depends=('glibc' 
         'zlib'
         'graphviz')
  optdepends=('pyabpoa: python bindings for abpoa')
  cd ${_name}-${pkgver}
  install -d 755 ${pkgdir}/usr
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  rm -rf "$pkgdir"/usr/include/simde
}

package_pyabpoa() {
    depends=('glibc' 
         'zlib'
         'python'
	 'graphviz')
    pkgdesc="python bindings for abpoa"
    provides=('pyabpoa')
    cd ${_name}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
    }
