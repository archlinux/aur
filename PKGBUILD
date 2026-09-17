# Maintainer:Bipin Kumar <kbipinkumar@pm.me>
pkgbase=abpoa
pkgname=('abpoa' 'pyabpoa')
pkgname=abpoa
pkgdesc="SIMD-based C library for fast partial order alignment. https://dx.doi.org/10.1093/bioinformatics/btaa963"
_name=abPOA
pkgver=1.5.7.1
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

b2sums=('4c6e8f3854ee644037105419f89a28d7823ce00f1ce757ff9a6a48138c19d608e7f409be0a84a99271625df89551b7bf4de871469c1f5dfb40a2e430b914d3b9'
        'd5fca320845fc1a7515d79a5b50398f8073f009a9a642e9941f5e3970529376ade2542d49dd66ec66ba3c15bf92be9d8dea0c89cafe6381d744588b531a0a993')

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
