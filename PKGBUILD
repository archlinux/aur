# Maintainer:Bipin Kumar <kbipinkumar@pm.me>
pkgbase=abpoa
pkgname=('abpoa' 'pyabpoa')
pkgname=abpoa
pkgdesc="SIMD-based C library for fast partial order alignment. https://dx.doi.org/10.1093/bioinformatics/btaa963"
_name=abPOA
pkgver=1.4.1
pkgrel=6
arch=(x86_64)
url="https://github.com/yangao07/abPOA"
license=('MIT')
makedepends=('cmake' 'git' 'python-build' 'quilt' 'simde' 'python'
             'python-installer' 'python-setuptools'
             'python-wheel'
             'cython')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/yangao07/abPOA/archive/refs/tags/v${pkgver}.tar.gz"
        "baseline.patch"
        "series"
        "buildflags.patch"
        "simde.patch"
        "typos.patch")

b2sums=('854ee84d64b9428764eeb86029aa1e40241231c3366c6f6471a62eea0e3ca85a9490c914d6599c3907c8365c63e120e76fec6c6ee9cc97f4729d6252bc5a8de7'
        '7890e4967f63cea41278c1b50bc43419117bca03bbd7ccf07bd6dbc58dbd757ee0df8a86abadcc9b2a92f3dedb1d750702be813912f14178bb9f5685bf12874d'
        'bd40f62ee6ca1b38090a394438401b0739413e1f00bb66f1d9789a6090ba1fa282aa042e10aa69ad06ae579a387fdbb2c063271129f85611294dd99a39ab5068'
        '9b33deaf4523b5b90730576dab12425c25aff4a850ba86f1024ac1e3650bbcd7ae803574b2c557910ca8de627522b8b1354041f3a42d50dd2bc952a3fbfba205'
        '37dfb994e3d7b011341a20a69b37c065568cb609c92b792d60cc1ca112f8d57d6346c4e9e5dd55ec9252b9db1f26bc6b72fc05c6a3fe6cf4894facd3bb7ad340'
        '997fb5d98bfd0332009ca7c1707edb39c2ad6ced261c62fa5dec637f55b0e11bb76c634fee3e19a8672fb685babd640daac4a5879be19806e75d9e3152b8593f')

prepare() {
    # adapt patches from debian to make use SIMDe from Archlinux repo 
    mkdir -p ${_name}-${pkgver}/patches
    cp series ${_name}-${pkgver}/patches
    cp *.patch ${_name}-${pkgver}/patches
    cd ${_name}-${pkgver}/patches
    quilt push -a
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
