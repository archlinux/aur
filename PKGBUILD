# TODO: Use system qmlmaterial, remove qt6-shadertools and git-lfs

# deps.json
_rstd_commit=629bda81eb98856ca023f0f87f57dde8d22b4823
_ncrequest_commit=404868aa2aa4481e262f25d8f7d053f42b61b7b8
_wavsen_commit=107f2aeab439276c5b7271658b7df1f4ab0ed028
_qml_material_commit=991dd888327ccb1d366d65b9d25695d0fdd9f519
_qextra_commit=f20b70eef08eef573be03954db3a455bbefe2637

pkgname=waywallen
pkgver=0.2.2
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
sha256sums=('a0e3504d1ac964df7db5548f80e85236ca9604c57d97270650dff7e9acd0d37d'
            '80036965e852d207379f91bae11a9baf957a3751f6194a1d5c047bdbb451dc9d'
            '939c717802fc9e0ef13e54f547d6f7d1b2b99730eb31c6ef06211a3ffd5495e6'
            '9551eafef6c78a5ce380bd3ae97a68383689a473d68253f03edced3694a9c48f'
            'fcbc4af0fb26110395e0afc64442d2c9f650a92160346a3d7d64ba63fc09ac24'
            '55da948284c6a0702408d5edc0ebbd7055cac665a0aa14179cb8d2efd41bf5f0'
            '366c41546136ddc43109d889b9b34473bbf7cc9af43abd78b094981cbda82443')

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
