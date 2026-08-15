# TODO: Use system qmlmaterial, remove qt6-shadertools and git-lfs

# deps.json
_rstd_commit=669825255f7b4964932c7fee2646700698beb343
_vvk_commit=230f1b5f7f318847c8afed7ab1994a3b5fd20d2b
_ncrequest_commit=8d703215bc9154618bc84d2c8517ff7b264c93f3
_wavsen_commit=9a8cf9249f369bdd4bc5b37d03350f270d625f53
_qml_material_commit=015614c40005cd3964ce073c6a15baf29e932d52
_qextra_commit=37724d1fd44fc013e938652e2fcb25897be10e63

pkgname=waywallen
pkgver=0.3.4
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
sha256sums=('23c8fbb6a4c006e33a7c6e471af7f0f083caa8edf06a809bb8a26a869d125cf1'
            'e12db1679217df10e7c854084e54b63540cc281da09ebf988a02d6fa68097154'
            '20c9f8e1ec01d500522854fd9c8494de74534171a00570e718dc08fd0ccfbf62'
            'b3f16f62ec17f40281c245b0ac91e74ca050c910d4c65cee7cab404a6317ac9b'
            '63cf50c9fcb3e927be4a37ce102f46e88d49d3a42442991bcb6da75ccc959ac3'
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
