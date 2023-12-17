# Maintainer:Bipin Kumar <kbipinkumar@pm.me>
pkgbase=abpoa
pkgname=('abpoa' 'pyabpoa')
pkgname=abpoa
pkgdesc="SIMD-based C library for fast partial order alignment. https://dx.doi.org/10.1093/bioinformatics/btaa963"
_name=abPOA
pkgver=1.4.2
pkgrel=2
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
        "typos.patch"
        "python_baseline.patch")

b2sums=('3d2d9336b8ac12177b4abb1bebe549cf89583ef5b7f769dac10dc80d5c3349b294fdcaab38d15564a998e41d3ee691f56743e7c6905e010f5ce032cab62c0565'
        'c6dcff29c6843d3bc4cbf54a0e8068e4f243d3ffdcf0cb03d0ba8a93420cf9b839d61b77b6def38147f1e84d0ae2e81c09c5846b4f0f5935801cc4420612696f'
        'ca7cf211089960ded5aa807c823c441f1047108843e2eed30c4c2b747018b2a8d8dc94fc280cef38f4c16f7308fe22bf3c97d502f86e76a058fdba76aac0fadf'
        '9b33deaf4523b5b90730576dab12425c25aff4a850ba86f1024ac1e3650bbcd7ae803574b2c557910ca8de627522b8b1354041f3a42d50dd2bc952a3fbfba205'
        '37dfb994e3d7b011341a20a69b37c065568cb609c92b792d60cc1ca112f8d57d6346c4e9e5dd55ec9252b9db1f26bc6b72fc05c6a3fe6cf4894facd3bb7ad340'
        '997fb5d98bfd0332009ca7c1707edb39c2ad6ced261c62fa5dec637f55b0e11bb76c634fee3e19a8672fb685babd640daac4a5879be19806e75d9e3152b8593f'
        '8589c925c5c766a2d5ace2740f88ac5a82bcdaf073311312df7b876f70ee81ebb980740bfa6ab1c80bfe4ddbe1748803f841cf97516f1b1549c043ac4dbdae12')

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
