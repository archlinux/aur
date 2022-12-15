# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=vosk-api
pkgname=('vosk-api' 'python-vosk')
pkgver=0.3.45
pkgrel=1
_openblas_ver=0.3.20
_clapack_ver=3.2.1
_model_small_ver=0.15
_model_spk_ver=0.4
_openfst_commit=7dfd808194105162f20084bb4d8e4ee4b65266d5
_kaldi_commit=93ef0019b847272a239fbb485ef97f29feb1d587
pkgdesc='Offline speech recognition toolkit'
arch=('x86_64')
url='https://alphacephei.com/vosk/'
license=('Apache')
makedepends=('git' 'cmake' 'gradle' 'python' 'python-build' 'python-cffi' 'python-installer'
             'python-requests' 'python-setuptools' 'python-srt' 'python-tqdm' 'python-websockets'
             'python-wheel' 'java-environment=17')
checkdepends=('ffmpeg' 'python-numpy')
source=("https://github.com/alphacep/vosk-api/archive/v${pkgver}/${pkgbase}-${pkgver}.tar.gz"
        "https://github.com/xianyi/OpenBLAS/archive/v${_openblas_ver}/openblas-${_openblas_ver}.tar.gz"
        "https://github.com/alphacep/clapack/archive/v${_clapack_ver}/clapack-${_clapack_ver}.tar.gz"
        "kaldi-vosk-g${_kaldi_commit:0:7}.tar.gz"::"https://github.com/alphacep/kaldi/archive/${_kaldi_commit}.tar.gz"
        "https://alphacephei.com/kaldi/models/vosk-model-small-en-us-${_model_small_ver}.zip"
        "https://alphacephei.com/vosk/models/vosk-model-spk-${_model_spk_ver}.zip"
        "git+https://github.com/alphacep/openfst.git#commit=${_openfst_commit}")
noextract=("vosk-model-small-en-us-${_model_small_ver}.zip")
sha256sums=('930fb9cfa6c1b3035d3730feee7d670fb893caa0c71bd2159ee7623102674c26'
            '8495c9affc536253648e942908e88e097f2ec7753ede55aca52e5dead3029e3c'
            '8d8ff8259454cae392bb58bc4971fef1db632c9fb5cdf61255cd495bd6d6ac4d'
            'f47a996af546884a8e1cb961323b796c5c238c1bbeabaf657bb300b760e431b2'
            '30f26242c4eb449f948e42cb302dd7a686cb29a3423a8367f99ff41780942498'
            'a74d8f51144484813e16af689bb0f916b7a111e2347f467c4933c1166097b5a7'
            'SKIP')

prepare() {
    mkdir -p models
    bsdtar -x -f  "vosk-model-small-en-us-${_model_small_ver}.zip" -C models
    ln -sf "../../../vosk-model-spk-${_model_spk_ver}" "${pkgbase}-${pkgver}/python/example/model-spk"
    ln -sf "../../OpenBLAS-${_openblas_ver}" "kaldi-${_kaldi_commit}/tools/OpenBLAS"
    ln -sf "../../clapack-${_clapack_ver}" "kaldi-${_kaldi_commit}/tools/clapack"
    ln -sf ../../openfst "kaldi-${_kaldi_commit}/tools/openfst"
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
        --prefix="${srcdir}/kaldi-${_kaldi_commit}/tools/openfst" \
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
    cd "${srcdir}/kaldi-${_kaldi_commit}/src"
    CXXFLAGS="${CXXFLAGS/-O2/-O3}" ./configure --mathlib='OPENBLAS_CLAPACK' --shared --use-cuda='no'
    sed -i 's/[[:space:]]-O1[[:space:]]/ -O3 /g' kaldi.mk
    make online2 lm rnnlm
    while read -r -d '' _file
    do
        rm "$_file"
    done < <(find "${srcdir}/kaldi-${_kaldi_commit}" -type f -name '*.o' -print0)
    
    # vosk-api
    export CFLAGS="${CFLAGS/ -ffat-lto-objects/}"
    export CXXFLAGS="${CXXFLAGS/ -ffat-lto-objects/}"
    make -C "${srcdir}/${pkgbase}-${pkgver}/src" \
        EXTRA_CFLAGS="${CXXFLAGS/-O2/-O3}" \
        EXTRA_LDFLAGS="$LDFLAGS" \
        KALDI_ROOT="${srcdir}/kaldi-${_kaldi_commit}" \
        OPENFST_ROOT="${srcdir}/kaldi-${_kaldi_commit}/tools/openfst" \
        OPENBLAS_ROOT="${srcdir}/kaldi-${_kaldi_commit}/tools/OpenBLAS/install"
    
    # java bindings
    gradle -p "${srcdir}/${pkgbase}-${pkgver}/java/lib" clean assemble
    
    # python module
    cd "${srcdir}/${pkgbase}-${pkgver}/python"
    python ./vosk_builder.py
    python -m build --wheel --no-isolation
}

check() {
    local _test
    cd "${pkgbase}-${pkgver}/python/example"
    # https://github.com/alphacep/vosk-api/issues/1220
    for _test in alternatives empty ffmpeg nlsml simple speaker srt text words #reset
    do
        printf '%s\n' "Running test_${_test}..."
        PYTHONPATH="${PWD}/../build/lib" VOSK_MODEL_PATH="${srcdir}/models" python "./test_${_test}.py" test.wav
    done
}

package_vosk-api() {
    depends=('gcc-libs')
    optdepends=('java-runtime: for java bindings')
    
    install -d -m755 "${pkgdir}/usr/lib"
    install -D -m644 "${pkgbase}-${pkgver}/src/vosk_api.h" -t "${pkgdir}/usr/include"
    install -D -m644 "${pkgbase}-${pkgver}/java/lib/build/libs/vosk-${pkgver}.jar" "${pkgdir}/usr/share/java/vosk.jar"
    cp -dr --no-preserve='ownership' "${pkgbase}-${pkgver}/src"/*.so* "${pkgdir}/usr/lib"
}

package_python-vosk() {
    pkgdesc='Python module for vosk-api'
    depends=('python' 'python-cffi' 'python-requests' 'python-srt' 'python-tqdm' 'python-websockets'
             "vosk-api=${pkgver}")
    
    local _pyver
    _pyver="$(python -c 'import sys; print("%s.%s" %sys.version_info[0:2])')"
    python -m installer --destdir="$pkgdir" "${pkgbase}-${pkgver}/python/dist"/*.whl
    rm "${pkgdir}/usr/lib/python${_pyver}/site-packages/vosk/libvosk.so"
    ln -s ../../../libvosk.so "${pkgdir}/usr/lib/python${_pyver}/site-packages/vosk/libvosk.so"
}
