# lito.lock
_rstd_ver=0.1.4
_luato_commit=bd4848b3d6dc2cc57928e4405c3593b67322d6f8
_vvk_ver=0.1.0
_ncrequest_commit=cdaca8b5c523906fc0c9ed58cd5f2c7981b5a255
_wavsen_commit=e9c4983bb8851eed0823e25ad277a7bb7f6250ac
_qextra_commit=68f752fd38e3d7a923bf36d621f4a94be7b26fd8

pkgname=waywallen
pkgver=0.4.0
pkgrel=1
pkgdesc="Wallpaper Manager for Linux."
arch=(x86_64)
url=https://github.com/waywallen/waywallen
license=(MIT)
depends=(libgcc libstdc++ glibc ffmpeg mesa sqlite vulkan-icd-loader
         qt6-base qt6-declarative qt6-grpc qt6-websockets zstd qmlmaterial)
makedepends=(git cmake cargo lito "clang>=22" lld llvm vulkan-headers ninja
             qt6-tools)
optdepends=('waywallen-display: Required for layer-shell based compositors')
options=(!lto)
source=("git+https://github.com/waywallen/waywallen.git#tag=v$pkgver"
        "git+https://github.com/litocpp/rstd.git#tag=v$_rstd_ver"
        "git+https://github.com/litocpp/luato.git#commit=$_luato_commit"
        "git+https://github.com/litocpp/vvk.git#tag=v$_vvk_ver"
        "git+https://github.com/hypengw/ncrequest.git#commit=$_ncrequest_commit"
        "git+https://github.com/hypengw/wavsen.git#commit=$_wavsen_commit"
        "git+https://github.com/hypengw/QExtra.git#commit=$_qextra_commit")
sha256sums=('803d5f1fe69d58b5662ec85646f4dc66dfcb1d7aa237d71bf27e17c0aafa3644'
            'edd45f5b4e745f8317ab8e0242fa63e6fc548b587ac01a6e94b904b9f8a8464b'
            '7b09b22347e9db3206fc797f61ce69996ff7d9e909e9c1fe8564550c2b540704'
            '4f6311b61894a24cb223cb8006de80986a5f51bd160c919217f0d698bd83bd33'
            'e0b29a7179d1f35b76ca2582003c0a97c20b1a30b8e2e24cd95b025e7bfabfca'
            '1e2f280e8a0753bcfc107ea4d3f533c9628f58c50c8c32382c82c6f263a2ac3c'
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
EOF

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target host-tuple
    lito fetch --all-features
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
