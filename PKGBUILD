# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=caffe-cuda-git
pkgname=(
    'caffe-cuda-git'
    'caffe-cuda-doc-git')
pkgver=1.0.r136.g9b8915401
pkgrel=5
pkgdesc='A deep learning framework made with expression, speed, and modularity in mind (with cuda support, git version)'
arch=('x86_64')
url='https://caffe.berkeleyvision.org/'
license=('BSD-2-Clause')
makedepends=(
    'boost'
    'boost-libs'
    'cuda'
    'doxygen'
    'gflags'
    'ghostscript'
    'git'
    'google-glog'
    'hdf5'
    'leveldb'
    'lmdb'
    'nccl'
    'openblas'
    'opencv'
    'protobuf'
    'python'
    'python-numpy'
    'python-pandas'
    'python-protobuf' # to satisfy pkgcheck
    'python-scikit-image' # to satisfy pkgcheck
    'python-scipy' # to satisfy pkgcheck
    'python-six' # to satisfy pkgcheck
    'texlive-core'
    'texlive-fontutils'
    'texlive-latexextra')
source=('git+https://github.com/BVLC/caffe.git'
        'Makefile.config'
        '010-caffe-opencv4-fix.patch'::'https://github.com/BVLC/caffe/commit/7f503bd9a19758a173064e299ab9d4cac65ed60f.patch'
        '020-caffe-protobuf3.19.4-fix.patch'::'https://github.com/BVLC/caffe/commit/1b317bab3f6413a1b5d87c9d3a300d785a4173f9.patch'
        '030-caffe-cuda10-fix.patch'::'https://github.com/BVLC/caffe/commit/7ae5c5b9d07895e77a6ed0cafbe790aa5504b6a7.patch'
        '040-caffe-cuda13-fix.patch'::'https://github.com/BVLC/caffe/commit/ef66a5ce0d32ee8773999ed477499ca7340e4a82.patch')
sha256sums=('SKIP'
            '9852ef4696efc3401e7c16a2226be3a34648dc6782ab456608682a5df37e90bf'
            '2072c8ca1393b53ef280a15c43af940cc9bf1419ae32b3d8a6541b10b8cb50e9'
            '65be5a646ab32e9b277b4352b702a57ac6c79af5258e12e33b9751f07d1031aa'
            'a46aa391d4f7df7dd038c753ecbc0459722cd4df19dbac166a3b3f39a659d39a'
            '92d8221211e1cd08a5d0de885a8d9171710d72303d7846da28176a9de3204705')

prepare() {
    cp -af Makefile.config caffe
    
    # https://github.com/BVLC/caffe/pull/6625
    patch -d caffe -Np1 -i "${srcdir}/010-caffe-opencv4-fix.patch"
    
    # https://github.com/BVLC/caffe/pull/7044
    patch -d caffe -Np1 -i "${srcdir}/020-caffe-protobuf3.19.4-fix.patch"
    
    # https://github.com/BVLC/caffe/pull/6681
    patch -d caffe -Np1 -i "${srcdir}/030-caffe-cuda10-fix.patch"
    
    # https://github.com/BVLC/caffe/pull/7092
    patch -d caffe -Np1 -i "${srcdir}/040-caffe-cuda13-fix.patch"
}

pkgver() {
    git -C caffe describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    # definitions needed by glog >= 0.7.0
    export COMMON_FLAGS='-DGLOG_USE_GLOG_EXPORT -DGLOG_USE_GFLAGS'
    
    make -C caffe all pycaffe test
    rm -rf  caffe/doxygen
    make -C caffe docs distribute
}

check() {
    make -C caffe runtest
}

package_caffe-cuda-git() {
    depends=(
        'boost-libs'
        'cuda'
        'gcc-libs'
        'gflags'
        'google-glog'
        'glibc'
        'hdf5'
        'leveldb'
        'lmdb'
        'nccl'
        'openblas'
        'opencv'
        'protobuf'
        'python'
        'python-numpy'
        'python-pandas')
    optdepends=(
        'python-protobuf: for Python bindings'
        'python-pydotplus: for draw_net.py executable'
        'python-scikit-image: for Python bindings'
        'python-scipy: for Python bindings'
        'python-six: for Python bindings')
    provides=('caffe' 'caffe-cuda' 'caffe-git')
    conflicts=('caffe')
    
    local _pyver
    _pyver="$(python -c 'import sys; print("%s.%s" %sys.version_info[0:2])')"
    
    install -d -m755 "${pkgdir}/usr"/{bin,include,lib/python"$_pyver"/site-packages}
    
    # binaries
    install -m755 caffe/distribute/bin/* "${pkgdir}/usr/bin"
    
    # library
    local _sover
    local _sover_full
    _sover="$(find caffe/distribute/lib -type f -name "libcaffe.so.*.*.*" | sed 's|.*\.so\.||;s|\..*||')"
    _sover_full="$(find caffe/distribute/lib -type f -name "libcaffe.so.*.*.*" | sed 's|.*\.so\.||')"
    cp -dr --no-preserve='ownership' caffe/distribute/lib/libcaffe.so* "${pkgdir}/usr/lib"
    ln -s "libcaffe.so.${_sover_full}" "${pkgdir}/usr/lib/libcaffe.so.${_sover}"
    chmod 644 "${pkgdir}/usr/lib"/libcaffe.so.*.*.*
    
    # headers
    cp -dr --no-preserve='ownership' caffe/distribute/include "${pkgdir}/usr"
    
    # python
    install -D -m755 caffe/distribute/python/*.py "${pkgdir}/usr/bin"
    cp -dr --no-preserve='ownership' caffe/distribute/python/caffe "${pkgdir}/usr/lib/python${_pyver}/site-packages"
    
    # proto
    install -D -m644 caffe/distribute/proto/caffe.proto -t "${pkgdir}/usr/share/caffe"
    
    # license
    install -D -m644 caffe/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_caffe-cuda-doc-git() {
    pkgdesc="$(sed 's/\(git[[:space:]]version\)/documentation, \1/' <<< "$pkgdesc")"
    arch=('any')
    provides=('caffe-doc' 'caffe-doc-git')
    conflicts=('caffe-doc')
    
    install -d -m755 "${pkgdir}/usr/share/doc"
    cp -dr --no-preserve='ownership' caffe/doxygen/html "${pkgdir}/usr/share/doc/caffe"
    install -D -m644 caffe/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
