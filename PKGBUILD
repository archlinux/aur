# lito.lock
_rstd_commit=456fec5cc2b87acdb56800e298b5712ea69cdd47
_luato_commit=aec1ad0e84de8f5060144896cc79b79dbb10605b
_vvk_commit=f53d60cc70938d0485802750deeb15d18ba033ea
_ncrequest_commit=fbf353f079ea7bc5bcf967c3cb04cbf3f6835139
_wavsen_commit=77dfd33d07112c05df4682e08b98e19153ebe3ab
_qextra_commit=98cec17a8576c27fbc39e6d2788926cf676cf1b7

pkgname=waywallen
pkgver=0.3.8
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
        "git+https://github.com/litocpp/rstd.git#commit=$_rstd_commit"
        "git+https://github.com/litocpp/luato.git#commit=$_luato_commit"
        "git+https://github.com/litocpp/vvk.git#commit=$_vvk_commit"
        "git+https://github.com/hypengw/ncrequest.git#commit=$_ncrequest_commit"
        "git+https://github.com/hypengw/wavsen.git#commit=$_wavsen_commit"
        "git+https://github.com/hypengw/QExtra.git#commit=$_qextra_commit")
sha256sums=('045aabcc33afe138b68600ea342dd028018e440c1600db0ea1a9e6b9e44fad2e'
            '67e1315baa1ec31bc6d5da381b4367a08b768da623a25cc82bb84ac597647ead'
            '14f2584bf743549d54603e64587111b3a3d84683b7f3b18af98c2f493dff824a'
            '0abff36a8194edd20feb96e87abc772b13a2ac725c99df091ea8e08b57562f0f'
            '3a5d287be95af26b10fdaf39d5190f880438e09c562614f4daaf37fccf77e42d'
            '06c90e4fb0b996ecf07468322de9f634e35cd97b171a8c55e771da086da55ebd'
            'ccdcf23bece3223281b9aec6b36457775ca31e535ce5c984f634436f207424df')

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
