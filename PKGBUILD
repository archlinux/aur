# TODO: Use system qmlmaterial, remove qt6-shadertools and git-lfs

# deps.json
_rstd_commit=bf5f855ddb1b84390306e0913b89149ac72a3510
_vvk_commit=8fcfd34b43a13ade515f029b0b4209bd3684645f
_ncrequest_commit=37d3c588fb1307dd6c40fbc8681790b45eb5402a
_wavsen_commit=e49fc62fdc1b57abeabb643daa6ebab96fb3821f
_qml_material_commit=628f580b60f8e7195447ec9e27dae5cce5b0fcbc
_qextra_commit=2106172c8c55693248661f5ddfc0623ff489285d

pkgname=waywallen
pkgver=0.2.6
pkgrel=1
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
sha256sums=('ea8f6c36859ccda93572b186d3058845d303a505f3c16489ff550a11575276e2'
            'a5ce0c3f766a5b75230cb05e5b9f49f52a8d10111e0391d418f27a239194e310'
            '1c2f9e285109a2024219212781202d19bbef56a68c6dff42a5622155b2d8276f'
            'c3bc9687c54234441ec948d7f80aaf9ddbb0f39c5dfb90bea78bf9fddb985b09'
            'd3bd59f908243f5e87f1c42e3340ee70eeaf6c86315c48726dc50fc07904791e'
            'f0c92c0a8d9918ccd2a296ec67ab1b8e95e79fd17cd52af4e7f281f826a956b2'
            '7c8d8909c48c921b4bd00a1b710cf8563f37c46a1aaafff236060ee17a9bebfd'
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
