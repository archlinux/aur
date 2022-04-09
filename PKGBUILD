# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=vosk-api
pkgver=0.3.32
pkgrel=2
_openblas_ver=0.3.13
_clapack_ver=3.2.1
_openfst_commit=7dfd808194105162f20084bb4d8e4ee4b65266d5
_kaldi_commit=593861b96eb15c9ee625d89629ea586591a9d4ae
pkgdesc='Offline speech recognition toolkit'
arch=('x86_64')
url='https://alphacephei.com/vosk/'
license=('Apache')
depends=('gcc-libs')
optdepends=('java-runtime: for java bindings'
            'python-cffi: for python module')
makedepends=('git' 'cmake' 'gradle' 'python' 'python-cffi' 'python-setuptools')
source=("https://github.com/alphacep/vosk-api/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "https://github.com/xianyi/OpenBLAS/archive/v${_openblas_ver}/openblas-${_openblas_ver}.tar.gz"
        "https://github.com/alphacep/clapack/archive/v${_clapack_ver}/clapack-${_clapack_ver}.tar.gz"
        "git+https://github.com/alphacep/openfst.git#commit=${_openfst_commit}"
        "git+https://github.com/alphacep/kaldi.git#commit=${_kaldi_commit}")
sha256sums=('acf61c1af48f15e4c6ac299b2aca3c17d83ec48073c5c6229e2de3601b1e6882'
            '79197543b17cc314b7e43f7a33148c308b0807cd6381ee77f77e15acf3e6459e'
            'ed1074b0f396608f304f5ae5e5090ea62aab741ed9f63c7677af9ba99a90ca78'
            'SKIP'
            'SKIP')

prepare() {
    ln -sf "../../OpenBLAS-${_openblas_ver}" kaldi/tools/OpenBLAS
    ln -sf "../../clapack-${_clapack_ver}" kaldi/tools/clapack
    ln -sf ../../openfst kaldi/tools/openfst
    autoreconf -fi openfst
}

build() {
    local _file
    export CFLAGS+=' -ffat-lto-objects'
    export CXXFLAGS+=' -ffat-lto-objects'
    
    # openblas
    make -C "OpenBLAS-${_openblas_ver}" ONLY_CBLAS='1' DYNAMIC_ARCH='1' TARGET='NEHALEM' USE_LOCKING='1' USE_THREAD='0' all
    make -C "OpenBLAS-${_openblas_ver}" PREFIX="${srcdir}/OpenBLAS-${_openblas_ver}/install" install
    
    # clapack
    CFLAGS+=' -Wno-error=format-security -fcommon' cmake -B "build-clapack-${_clapack_ver}" -S "clapack-${_clapack_ver}" -Wno-dev
    make -C "build-clapack-${_clapack_ver}"
    while read -r -d '' _file
    do
        cp -af "$_file" "${srcdir}/OpenBLAS-${_openblas_ver}/install/lib"
    done < <(find "build-clapack-${_clapack_ver}" -type f -name '*.a' -print0)
    
    # openfst
    cd openfst
    ./configure \
        --prefix="${srcdir}/kaldi/tools/openfst" \
        --enable-static \
        --enable-shared \
        --enable-far \
        --enable-ngram-fsts \
        --enable-lookahead-fsts \
        --with-pic \
        --disable-bin
    make
    make install
    
    # kaldi
    cd "${srcdir}/kaldi/src"
    CXXFLAGS="${CXXFLAGS/-O2/-O3}" ./configure --mathlib='OPENBLAS_CLAPACK' --shared --use-cuda='no'
    sed -i 's/[[:space:]]-O1[[:space:]]/ -O3 /g' kaldi.mk
    make online2 lm rnnlm
    while read -r -d '' _file
    do
        rm "$_file"
    done < <(find "${srcdir}/kaldi" -type f -name '*.o' -print0)
    
    # vosk-api
    export CFLAGS="${CFLAGS/ -ffat-lto-objects/}"
    export CXXFLAGS="${CXXFLAGS/ -ffat-lto-objects/}"
    make -C "${srcdir}/${pkgname}-${pkgver}/src" \
        EXTRA_CFLAGS="${CXXFLAGS/-O2/-O3}" \
        EXTRA_LDFLAGS="$LDFLAGS" \
        KALDI_ROOT="${srcdir}/kaldi" \
        OPENFST_ROOT="${srcdir}/kaldi/tools/openfst" \
        OPENBLAS_ROOT="${srcdir}/kaldi/tools/OpenBLAS/install"
    
    # java bindings
    gradle -p "${srcdir}/${pkgname}-${pkgver}/java/lib" clean assemble
    
    # python module
    cd "${srcdir}/${pkgname}-${pkgver}/python"
    python setup.py build
}

package() {
    install -d -m755 "${pkgdir}/usr/lib"
    install -D -m644 "${pkgname}-${pkgver}/src/vosk_api.h" -t "${pkgdir}/usr/include"
    install -D -m644 "${pkgname}-${pkgver}/java/lib/build/libs/vosk-${pkgver}.jar" "${pkgdir}/usr/share/java/vosk.jar"
    cp -dr --no-preserve='ownership' "${pkgname}-${pkgver}/src"/*.so* "${pkgdir}/usr/lib"
    
    local _pyver
    _pyver="$(python -c 'import sys; print("%s.%s" %sys.version_info[0:2])')"
    cd "${pkgname}-${pkgver}/python"
    python setup.py install --root="$pkgdir" --skip-build --optimize='1'
    rm "${pkgdir}/usr/lib/python${_pyver}/site-packages/vosk/libvosk.so"
    ln -s ../../../libvosk.so "${pkgdir}/usr/lib/python${_pyver}/site-packages/vosk/libvosk.so"
}
