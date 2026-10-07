# lito.lock
_luato_commit=df0c6f2d1cce2051b4711d36067619eda7933683
_ncrequest_commit=40d40224842a080039d2a76710fbedb20ee002ac
_wavsen_commit=bd8a72e0f68fabc42f3d123623787398ed28dbe4
_qextra_commit=650cb670c15c2f34a9cf0dedd52447df7b56e761
_qml_material_commit=98b8acd3e0bd57ca0710f2712e4dfa3fcef13113

pkgname=waywallen
pkgver=0.4.4
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
sha256sums=('e3a3c72401194cccd96f32dbaefaef92d790a572dda1788380a5323a61b4656e'
            '255e260360f8a29c42e33e10549a1bc2caea8cabd568eb7ad81d08b38526e7c3'
            '4d769781149aa7b321e7345e921e88cfc71e2598bffe0d5ceeb04e72f13371b1'
            '04856be2a686da2afb0c9972f76aeff89c32abeb535135553b062e1c05d99a2c'
            '554a0e04a20a36614d6527a24cfff5491326dfd4a60905939d550449b7ef5b0e'
            'fc7ebd991227221d63597cc67bcf1ae7e2db03ae8bd6975aabf4a9f54ad2f218')

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
