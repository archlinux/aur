# TODO: Use system qmlmaterial, remove qt6-shadertools and git-lfs

# deps.json
_rstd_commit=99e7d045c8bd340ba942ca742a66b89ede02fa4c
_vvk_commit=5f1a0984e1023114d52b01d9b4967c8e52f16706
_ncrequest_commit=0c0e1cc18d762551a0abe5fc38665116013be067
_wavsen_commit=3b1041ced39d5c156efa5777af122c1fc781c28f
_qml_material_commit=015614c40005cd3964ce073c6a15baf29e932d52
_qextra_commit=37724d1fd44fc013e938652e2fcb25897be10e63

pkgname=waywallen
pkgver=0.3.5
pkgrel=2
pkgdesc="Wallpaper Manager for Linux."
arch=(x86_64)
url=https://github.com/waywallen/waywallen
license=(MIT)
depends=(libgcc libstdc++ glibc ffmpeg mesa sqlite vulkan-icd-loader
         qt6-base qt6-declarative qt6-grpc qt6-websockets zstd)
makedepends=(git cmake cargo "clang>=22" lld vulkan-headers ninja qt6-shadertools git-lfs
             corrosion vulkan-memory-allocator)
optdepends=('waywallen-display: Required for layer-shell based compositors')
options=(!lto)
source=("git+https://github.com/waywallen/waywallen.git#tag=v$pkgver"
        "git+https://github.com/litocpp/rstd.git#commit=$_rstd_commit"
        "git+https://github.com/litocpp/vvk.git#commit=$_vvk_commit"
        "git+https://github.com/hypengw/ncrequest.git#commit=$_ncrequest_commit"
        "git+https://github.com/hypengw/wavsen.git#commit=$_wavsen_commit"
        "git+https://github.com/hypengw/QmlMaterial.git#commit=$_qml_material_commit"
        "git+https://github.com/hypengw/QExtra.git#commit=$_qextra_commit"
        "0001-cmake-Use-system-VulkanMemoryAllocator.patch"
        "0002-cmake-Use-system-Corrosion.patch")
sha256sums=('2de49ccf8f08c5eb54ed3b8317b2447136be63486371236f4dd26d6813cf8a0e'
            'ad116a5f2d52ddb6e5d4e970a6e992bb720d425a2a10d3df4d60e635505ec3af'
            '7aa82dd93c04719f5cf1286ce291a1be75c687306c77fc6207bdb0ede23b76d5'
            '4c7d58c8165b6fcc063a9b6bda3400fb67d38af64c8fbd0ffb2f6130df4b706e'
            '4f71bc6c37635612438c32b08013ba1b0c33090d6d77d7966bbffabd042f0031'
            '47ccb2de1b675cd38c7182e2846552df91d26cd0d23ddd72dbee7add237dbf77'
            'cedc39d7e9872da3b0a69f2666e0334f0fe26786b67cf259fa9702227685ae93'
            '2a8c44a7caa2f8424528cd69d0118268dd3e36015cc003f5b39a4fdac4fbdfe4'
            '7d45ef8daaec6e006a7f2514657079c9dd8f046bcb252a4227ad34cd34a02727')

prepare() {
    cd "$pkgname"
    patch -Np1 -i ../0001-cmake-Use-system-VulkanMemoryAllocator.patch
    patch -Np1 -i ../0002-cmake-Use-system-Corrosion.patch

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target host-tuple

    cd "$srcdir/QmlMaterial"
    git lfs install --local
    git remote add network-origin https://github.com/hypengw/QmlMaterial.git
    git lfs pull network-origin
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
    export ZSTD_SYS_USE_PKG_CONFIG=1
    # Extra -sys creates cannot link to system:
    # mlua-sys: Not configurable
    
    # https://github.com/llvm/llvm-project/issues/121709
    CXXFLAGS="${CXXFLAGS//-Wp,-D_FORTIFY_SOURCE=3/}"

    # --icf=safe not supported by ld
    RUSTFLAGS+=" -C link-arg=-fuse-ld=lld"

    cmake -B build -S "$pkgname" -G Ninja \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_C_COMPILER=clang \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_LINKER_TYPE=LLD \
        -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
        -DFETCHCONTENT_SOURCE_DIR_RSTD="$srcdir/rstd" \
        -DFETCHCONTENT_SOURCE_DIR_VVK="$srcdir/vvk" \
        -DFETCHCONTENT_SOURCE_DIR_NCREQUEST="$srcdir/ncrequest" \
        -DFETCHCONTENT_SOURCE_DIR_WAVSEN="$srcdir/wavsen" \
        -DFETCHCONTENT_SOURCE_DIR_QML_MATERIAL="$srcdir/QmlMaterial" \
        -DFETCHCONTENT_SOURCE_DIR_QEXTRA="$srcdir/QExtra" \
        -DWAYWALLEN_BUILD_MPV_PLUGIN=OFF \
        -DWAYWALLEN_CARGO_OFFLINE=ON \
        -DQML_MATERIAL_BUILD_TYPE=STATIC
    cmake --build build
}

package() {
    depends+=(hicolor-icon-theme)

    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
