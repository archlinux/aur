# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=tellusim-core-sdk-git
pkgver=r22.fdd3b31
pkgrel=1
pkgdesc='Cross-platform C++ SDK for graphics, compute and simulation (git version)'
arch=('x86_64')
url='https://tellusim.com/'
license=('LicenseRef-custom')
depends=(
    'gcc-libs'
    'glibc')
optdepends=(
    'java-runtime: for java bindings'
    'python: for python bindings')
makedepends=(
    'clang'
    'cmake'
    'git'
    'java-environment'
    'python')
provides=('tellusim-core-sdk')
conflicts=('tellusim-core-sdk')
options=('!strip')
source=('git+https://github.com/Tellusim/Tellusim_Core_SDK.git#branch=linux_x64'
        '010-tellesium-core-sdk-fix-build.patch')
sha256sums=('SKIP'
            '6789d50a92e25014349f573d98bddbb78958d052c8f298fa08d22e29492b1295')

prepare() {
    patch -d Tellusim_Core_SDK -Np1 -i "${srcdir}/010-tellesium-core-sdk-fix-build.patch"
    rm Tellusim_Core_SDK/plugins/binding/java/tellusim.jar
}

pkgver() {
    ( set -o pipefail
        git -C Tellusim_Core_SDK describe --long --abbrev='7' 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
        printf 'r%s.%s' "$(git -C Tellusim_Core_SDK rev-list --count HEAD)" "$(git -C Tellusim_Core_SDK rev-parse --short='7' HEAD)"
    )
}

build() {
    local -a cmake_opts=(
        '-DBUILD_SHARED_LIBS:BOOL=ON'
        '-DCMAKE_BUILD_TYPE:STRING=Release'
        '-DCMAKE_INSTALL_PREFIX:PATH=/usr'
        '-Wno-dev')
    
    export CC='clang'
    export CXX='clang++'
    export LDFLAGS+=" -L${srcdir}/Tellusim_Core_SDK/lib/linux/x64"
    
    cmake -B build-capi -S Tellusim_Core_SDK/plugins/binding/capi "${cmake_opts[@]}"
    cmake --build build-capi
    
    local _java_env
    local _jni_include
    _java_env="$(archlinux-java get)"
    _jni_include="-isystem/usr/lib/jvm/${_java_env}/include"
    _jni_include+=" -isystem/usr/lib/jvm/${_java_env}/include/linux"
    
    CFLAGS+=" ${_jni_include}" \
    CXXFLAGS+=" ${_jni_include}" \
    cmake -B build-java -S Tellusim_Core_SDK/plugins/binding/java "${cmake_opts[@]}"
    cmake --build build-java
    
    JAVA_HOME="/usr/lib/jvm/${_java_env}" \
    make -C Tellusim_Core_SDK/plugins/binding/java tellusim.jar
    
    local _pyver
    _pyver="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    
    CXXFLAGS+=" -isystem/usr/include/python${_pyver}" \
    cmake -B build-python -S Tellusim_Core_SDK/plugins/binding/python "${cmake_opts[@]}"
    cmake --build build-python
    
    TSROOT="${srcdir}/Tellusim_Core_SDK" debug='0' make -C Tellusim_Core_SDK/tools
}

package() {
    local _sitepkgs
    _sitepkgs="$(python -c 'import site; print(site.getsitepackages()[0])')"
    
    install -d -m755 "${pkgdir}/usr/"{lib,share/doc}
    install -D -m644 Tellusim_Core_SDK/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    cp -dr --no-preserve='ownership' Tellusim_Core_SDK/docs "${pkgdir}/usr/share/doc/tellusim-core-sdk"
    cp -dr --no-preserve='ownership' Tellusim_Core_SDK/include "${pkgdir}/usr"
    cp -dr --no-preserve='ownership' Tellusim_Core_SDK/lib/linux/x64/libTellusim_x64.so "${pkgdir}/usr/lib"
    install -D -m644 Tellusim_Core_SDK/plugins/binding/{capi,java}/include/* "${pkgdir}/usr/include"
    install -D -m644 build-capi/libTellusimC_x64.so -t "${pkgdir}/usr/lib"
    install -D -m644 build-java/libTellusimJNI_x64.so -t "${pkgdir}/usr/lib"
    install -D -m644 build-python/libTellusimPy_x64.so "${pkgdir}${_sitepkgs}/tellusim/tellusim.so"
    install -D -m644 Tellusim_Core_SDK/plugins/binding/java/tellusim.jar -t "${pkgdir}/usr/share/java"
    
    local _tool
    for _tool in blob image mesh noise project shader
    do
        install -D -m755 "Tellusim_Core_SDK/tools/${_tool}/${_tool}" "${pkgdir}/usr/bin/ts_${_tool}"
    done
    
    strip $STRIP_BINARIES "${pkgdir}/usr/bin"/*
    strip $STRIP_SHARED "${pkgdir}/usr/lib"/libTellusim{C,JNI}_x64.so "${pkgdir}${_sitepkgs}/tellusim/tellusim.so"
}
