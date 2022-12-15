# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=vosk-api-git
pkgname=('vosk-api-git' 'python-vosk-git')
pkgver=0.3.45.r0.gcf2560c
pkgrel=1
_model_small_ver=0.15
_model_spk_ver=0.4
pkgdesc='Offline speech recognition toolkit (git version)'
arch=('x86_64')
url='https://alphacephei.com/vosk/'
license=('Apache')
makedepends=('git' 'cmake' 'gradle' 'python' 'python-build' 'python-cffi' 'python-installer'
             'python-requests' 'python-setuptools' 'python-srt' 'python-tqdm' 'python-websockets'
             'python-wheel' 'java-environment=17')
checkdepends=('ffmpeg' 'python-numpy')
source=('git+https://github.com/alphacep/vosk-api.git'
        'git+https://github.com/xianyi/OpenBLAS.git'
        'git+https://github.com/alphacep/clapack.git'
        'git+https://github.com/alphacep/openfst.git'
        'git+https://github.com/alphacep/kaldi.git#branch=vosk'
        "https://alphacephei.com/kaldi/models/vosk-model-small-en-us-${_model_small_ver}.zip"
        "https://alphacephei.com/vosk/models/vosk-model-spk-${_model_spk_ver}.zip")
noextract=("vosk-model-small-en-us-${_model_small_ver}.zip")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '30f26242c4eb449f948e42cb302dd7a686cb29a3423a8367f99ff41780942498'
            'a74d8f51144484813e16af689bb0f916b7a111e2347f467c4933c1166097b5a7')

prepare() {
    local _curl='curl -sqgb "" -fLC - --retry 3 --retry-delay 3'
    local _url='https://raw.githubusercontent.com/alphacep/vosk-api/master/travis/Dockerfile.manylinux'
    git -C OpenBLAS config --local advice.detachedHead false
    git -C clapack config --local advice.detachedHead false
    git -C OpenBLAS checkout --quiet "$(awk '/xianyi\/OpenBLAS/ { print $5 }' <($_curl "$_url"))"
    git -C clapack checkout --quiet "$(awk '/alphacep\/clapack/ { print $5 }' <($_curl "$_url"))"
    
    mkdir -p models
    bsdtar -x -f  "vosk-model-small-en-us-${_model_small_ver}.zip" -C models
    ln -sf "../../../vosk-model-spk-${_model_spk_ver}" vosk-api/python/example/model-spk
    ln -sf ../../OpenBLAS kaldi/tools/OpenBLAS
    ln -sf ../../clapack kaldi/tools/clapack
    ln -sf ../../openfst kaldi/tools/openfst
    
    autoreconf -fi openfst
}

pkgver() {
    git -C vosk-api describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/go\///;s/^v//'
}

build() {
    local _file
    export CFLAGS+=' -ffat-lto-objects'
    export CXXFLAGS+=' -ffat-lto-objects'
    
    # openblas
    make -C OpenBLAS ONLY_CBLAS='1' DYNAMIC_ARCH='1' TARGET='NEHALEM' USE_LOCKING='1' USE_THREAD='0' all
    make -C OpenBLAS PREFIX="${srcdir}/OpenBLAS/install" install
    
    # clapack
    CFLAGS+=' -Wno-error=format-security -fcommon' cmake -B build-clapack -S clapack -Wno-dev
    make -C build-clapack
    while read -r -d '' _file
    do
        cp -af "$_file" "${srcdir}/OpenBLAS/install/lib"
    done < <(find build-clapack -type f -name '*.a' -print0)
    
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
    make -C "${srcdir}/vosk-api/src" \
        EXTRA_CFLAGS="${CXXFLAGS/-O2/-O3}" \
        EXTRA_LDFLAGS="$LDFLAGS" \
        KALDI_ROOT="${srcdir}/kaldi" \
        OPENFST_ROOT="${srcdir}/kaldi/tools/openfst" \
        OPENBLAS_ROOT="${srcdir}/kaldi/tools/OpenBLAS/install"
    
    # java bindings
    gradle -p "${srcdir}/vosk-api/java/lib" clean assemble
    
    # python module
    cd "${srcdir}/vosk-api/python"
    python ./vosk_builder.py
    python -m build --wheel --no-isolation
}

check() {
    local _test
    cd vosk-api/python/example
    # https://github.com/alphacep/vosk-api/issues/1220
    for _test in alternatives empty ffmpeg nlsml simple speaker srt text words #reset
    do
        printf '%s\n' "Running test_${_test}..."
        PYTHONPATH="${PWD}/../build/lib" VOSK_MODEL_PATH="${srcdir}/models" python "./test_${_test}.py" test.wav
    done
}

package_vosk-api-git() {
    depends=('gcc-libs')
    optdepends=('java-runtime: for java bindings')
    provides=('vosk-api')
    conflicts=('vosk-api')
    
    install -d -m755 "${pkgdir}/usr/lib"
    install -D -m644 vosk-api/src/vosk_api.h -t "${pkgdir}/usr/include"
    cp -dr --no-preserve='ownership' vosk-api/src/*.so* "${pkgdir}/usr/lib"
    
    local _ver
    _ver="$(awk "/^version[[:space:]]=/ { gsub(/'/, \"\", \$3); print \$3 }" vosk-api/java/lib/build.gradle)"
    install -D -m644 "vosk-api/java/lib/build/libs/vosk-${_ver}.jar" "${pkgdir}/usr/share/java/vosk.jar"
}

package_python-vosk-git() {
    pkgdesc='Python module for vosk-api (git version)'
    depends=('python' 'python-cffi' 'python-requests' 'python-srt' 'python-tqdm' 'python-websockets'
             "vosk-api-git=${pkgver}")
    provides=('python-vosk')
    conflicts=('python-vosk')
    
    local _pyver
    _pyver="$(python -c 'import sys; print("%s.%s" %sys.version_info[0:2])')"
    python -m installer --destdir="$pkgdir" vosk-api/python/dist/*.whl
    rm "${pkgdir}/usr/lib/python${_pyver}/site-packages/vosk/libvosk.so"
    ln -s ../../../libvosk.so "${pkgdir}/usr/lib/python${_pyver}/site-packages/vosk/libvosk.so"
}
