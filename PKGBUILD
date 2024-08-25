# Maintainer:Bipin Kumar <kbipinkumar@pm.me>
pkgbase=abpoa
pkgname=('abpoa' 'pyabpoa')
pkgname=abpoa
pkgdesc="SIMD-based C library for fast partial order alignment. https://dx.doi.org/10.1093/bioinformatics/btaa963"
_name=abPOA
pkgver=1.5.2
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
        "relax-cython-dep.patch"
        )

b2sums=('d74a6a8b0cad57ee3849e2ca866e39a1c89090e6e2fa6d99f82559287248cb2f6747998d93adff70a94334e05c36663c42851c96bf19aaec440351b62ffd5b04'
        'ca47e595ff4d1b27e72ccb8ca900ba1524a23444198be4e9a05b8f49688832553d8e035f391f359d5fb3324ba23178ba5ac280069c46121f0c17e6d6050c66e2'
        '6ef4e3d5f8a37bc103ca2b720bf4a064825b25382d2cb6d99edfeb5388fda821190dd0ebc35e0ab3e1507e4c27f6815f843419bcfbb9c017594165d377c49a02'
        '531591beb6430dabb045167a96d901af2fc4945a88b17ca7ba369115bf6314b7d4aa1830a3ca9748ed0cf8a5b5e1a48389ac830bc1a1e5276be1b22ad1b8e11e'
        '59ebf7e79f80bae90dea9b03e649ac21ea31a2759d0ca340ac5060927c758e3c09327d9074db3ad0abab16d2f15293a3dc611c67388d60b94aad61dfd4a12b99'
        'd7b5054c4a4092e345bf1d893645eb3a3516faf2b0f76f13f022c01ae3deb6b7d4f871ded08d97d6a44372354aeebbfa8cfcc87cec145eb04514c336fc302e27')

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
