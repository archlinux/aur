# TODO: Use system qmlmaterial, remove qt6-shadertools and git-lfs

# deps.json
_rstd_commit=629bda81eb98856ca023f0f87f57dde8d22b4823
_ncrequest_commit=404868aa2aa4481e262f25d8f7d053f42b61b7b8
_wavsen_commit=c714a4fc59a689a80b3b537ee8ef501c363a841f
_qml_material_commit=c36528593c70d67c8bac8fc7dea579702a7e8aff
_qextra_commit=26e4b4134a05d35676f02f8b0e82a6130d877695

pkgname=waywallen
pkgver=0.2.0
pkgrel=1
pkgdesc="Wallpaper Manager for Linux."
arch=(x86_64)
url=https://github.com/waywallen/waywallen
license=(MIT)
depends=(libgcc libstdc++ glibc ffmpeg curl mesa sqlite vulkan-icd-loader
         qt6-base qt6-declarative qt6-grpc libpipewire)
makedepends=(git cmake cargo "clang>=22" lld vulkan-headers ninja asio pegtl qt6-shadertools git-lfs
             corrosion nlohmann-json)
options=(!lto)
source=("git+https://github.com/waywallen/waywallen.git#tag=v$pkgver"
        "git+https://github.com/hypengw/rstd.git#commit=$_rstd_commit"
        "git+https://github.com/hypengw/ncrequest.git#commit=$_ncrequest_commit"
        "git+https://github.com/hypengw/wavsen.git#commit=$_wavsen_commit"
        "git+https://github.com/hypengw/QmlMaterial.git#commit=$_qml_material_commit"
        "git+https://github.com/hypengw/QExtra.git#commit=$_qextra_commit"
        "0001-use-system-deps.diff")
sha256sums=('ccbbd6503f46d69e3affabe4da85f8eec4e1a29a0f7c66bc51074a4ea6335b86'
            '80036965e852d207379f91bae11a9baf957a3751f6194a1d5c047bdbb451dc9d'
            '939c717802fc9e0ef13e54f547d6f7d1b2b99730eb31c6ef06211a3ffd5495e6'
            '3d870289ca988228812f3e9d61e92ca3fe47b6b4e4a24183cef617f0c2977074'
            '283598151e5686ef7a9cdc8a35d51137ec4ba44adea3e788851c7f96298cc697'
            'c4fd097f8229d137f7f3257c4a52c477b9e7309a96e028366eacac537e32df56'
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
