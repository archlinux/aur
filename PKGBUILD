# cmake/FetchCorrosion.cmake
_corrosion_version=0.6.1
# ui/deps.json
_rstd_commit=33362417786e4f45b48fdc908a2d2aa031ed6c44
_ncrequest_commit=60f1e6d6682f61030768c587483cb8fac8a70aeb
_qextra_commit=c86f77291e4e4a7138291c4642f595041d58dae1

pkgname=waywallen
pkgver=0.1.1
pkgrel=1
pkgdesc="Wallpaper Manager for Linux."
arch=(x86_64)
url=https://github.com/waywallen/waywallen
license=(MIT)
depends=(libgcc libstdc++ glibc libglvnd ffmpeg curl mesa mpv sqlite vulkan-icd-loader qmlmaterial
         qt6-base qt6-declarative qt6-grpc)
makedepends=(cmake cargo clang lld vulkan-headers ninja asio pegtl)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/waywallen/waywallen/archive/refs/tags/v$pkgver.tar.gz"
        "corrosion-$_corrosion_version.tar.gz::https://github.com/corrosion-rs/corrosion/archive/refs/tags/v$_corrosion_version.tar.gz"
        "rstd-$_rstd_commit.tar.gz::https://github.com/hypengw/rstd/archive/$_rstd_commit.tar.gz"
        "ncrequest-$_ncrequest_commit.tar.gz::https://github.com/hypengw/ncrequest/archive/$_ncrequest_commit.tar.gz"
        "QExtra-$_qextra_commit.tar.gz::https://github.com/hypengw/QExtra/archive/$_qextra_commit.tar.gz"
        "0001-use-system-deps.diff"
        "0002-rstd-fix-on-libstdc++-16.diff::https://github.com/hypengw/rstd/commit/ce977c9aac9e06b2ef7bceef11f91dd2cd82c78c.diff")
sha256sums=('827f433d548f949519d79f69eef410311e51fb0d0dfbd7bdfaf9597df5352cc6'
            'e9e95b1ee2bad52681f347993fb1a5af5cce458c5ce8a2636c9e476e4babf8e3'
            '735f5f86548b138272a807b747456e87b898a189cb4864f950dd281e34079ac1'
            '4fb1df88c02ae12908e2fee3a0525075e744ff530b80e02fe1e6c55929dfdd57'
            'fd2724cee28fa10e5490fde18860df35c1f691703c94e41cb84fb40afd2d79b1'
            '459984d9b5100dc83bd62f85c9b7c89696f21bdbd12d3f834962dc04a8424dbe'
            '9036cf83eb9b7fe4dcff7b434e58d1e0506aaf45091b4229501ece2d53ee4e76')

prepare() {
    cd "$pkgname-$pkgver"
    patch -Np1 -i ../0001-use-system-deps.diff
    patch -Np1 -d "$srcdir/rstd-$_rstd_commit" -i "$srcdir/0002-rstd-fix-on-libstdc++-16.diff"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target host-tuple
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
    # Extra -sys creates cannot link to system:
    # mlua-sys: Not configurable
    
    # https://github.com/llvm/llvm-project/issues/121709
    CXXFLAGS="${CXXFLAGS//-Wp,-D_FORTIFY_SOURCE=3/}"

    cmake -B build -S "$pkgname-$pkgver" -G Ninja \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_C_COMPILER=clang \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_LINKER=lld \
        -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
        -DFETCHCONTENT_SOURCE_DIR_CORROSION="$srcdir/corrosion-$_corrosion_version" \
        -DFETCHCONTENT_SOURCE_DIR_RSTD="$srcdir/rstd-$_rstd_commit" \
        -DFETCHCONTENT_SOURCE_DIR_NCREQUEST="$srcdir/ncrequest-$_ncrequest_commit" \
        -DFETCHCONTENT_SOURCE_DIR_QEXTRA="$srcdir/QExtra-$_qextra_commit" \
        -DWAYWALLEN_BUILD_MPV_PLUGIN=ON
    cmake --build build
}

package() {
    depends+=(hicolor-icon-theme)

    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
