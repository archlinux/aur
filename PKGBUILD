# TODO: Use system qmlmaterial, remove qt6-shadertools and git-lfs

# deps.json
_rstd_commit=629bda81eb98856ca023f0f87f57dde8d22b4823
_ncrequest_commit=404868aa2aa4481e262f25d8f7d053f42b61b7b8
_wavsen_commit=7513365c75c33c3aa1840c5b7cfeb3642e8db5c7
_qml_material_commit=0e6372a9a68066e584b0dec5fa3f947c37b7da39
_qextra_commit=d02d9a7bfed546dfb7f87a5627b1c9e8f6fcc95a

pkgname=waywallen
pkgver=0.2.3
pkgrel=1
pkgdesc="Wallpaper Manager for Linux."
arch=(x86_64)
url=https://github.com/waywallen/waywallen
license=(MIT)
depends=(libgcc libstdc++ glibc ffmpeg curl mesa sqlite vulkan-icd-loader
         qt6-base qt6-declarative qt6-grpc libpulse zstd)
makedepends=(git cmake cargo "clang>=22" lld vulkan-headers ninja asio pegtl qt6-shadertools git-lfs
             corrosion nlohmann-json)
optdepends=('waywallen-display: Required for layer-shell based compositors')
options=(!lto)
source=("git+https://github.com/waywallen/waywallen.git#tag=v$pkgver"
        "git+https://github.com/hypengw/rstd.git#commit=$_rstd_commit"
        "git+https://github.com/hypengw/ncrequest.git#commit=$_ncrequest_commit"
        "git+https://github.com/hypengw/wavsen.git#commit=$_wavsen_commit"
        "git+https://github.com/hypengw/QmlMaterial.git#commit=$_qml_material_commit"
        "git+https://github.com/hypengw/QExtra.git#commit=$_qextra_commit"
        "0001-use-system-deps.diff")
sha256sums=('b08d64022402da4bfa7884dfae8a060482a84e9d1ee177ea0ad511e09440064f'
            '80036965e852d207379f91bae11a9baf957a3751f6194a1d5c047bdbb451dc9d'
            '939c717802fc9e0ef13e54f547d6f7d1b2b99730eb31c6ef06211a3ffd5495e6'
            '0e501f2f8ef5b40b8e9c59b0c17c91ed0032297f88982333e636ef2cc1ab0df9'
            '599c5d8022c161ad8a8405f5c2edab79533d6309e7d2fa4f7aa876e4ed578a93'
            '012c6593ae9f980c033a18dea491675ad9d4af3247806e8477223f53109688d7'
            '31bd980073336fdb44dcdbddc193c7d4ada4a51d491ef201f9078e9ce2e51e4e')

prepare() {
    cd "$pkgname"
    patch -Np1 -i ../0001-use-system-deps.diff

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
