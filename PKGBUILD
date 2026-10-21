# lito.lock
_luato_commit=df0c6f2d1cce2051b4711d36067619eda7933683
_ncrequest_commit=2ba60ef6321f5e7f5bccc5fe086d2682bcaccf40
_wavsen_commit=756437443d84905a027f115c75ec6ae6b19692e7
_qextra_commit=b3fd790bb4a5c5cf7c0cc0384cc140e78e627609
_qml_material_commit=f1464c52d42732acb1363122b9b1a2360fd505b3

pkgname=waywallen
pkgver=0.5.0
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
        "git+https://github.com/hypengw/ncrequest.git#commit=$_ncrequest_commit"
        "git+https://github.com/hypengw/wavsen.git#commit=$_wavsen_commit"
        "git+https://github.com/hypengw/QExtra.git#commit=$_qextra_commit")
if [[ -z "$_qml_material_commit" ]]
then
    depends+=(qmlmaterial)
else
    makedepends+=(git-lfs qt6-shadertools)
    source+=("git+https://github.com/hypengw/QmlMaterial.git#commit=$_qml_material_commit")
fi
sha256sums=('6848347a43cde869a273715f6b5793493fca53c819a2ed379c1d92aab14c16e2'
            '255e260360f8a29c42e33e10549a1bc2caea8cabd568eb7ad81d08b38526e7c3'
            'a2d7f3aebfeaea2b0e0ee95b3486660135c52cf275ede014f916915dbb1000d1'
            'c3eb7d0d83a534f2ab489bb6dbadfc208cf735ba7d31b4d4bdbdaa5d2e75dc26'
            '3bc4fde742f1aa956c3e6f5b1791228a421c5b24186b8eaba3baabe55656e34e'
            '906a8ffc16c671e6d9f6c7dae92c113b3863adfcb0084cbd3383f617bb0af298')

prepare() {
    cd "$pkgname"
    mkdir -p .lito
    cat > .lito/config.toml << EOF
[patch."https://github.com/litocpp/luato.git"]
path = "../luato"

[patch."https://github.com/hypengw/wavsen.git"]
path = "../wavsen"

[patch."https://github.com/hypengw/ncrequest.git"]
path = "../ncrequest"

[patch."https://github.com/hypengw/QExtra.git"]
path = "../QExtra"

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
