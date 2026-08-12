# TODO: Use system qmlmaterial, remove qt6-shadertools and git-lfs

# deps.json
_rstd_commit=03b022f37aa414c22a47021d58e054d55927c6c1
_vvk_commit=867852dea22504db27559df60b74fee4c66406c7
_ncrequest_commit=8d703215bc9154618bc84d2c8517ff7b264c93f3
_wavsen_commit=11907e9d63d5961b9cbd1789933d172381b47265
_qml_material_commit=c5892749856ea48ca0fe9dd9c2088bff94ddaf88
_qextra_commit=37724d1fd44fc013e938652e2fcb25897be10e63

pkgname=waywallen
pkgver=0.3.3
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
sha256sums=('33a4eeea3077a6087a42b3164f992b5308cde545e6b197868e8ae5ff59841ef4'
            '89e9f424fe3719b8bda1380f0cc446fc96d9662668d012752de73cbc0d06a2ef'
            '3b0c5ca0bbeb7c84df483bf098ba9105bb79316417a409bb6ef4b2b2513f6e06'
            'b3f16f62ec17f40281c245b0ac91e74ca050c910d4c65cee7cab404a6317ac9b'
            '0d133cbf326421176858324ee86fb145196571a4ef5bfc7febf9bf313e49c2d9'
            '0baa6494a50447b1b02fc50e94659a1fdd40bf9b40396978fd8f96b623e93c5e'
            'cedc39d7e9872da3b0a69f2666e0334f0fe26786b67cf259fa9702227685ae93'
            '2a8c44a7caa2f8424528cd69d0118268dd3e36015cc003f5b39a4fdac4fbdfe4'
            '7d45ef8daaec6e006a7f2514657079c9dd8f046bcb252a4227ad34cd34a02727')

prepare() {
    cd "$pkgname"
    patch -Np1 -i ../0001-cmake-Use-system-VulkanMemoryAllocator.patch
    patch -Np1 -i ../0002-cmake-Use-system-Corrosion.patch

    sed -i 's/sizeof(rstd::uint32_t)/sizeof(rstd::uint64_t)/' "$srcdir/wavsen/src/video/video_decoder.cpp"

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
