# Maintainer : Daniel Bermond <dbermond@archlinux.org>

pkgbase=caffe-cuda
pkgname=('caffe-cuda' 'caffe-cuda-doc')
pkgver=1.0
pkgrel=12
pkgdesc='A deep learning framework made with expression, speed, and modularity in mind (with cuda support)'
arch=('x86_64')
url='https://caffe.berkeleyvision.org/'
license=('BSD')
makedepends=('openblas' 'lapack' 'boost-libs' 'protobuf' 'google-glog' 'gflags'
             'hdf5' 'opencv' 'leveldb' 'lmdb' 'python' 'python-numpy' 'python-pandas'
             'cuda' 'nccl'
             'boost' 'doxygen' 'texlive-core' 'texlive-latexextra' 'ghostscript')
source=("https://github.com/BVLC/caffe/archive/${pkgver}/caffe-${pkgver}.tar.gz"
        'Makefile.config'
        '010-caffe-opencv4-fix.patch'::'https://github.com/BVLC/caffe/commit/7f503bd9a19758a173064e299ab9d4cac65ed60f.patch'
        '020-caffe-protobuf3.19.4-fix.patch'::'https://github.com/BVLC/caffe/commit/1b317bab3f6413a1b5d87c9d3a300d785a4173f9.patch'
        '030-caffe-cuda10-fix.patch'::'https://github.com/BVLC/caffe/commit/7ae5c5b9d07895e77a6ed0cafbe790aa5504b6a7.patch')
sha256sums=('71d3c9eb8a183150f965a465824d01fe82826c22505f7aa314f700ace03fa77f'
            'dd729ce6944f0608dec13928507d2b3c5e155bd204d9217b356f6f4562f1dd42'
            '2072c8ca1393b53ef280a15c43af940cc9bf1419ae32b3d8a6541b10b8cb50e9'
            '65be5a646ab32e9b277b4352b702a57ac6c79af5258e12e33b9751f07d1031aa'
            'a46aa391d4f7df7dd038c753ecbc0459722cd4df19dbac166a3b3f39a659d39a')

prepare() {
    cp -af Makefile.config "caffe-${pkgver}"
    
    # https://github.com/BVLC/caffe/pull/6625
    patch -d "caffe-${pkgver}" -Np1 -i "${srcdir}/010-caffe-opencv4-fix.patch"
    
    # https://github.com/BVLC/caffe/pull/7044
    patch -d "caffe-${pkgver}" -Np1 -i "${srcdir}/020-caffe-protobuf3.19.4-fix.patch"
    
    # https://github.com/BVLC/caffe/pull/6681
    patch -d "caffe-${pkgver}" -Np1 -i "${srcdir}/030-caffe-cuda10-fix.patch"
}

build() {
    make -C "caffe-${pkgver}" all pycaffe test
    rm -rf  "caffe-${pkgver}/doxygen"
    make -C "caffe-${pkgver}" docs distribute
}

check() {
    make -C "caffe-${pkgver}" runtest
}

package_caffe-cuda() {
    depends=('openblas' 'lapack' 'boost-libs' 'protobuf' 'google-glog' 'gflags'
             'hdf5' 'opencv' 'leveldb' 'lmdb' 'python' 'python-numpy' 'python-pandas'
             'cuda' 'nccl')
    optdepends=(
        # official repositories:
            'cython' 'python-scipy' 'python-matplotlib' 'ipython' 'python-h5py'
            'python-networkx' 'python-nose' 'python-dateutil' 'python-protobuf'
            'python-gflags' 'python-yaml' 'python-pillow' 'python-six'
        # AUR:
            'python-leveldb' 'python-scikit-image' 'python-pydotplus'
        # NOTE:
        # python-pydotplus (or python-pydot) is required by python executable 'draw_net.py'
        # https://github.com/BVLC/caffe/blob/1.0/python/caffe/draw.py#L7-L22
    )
    provides=('caffe')
    conflicts=('caffe')
    
    local _pyver
    _pyver="$(python -c 'import sys; print("%s.%s" %sys.version_info[0:2])')"
    
    install -d -m755 "${pkgdir}/usr"/{bin,include,lib/python"$_pyver"/site-packages}
    
    # binaries
    install -m755 "caffe-${pkgver}/distribute/bin"/* "${pkgdir}/usr/bin"
    
    # library
    local _sover
    local _sover_full
    _sover="$(find "caffe-${pkgver}/distribute/lib" -type f -name "libcaffe.so.*.*.*" | sed 's|.*\.so\.||;s|\..*||')"
    _sover_full="$(find "caffe-${pkgver}/distribute/lib" -type f -name "libcaffe.so.*.*.*" | sed 's|.*\.so\.||')"
    cp -dr --no-preserve='ownership' "caffe-${pkgver}/distribute/lib"/libcaffe.so* "${pkgdir}/usr/lib"
    ln -s "libcaffe.so.${_sover_full}" "${pkgdir}/usr/lib/libcaffe.so.${_sover}"
    chmod 755 "${pkgdir}/usr/lib"/libcaffe.so.*.*.*
    
    # headers
    cp -dr --no-preserve='ownership' "caffe-${pkgver}/distribute/include" "${pkgdir}/usr"
    
    # python
    install -D -m755 "caffe-${pkgver}/distribute/python"/*.py "${pkgdir}/usr/bin"
    cp -dr --no-preserve='ownership' "caffe-${pkgver}/distribute/python/caffe" "${pkgdir}/usr/lib/python${_pyver}/site-packages"
    
    # proto
    install -D -m644 "caffe-${pkgver}/distribute/proto/caffe.proto" -t "${pkgdir}/usr/share/caffe"
    
    # license
    install -D -m644 "caffe-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_caffe-cuda-doc() {
    pkgdesc="$(sed 's/)/, documentation)/' <<< "$pkgdesc")"
    arch=('any')
    provides=('caffe-doc')
    conflicts=('caffe-doc')
    
    install -d -m755 "${pkgdir}/usr/share/doc"
    cp -dr --no-preserve='ownership' "caffe-${pkgver}/doxygen/html" "${pkgdir}/usr/share/doc/caffe"
    install -D -m644 "caffe-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
