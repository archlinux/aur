pkgname=libobjwriter-git
provides=(libobjwriter)
pkgrel=1
pkgver=1
pkgurl="https://github.com/dotnet/corert"
arch=('x86_64')
source=('git+https://github.com/llvm-mirror/llvm.git#branch=release_50'
        'git+https://github.com/dotnet/corert')

md5sums=('SKIP'
         'SKIP')

depends=('git' 'clang' 'llvm' 'cmake' 'python3')

prepare()
{
    cp -r corert/src/Native/ObjWriter llvm/tools/
    cd llvm
    git apply tools/ObjWriter/llvm.patch
}

build()
{
    cd llvm
    mkdir -p build
    cd build
    cmake ../ -DCMAKE_BUILD_TYPE=Release \
        -DLLVM_OPTIMIZED_TABLEGEN=1 \
        -DHAVE_POSIX_SPAWN=0 \
        -DLLVM_ENABLE_PIC=1 \
        -DLLVM_BUILD_TESTS=0 \
        -DLLVM_ENABLE_DOXYGEN=0 \
        -DLLVM_INCLUDE_DOCS=0 \
        -DLLVM_INCLUDE_TESTS=0

    make objwriter
}

package()
{
    cd llvm/build
    install -D lib/libobjwriter.so "$pkgdir/usr/lib/libobjwriter.so"
}
