pkgname=ieda-git
pkgver=r4766.699a03ec6
pkgrel=1
pkgdesc='An open-source EDA infracstructure and tools from Netlist to GDS for ASIC design'
arch=('x86_64')
url='https://ieda.oscc.cc/'
license=('MulanPSL-2.0')
depends=('boost-libs' 'tcl' 'gflags' 'google-glog' 'python' 'zlib' 'eigen' 'libunwind' 'gmp' 'gtest' 'curl' 'qt5-base' 'onetbb')
makedepends=('git' 'cmake' 'boost' 'swig' 'bison' 'flex' 'rust' 'ninja')
source=(
    'git+https://gitee.com/oscc-project/iEDA'
    'git+https://gitee.com/li-jinyuan/LSAssigner4iEDA'
    'cmakelists.patch'
    'source.patch'
)

sha256sums=(
    'SKIP'
    'SKIP'
    '36c25b99fe91db0e993321b83d5eb75058a470de61c1d4081b9d5ee96de3182b'
    'e59bac17f884ab1d0dbcc4d81c10fa0ce3206ac8bebc4455ae2279606aef2dbc'
)

pkgver() {
    cd $srcdir/iEDA
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd $srcdir/iEDA
    git submodule init
    git config submodule.module/src/third_party/LSAssigner4iEDA.url $srcdir/LSAssigner4iEDA
    git -c protocol.file.allow=always submodule update src/third_party/LSAssigner4iEDA
    git apply $srcdir/cmakelists.patch
    git apply $srcdir/source.patch
}

build() {
    cd "$srcdir"/iEDA
    cmake -B build \
        -DCMD_BUILD=ON \
        -DBUILD_GUI=ON \
        -DBUILD_STATIC_LIB=OFF \
        -DCMAKE_RUNTIME_OUTPUT_DIRECTORY="$srcdir"/iEDA/bin \
        -DCMAKE_BUILD_TYPE=Release \
        -Wno-dev
    cmake --build build --target all
}

package() {
    mkdir -p "$pkgdir"/usr/lib/ieda/
    find "$srcdir"/iEDA/build -iname '*.so' -exec install -Dm 755 {} "$pkgdir"/usr/lib/ieda/ ';'
    find "$srcdir"/iEDA/bin -iname '*.so' -exec install -Dm 755 {} "$pkgdir"/usr/lib/ieda/ ';'
    find "$pkgdir"/usr/lib/ieda/ -iname '*.so' -exec patchelf --set-rpath '$ORIGIN' {} ';'
    mkdir -p "$pkgdir"/usr/bin/
    for bin in iEDA iSTA iIR iPower; do
        patchelf --set-rpath '$ORIGIN/../lib/ieda' "$srcdir"/iEDA/bin/"$bin"
        install -Dm 755 "$srcdir"/iEDA/bin/"$bin" "$pkgdir"/usr/bin/
    done
    mkdir -p "$pkgdir"/usr/share/licenses/ieda-git/
    install -Dm 644 "$srcdir"/iEDA/LICENSE "$pkgdir"/usr/share/licenses/ieda-git/
}

