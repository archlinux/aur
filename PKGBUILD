# Maintainer:Bipin Kumar <kbipinkumar@pm.me>
pkgbase=abpoa
pkgname=('abpoa' 'pyabpoa')
pkgname=abpoa
pkgdesc="SIMD-based C library for fast partial order alignment. https://dx.doi.org/10.1093/bioinformatics/btaa963"
_name=abPOA
pkgver=1.5.0
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
        )

b2sums=('fa4490690bd865f83b1d0cf65cf1a24309d6f3ad8c95a0ec74c6da22ae87cf35ed9d7c63df5254b1846f6feba2d64c14b08c8aee4b052ebb60787697567aac1c'
        'ca47e595ff4d1b27e72ccb8ca900ba1524a23444198be4e9a05b8f49688832553d8e035f391f359d5fb3324ba23178ba5ac280069c46121f0c17e6d6050c66e2'
        'bfee3142cc01cd8ab3547e61e3921b082557e0220a2d7809bf13a9d2274379547e9ad1131008b503705dc311aae78f51137eb0b282dbb6a5a359e3e5b4f0a9bd'
        '8295d934f470b2bf4eff817eb0eb1ae6ab051942044ad77d76f2f9ae5aaab1baca04c622bfd68e866c7e86a3e519aff32172c4af84d8e3382d130a08da08381c'
        '59ebf7e79f80bae90dea9b03e649ac21ea31a2759d0ca340ac5060927c758e3c09327d9074db3ad0abab16d2f15293a3dc611c67388d60b94aad61dfd4a12b99')

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
