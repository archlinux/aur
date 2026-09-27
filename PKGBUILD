# lito.lock
_luato_commit=df0c6f2d1cce2051b4711d36067619eda7933683
_ncrequest_commit=cdaca8b5c523906fc0c9ed58cd5f2c7981b5a255
_wavsen_commit=529a01c632a28d57daaca2a3c8bd9fc6672df564
_qextra_commit=68f752fd38e3d7a923bf36d621f4a94be7b26fd8
_qml_material_commit=e36f78d7c5a47e0e300d1b96745768f497af6cb2

pkgname=waywallen
pkgver=0.4.3
pkgrel=1
pkgdesc="Wallpaper Manager for Linux."
arch=(x86_64)
url=https://github.com/waywallen/waywallen
license=(MIT)
depends=(libgcc libstdc++ glibc ffmpeg mesa sqlite vulkan-icd-loader
         qt6-base qt6-declarative qt6-grpc qt6-websockets zstd)
makedepends=(git cmake cargo lito "clang>=22" lld llvm vulkan-headers ninja
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
sha256sums=('e9397e4082f29ebe1344e97059bd5e878f4a1785ca803e2eba7851c3018aafc2'
            '255e260360f8a29c42e33e10549a1bc2caea8cabd568eb7ad81d08b38526e7c3'
            'e0b29a7179d1f35b76ca2582003c0a97c20b1a30b8e2e24cd95b025e7bfabfca'
            '99d49351909b81512fa103614aeae238c45daea6fecc0abc199c7f0b5f32f345'
            '2b2d0a9f7031c88656fde765e7118960486db25aff5ceff43d71a1c3737643ac'
            '0e1fed277b28c3590b2fd6b4d02c91d2f53e69a639aca15a8f0c352ef7e91a1b')

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
