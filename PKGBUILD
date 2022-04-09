# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=vosk-api-git
pkgver=0.3.32.r49.g7b7d814
pkgrel=1
pkgdesc='Offline speech recognition toolkit (git version)'
arch=('x86_64')
url='https://alphacephei.com/vosk/'
license=('Apache')
depends=('gcc-libs')
optdepends=('java-runtime: for java bindings'
            'python-cffi: for python module')
makedepends=('git' 'cmake' 'gradle' 'python' 'python-cffi' 'python-setuptools')
source=('git+https://github.com/alphacep/vosk-api.git'
        'git+https://github.com/xianyi/OpenBLAS.git'
        'git+https://github.com/alphacep/clapack.git'
        'git+https://github.com/alphacep/openfst.git'
        'git+https://github.com/alphacep/kaldi.git#branch=vosk')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    local _curl='curl -sqgb "" -fLC - --retry 3 --retry-delay 3'
    local _url='https://raw.githubusercontent.com/alphacep/vosk-api/master/travis/Dockerfile.manylinux'
    git -C OpenBLAS config --local advice.detachedHead false
    git -C clapack config --local advice.detachedHead false
    git -C OpenBLAS checkout "$(awk '/xianyi\/OpenBLAS/ { print $5 }' <($_curl "$_url"))"
    git -C clapack checkout "$(awk '/alphacep\/clapack/ { print $5 }' <($_curl "$_url"))"
    
    ln -sf ../../OpenBLAS kaldi/tools/OpenBLAS
    ln -sf ../../clapack kaldi/tools/clapack
    ln -sf ../../openfst kaldi/tools/openfst
    
    autoreconf -fi openfst
}

pkgver() {
    git -C vosk-api describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
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
    python setup.py build
}

package() {
    install -d -m755 "${pkgdir}/usr/lib"
    install -D -m644 vosk-api/src/vosk_api.h -t "${pkgdir}/usr/include"
    cp -dr --no-preserve='ownership' vosk-api/src/*.so* "${pkgdir}/usr/lib"
    
    local _ver
    _ver="$(awk "/^version[[:space:]]=/ { gsub(/'/, \"\", \$3); print \$3 }" vosk-api/java/lib/build.gradle)"
    install -D -m644 "vosk-api/java/lib/build/libs/vosk-${_ver}.jar" "${pkgdir}/usr/share/java/vosk.jar"
    
    local _pyver
    _pyver="$(python -c 'import sys; print("%s.%s" %sys.version_info[0:2])')"
    cd vosk-api/python
    python setup.py install --root="$pkgdir" --skip-build --optimize='1'
    rm "${pkgdir}/usr/lib/python${_pyver}/site-packages/vosk/libvosk.so"
    ln -s ../../../libvosk.so "${pkgdir}/usr/lib/python${_pyver}/site-packages/vosk/libvosk.so"
}
