# lito.lock
_rstd_ver=0.1.2
_luato_commit=9ad07ca2604022319c0178b7f5543220baf87050
_vvk_commit=14a99ea0e98d0580947abf426b4d04b5a201264c
_ncrequest_commit=cdaca8b5c523906fc0c9ed58cd5f2c7981b5a255
_wavsen_commit=5a0ddb98def3d1c146968810fe711fd2123802d0
_qextra_commit=68f752fd38e3d7a923bf36d621f4a94be7b26fd8

pkgname=waywallen
pkgver=0.3.9
pkgrel=1
pkgdesc="Wallpaper Manager for Linux."
arch=(x86_64)
url=https://github.com/waywallen/waywallen
license=(MIT)
depends=(libgcc libstdc++ glibc ffmpeg mesa sqlite vulkan-icd-loader
         qt6-base qt6-declarative qt6-grpc qt6-websockets zstd qmlmaterial)
makedepends=(git cmake cargo lito "clang>=22" lld llvm vulkan-headers ninja
             vulkan-memory-allocator qt6-tools)
optdepends=('waywallen-display: Required for layer-shell based compositors')
options=(!lto)
source=("git+https://github.com/waywallen/waywallen.git#tag=v$pkgver"
        "git+https://github.com/litocpp/rstd.git#tag=v$_rstd_ver"
        "git+https://github.com/litocpp/luato.git#commit=$_luato_commit"
        "git+https://github.com/litocpp/vvk.git#commit=$_vvk_commit"
        "git+https://github.com/hypengw/ncrequest.git#commit=$_ncrequest_commit"
        "git+https://github.com/hypengw/wavsen.git#commit=$_wavsen_commit"
        "git+https://github.com/hypengw/QExtra.git#commit=$_qextra_commit")
sha256sums=('8e1c6e119033a9fbf36d98968784b2e566c744293d7413a11bfdd428e93aa38e'
            '9d7e6a4cbf1eb690e7d64af05dd7f9fc3730bf817b1152bbd99892f20101ce2d'
            '0e7de62fac442c248334e98434b478ab230dd1fe94692cb43ec6f7b6e2a7fe36'
            '4b1bdf273d52cd21524263e6f526b6fea848e2450f307fe00f1e5ff776d3fa89'
            'e0b29a7179d1f35b76ca2582003c0a97c20b1a30b8e2e24cd95b025e7bfabfca'
            '8c5b03ca66cf4692bd13d0641882f7b741b3eb05e9cabee78ae5474ba0e3766a'
            '2b2d0a9f7031c88656fde765e7118960486db25aff5ceff43d71a1c3737643ac')

prepare() {
    cd "$pkgname"
    mkdir -p .lito
    cat > .lito/config.toml << EOF
[patch."https://github.com/litocpp/rstd.git"]
path = "../rstd"

[patch."https://github.com/litocpp/luato.git"]
path = "../luato"

[patch."https://github.com/litocpp/vvk.git"]
path = "../vvk"

[patch."https://github.com/hypengw/wavsen.git"]
path = "../wavsen"

[patch."https://github.com/hypengw/ncrequest.git"]
path = "../ncrequest"

[patch."https://github.com/hypengw/QExtra.git"]
path = "../QExtra"

[tools.cmake.overrides.qml_material]
source = "installed"

[tools.cmake.overrides.VulkanMemoryAllocator]
source = "installed"
EOF

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target host-tuple
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

    lito -C "$pkgname" build --profile plain --use-env-flags
}

package() {
    depends+=(hicolor-icon-theme)

    lito -C "$pkgname" install --profile plain --prefix "$pkgdir/usr" --no-build
    install -Dm644 "$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
