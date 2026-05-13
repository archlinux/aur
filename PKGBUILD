# TODO: Use system qmlmaterial, remove qt6-shadertools and git-lfs

# cmake/FetchCorrosion.cmake
_corrosion_version=0.6.1
# deps.json
_rstd_commit=9fdc3ebeda7289bd1db7d2fb0b978e6ed0b1a63e
_ncrequest_commit=404868aa2aa4481e262f25d8f7d053f42b61b7b8
_wavsen_commit=b6fca590e5b874f4d87ba0ab2a54df580e242439
_qml_material_commit=ca470c74e51185b0848c29dfb200ba82bf982ce3
_qextra_commit=e9984a0dc57a4abecf5795a067ff4132bcb9489d

pkgname=waywallen
pkgver=0.1.4
pkgrel=1
pkgdesc="Wallpaper Manager for Linux."
arch=(x86_64)
url=https://github.com/waywallen/waywallen
license=(MIT)
depends=(libgcc libstdc++ glibc libglvnd ffmpeg curl mesa sqlite vulkan-icd-loader
         cubeb qt6-base qt6-declarative qt6-grpc)
makedepends=(git cmake cargo clang lld vulkan-headers ninja asio pegtl qt6-shadertools git-lfs)
options=(!lto)
source=("git+https://github.com/waywallen/waywallen.git#tag=v$pkgver"
        "git+https://github.com/corrosion-rs/corrosion.git#tag=v$_corrosion_version"
        "git+https://github.com/hypengw/rstd.git#commit=$_rstd_commit"
        "git+https://github.com/hypengw/ncrequest.git#commit=$_ncrequest_commit"
        "git+https://github.com/hypengw/wavsen.git#commit=$_wavsen_commit"
        "git+https://github.com/hypengw/QmlMaterial.git#commit=$_qml_material_commit"
        "git+https://github.com/hypengw/QExtra.git#commit=$_qextra_commit"
        "0001-use-system-deps.diff")
sha256sums=('d7e6d25674f1e9c590ca4c95be17f1801e2593e55a9ac117fe97cdad53a5abea'
            '75c1711049c3aa058ef7f8519ecc2a8a437cd31dd8ce4fb0b65c0ba13b7b36f6'
            'de3e235c080bd9ddd26bbddab43d64d3ab329b9ce700b267a5a9d6fb143452e8'
            '939c717802fc9e0ef13e54f547d6f7d1b2b99730eb31c6ef06211a3ffd5495e6'
            'e56b8a07f718b335a8e00c21dd76e3d0e6df7fdf2f367baa33fed8c61b185481'
            'd6cf31c7d8acce6485b14ca73f9cbaeba98062e4f7334afa766b6ea4d4ab4b7f'
            'b46ad38f360b5bcd61362aa3ad97df75fc38d2a4e7e4ad3f0bb5f6c9ea42f23e'
            '2354b1110b873f26bd6a8653929c7fc983438fcbd81cf648b131844cbe6f2d38')

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
        -DCMAKE_LINKER=lld \
        -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
        -DFETCHCONTENT_SOURCE_DIR_CORROSION="$srcdir/corrosion" \
        -DFETCHCONTENT_SOURCE_DIR_RSTD="$srcdir/rstd" \
        -DFETCHCONTENT_SOURCE_DIR_NCREQUEST="$srcdir/ncrequest" \
        -DFETCHCONTENT_SOURCE_DIR_WAVSEN="$srcdir/wavsen" \
        -DFETCHCONTENT_SOURCE_DIR_QML_MATERIAL="$srcdir/QmlMaterial" \
        -DFETCHCONTENT_SOURCE_DIR_QEXTRA="$srcdir/QExtra" \
        -DWAYWALLEN_BUILD_MPV_PLUGIN=OFF \
        -DQML_MATERIAL_BUILD_TYPE=STATIC
    cmake --build build
}

package() {
    depends+=(hicolor-icon-theme)

    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
