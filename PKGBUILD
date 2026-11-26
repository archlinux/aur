# lito.lock
_luato_commit=500fa77514f1ea32c9dffd1d68a16ab5bd31e069
_wavsen_commit=a93fbd8f61a8dcaccbd817bcffc38db2ddf3d119
_qextra_commit=9497df3060a8b406d5f00743cbc2ebf09c0ba8df
_qml_material_commit=712fb288660c470e7883b590569f5ec06f25a24c
_vecgltf_commit=573de6bd6f4be883e5a5c8c8085621455c062491
_vrento_commit=ecf0509f10ce61f124e787777f87b026ab5b6d43

pkgname=waywallen
pkgver=0.6.2
pkgrel=1
pkgdesc="Wallpaper Manager for Linux."
arch=(x86_64)
url=https://github.com/waywallen/waywallen
license=(MIT)
depends=(libgcc libstdc++ glibc ffmpeg mesa sqlite vulkan-icd-loader openssl libxml2
         qt6-base qt6-declarative qt6-grpc qt6-websockets zstd lua)
makedepends=(git cmake cargo "lito>=0.8.5" "clang>=22" lld llvm vulkan-headers ninja
             qt6-tools)
optdepends=('waywallen-display: Required for layer-shell based compositors')
options=(!lto)
source=("git+https://github.com/waywallen/waywallen.git#tag=v$pkgver"
        "git+https://github.com/litocpp/luato.git#commit=$_luato_commit"
        "git+https://github.com/hypengw/wavsen.git#commit=$_wavsen_commit"
        "git+https://github.com/hypengw/QExtra.git#commit=$_qextra_commit"
        "git+https://github.com/vecren/vecgltf.git#commit=$_vecgltf_commit"
        "git+https://github.com/vecren/vrento.git#commit=$_vrento_commit")
if [[ -z "$_qml_material_commit" ]]
then
    depends+=(qmlmaterial)
else
    makedepends+=(git-lfs qt6-shadertools)
    source+=("git+https://github.com/hypengw/QmlMaterial.git#commit=$_qml_material_commit")
fi
sha256sums=('71413ce91c2ff9b15738be9dd029c790cda85735fbc42accca1a5a45f0f3d379'
            '03c85e20d4a80e20552f6f2e6655409d68ebaac554dd0044e4c0b150a386f355'
            '9d6a8347f623fd1eac1b527585a5344305084cdb266f54af4e9da61b5108f5e3'
            '77faa4eee4ecea3eef6a1848d3c22e6cececbe68e33f4f9ed9cff4f8fc7d605d'
            'd91f9736bc0445592316a2f956a95c17da5fcaa21f7f79f8af319c040a1cee61'
            '4c46799da28f2ad621d35eee7587fd2574ec3c50721e83f389474d0f98c45cbc'
            'e2be7ff53b4b21abd6c4ce518f7023ccdd56a6c99bd3280a5a4d811a051f172c')

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
