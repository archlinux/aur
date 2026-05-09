# TODO: Use system qmlmaterial, remove qt6-shadertools and git-lfs

# cmake/FetchCorrosion.cmake
_corrosion_version=0.6.1
# deps.json
_rstd_commit=f4f45c507d3d69fd6b31e3139c0d63a57622c0d0
_ncrequest_commit=404868aa2aa4481e262f25d8f7d053f42b61b7b8
_wavsen_commit=24bade549e5059dbfa02e61df1a4b4a928f5eef7
_qml_material_commit=7c516a90d74b5b95c7c51f3d8e92c4c711951ac3
_qextra_commit=e9984a0dc57a4abecf5795a067ff4132bcb9489d

pkgname=waywallen
pkgver=0.1.3
pkgrel=1
pkgdesc="Wallpaper Manager for Linux."
arch=(x86_64)
url=https://github.com/waywallen/waywallen
license=(MIT)
depends=(libgcc libstdc++ glibc libglvnd ffmpeg curl mesa mpv sqlite vulkan-icd-loader
        qt6-base qt6-declarative qt6-grpc)
makedepends=(git cmake cargo clang lld vulkan-headers ninja asio pegtl cubeb qt6-shadertools git-lfs)
options=(!lto)
source=("git+https://github.com/waywallen/waywallen.git#tag=v$pkgver"
        "git+https://github.com/corrosion-rs/corrosion.git#tag=v$_corrosion_version"
        "git+https://github.com/hypengw/rstd.git#commit=$_rstd_commit"
        "git+https://github.com/hypengw/ncrequest.git#commit=$_ncrequest_commit"
        "git+https://github.com/hypengw/wavsen.git#commit=$_wavsen_commit"
        "git+https://github.com/hypengw/QmlMaterial.git#commit=$_qml_material_commit"
        "git+https://github.com/hypengw/QExtra.git#commit=$_qextra_commit"
        "0001-use-system-deps.diff")
sha256sums=('a6f670c76f4e7063a23e193e4a61dd4239dd9c13ae6731553fe7a42f601fa36d'
            '75c1711049c3aa058ef7f8519ecc2a8a437cd31dd8ce4fb0b65c0ba13b7b36f6'
            '51783e07b586d7d44884d935201308df4e0425a5614731fef167f0fa2ea22a7d'
            '939c717802fc9e0ef13e54f547d6f7d1b2b99730eb31c6ef06211a3ffd5495e6'
            '8b94d8c0fd2bd8e7f49200d839bbb9cd1a633a99d4c648743f1ef3b27165e2b8'
            '1dce8eff7f278490496300dcc01f3907a1bf9d0d130f30de047a9638bfd6df49'
            'b46ad38f360b5bcd61362aa3ad97df75fc38d2a4e7e4ad3f0bb5f6c9ea42f23e'
            '5cdc32b78fbb979e4e0d90082b97c9360c720864846cf571e6c1c1fb3bb49de6')

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
        -DWAYWALLEN_BUILD_MPV_PLUGIN=ON \
        -DQML_MATERIAL_BUILD_TYPE=STATIC
    cmake --build build
}

package() {
    depends+=(hicolor-icon-theme)

    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
