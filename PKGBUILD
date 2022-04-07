pkgname=android-ndk-ollvm
pkgver=14.0.1
pkgrel=1
pkgdesc='Obfuscated llvm for Android NDK. It install LLVM with obfuscation support outside of android-ndk and use symlinks to NDK. Symlinks updates automaticly (via pacman hooks) on each android-ndk upgrade'
arch=('x86_64')
url='https://github.com/sr-tream/obfuscator'
license=('GPL' 'LGPL' 'custom')
options=('!strip' '!staticlibs')
install="$pkgname.install"
replaces=('android-ndk64-ollvm')
depends=('android-ndk>=r23')
makedepends=('cmake' 'clang' 'lld')
source=("update_links.sh"
        "${pkgname}.hook"
        "git+${url}.git#branch=release/14.x")
sha256sums=('8b644e42e6e33a607bcf2529c034007ee8bf2c3980f40c9da21cfc9450a4e7f5'
            '4ff51c89e7b047b0ca396c829fa5dbbf572559f15cefdf6d14e56251e208c5e9'
            'SKIP')

prepare() {
    cd ${srcdir}/obfuscator
    git submodule update --init llvm-project
    cd - && cd ${srcdir}/obfuscator/llvm-project
    git apply ../obfuscator.patch
    cd -
}

build() {
    mkdir {build,install}
    
    if ! command -v ccache &> /dev/null
    then
        cmake -B build -S "${srcdir}/obfuscator/llvm-project/llvm" \
            -DCMAKE_BUILD_TYPE=MinSizeRel \
            -DLLVM_ENABLE_PROJECTS="clang;lld" \
            -DLLVM_ENABLE_LLD=ON \
            -DLLVM_STATIC_LINK_CXX_STDLIB=ON \
            -DLLVM_TARGETS_TO_BUILD="ARM;AArch64;X86"
    else
        cmake -B build -S "${srcdir}/obfuscator/llvm-project/llvm" \
            -DCMAKE_BUILD_TYPE=MinSizeRel \
            -DLLVM_ENABLE_PROJECTS="clang;lld" \
            -DLLVM_ENABLE_LLD=ON \
            -DLLVM_STATIC_LINK_CXX_STDLIB=ON \
            -DLLVM_TARGETS_TO_BUILD="ARM;AArch64;X86" \
            -DLLVM_CCACHE_BUILD=ON
    fi
    
    cmake --build build --parallel
    cmake --install build --prefix install
    
    ln -s install/bin/ld.lld install/bin/ld
}

package() {
    install -Ddm755 "$pkgdir/opt/${pkgname}"
    install -Ddm755 "$pkgdir/usr/share/libalpm/hooks"
    
    install -Dm755 update_links.sh -t "$pkgdir/opt/${pkgname}/"
    install -Dm644 ${pkgname}.hook -t "$pkgdir/usr/share/libalpm/hooks/"
    
    install -Ddm755 "$pkgdir/opt/${pkgname}/toolchains/llvm/prebuilt/linux-x86_64"
    
    cp -r install/bin "$pkgdir/opt/${pkgname}/toolchains/llvm/prebuilt/linux-x86_64"
    cp -r install/lib "$pkgdir/opt/${pkgname}/toolchains/llvm/prebuilt/linux-x86_64"
}
