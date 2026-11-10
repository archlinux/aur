# lito.lock
_luato_commit=e146c282593b6ee723d9d785789f260b45980967
_wavsen_commit=92f37f4748a17a36f946e64c8a4a0880cc9fbe23
_qextra_commit=3fcb45c1722ca434d3abb89832f79d28756ab93f
_qml_material_commit=bdb63fb3e61ae03923c484c58183cf17f68cbae4
_vecgltf_commit=93d66944c5cb4e2897b6bf2eca79fc3fc714b66b
_vrento_commit=550e3c1f44ccafc064eb6b4b0b320764f5b65692

# src/lua/lito.toml of luato
_lua_ver=5.5.1

pkgname=waywallen
pkgver=0.6.0
pkgrel=1
pkgdesc="Wallpaper Manager for Linux."
arch=(x86_64)
url=https://github.com/waywallen/waywallen
license=(MIT)
depends=(libgcc libstdc++ glibc ffmpeg mesa sqlite vulkan-icd-loader
         qt6-base qt6-declarative qt6-grpc qt6-websockets zstd)
makedepends=(git cmake cargo "lito>=0.8.5" "clang>=22" lld llvm vulkan-headers ninja
             qt6-tools)
optdepends=('waywallen-display: Required for layer-shell based compositors')
options=(!lto)
source=("git+https://github.com/waywallen/waywallen.git#tag=v$pkgver"
        "git+https://github.com/litocpp/luato.git#commit=$_luato_commit"
        "git+https://github.com/hypengw/wavsen.git#commit=$_wavsen_commit"
        "git+https://github.com/hypengw/QExtra.git#commit=$_qextra_commit"
        "git+https://github.com/vecren/vecgltf.git#commit=$_vecgltf_commit"
        "git+https://github.com/vecren/vrento.git#commit=$_vrento_commit"
        "https://www.lua.org/ftp/lua-$_lua_ver.tar.gz")
if [[ -z "$_qml_material_commit" ]]
then
    depends+=(qmlmaterial)
else
    makedepends+=(git-lfs qt6-shadertools)
    source+=("git+https://github.com/hypengw/QmlMaterial.git#commit=$_qml_material_commit")
fi
sha256sums=('65cb05a050161dea9cf512c9d6b8b69e402b6ebe7406f93b20cd29dba96cd776'
            'e9626311e57131634532b1d62fda9942d28f07b42c60114b2e4dd6032f9e91e1'
            'b745db138636443c8fcdf08f3265580369d1fa3eafa64e5c0821b05a7070056c'
            '812baccdb561e94c52a47bf13ef40d2474c2ca2877a1fbbd92f6a98bed1e4a5e'
            'c874640d5d896e4487b042324767faee09e2dafe373e03d706ab6582d5fd148d'
            'fabb2fa38be16ff0f8facc1779249ce64bf5a9e05f4848082c27be8b16be0ef0'
            '1c4b4068d67061f2a2231ad2b5422e77acea1487ea9890f6320af614f4373dce'
            '69cd07d637a291d3463907556a254c7d8322e97193e53de24e1bd42e40dd50fa')

prepare() {
    cd "$pkgname"
    mkdir -p .lito
    cat > .lito/config.toml << EOF
[patch."https://github.com/litocpp/luato.git"]
path = "../luato"

[patch."https://github.com/hypengw/wavsen.git"]
path = "../wavsen"

[patch."https://github.com/hypengw/QExtra.git"]
path = "../QExtra"

[patch."https://github.com/vecren/vecgltf.git"]
path = "../vecgltf"

[patch."https://github.com/vecren/vrento.git"]
path = "../vrento"

[patch."https://www.lua.org/ftp/lua-$_lua_ver.tar.gz"]
path = "../lua-$_lua_ver"

EOF
    if [[ -z "$_qml_material_commit" ]]
    then
        cat >> .lito/config.toml << EOF
[tools.cmake.overrides.qml_material]
source = "installed"
EOF
    else
        cat >> .lito/config.toml << EOF
[patch."https://github.com/hypengw/QmlMaterial.git"]
path = "../QmlMaterial"
EOF
        pushd "../QmlMaterial"
        git lfs install --local
        git remote add network-origin https://github.com/hypengw/QmlMaterial.git
        git lfs pull network-origin
        popd
    fi

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
