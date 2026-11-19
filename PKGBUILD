# lito.lock
_luato_commit=500fa77514f1ea32c9dffd1d68a16ab5bd31e069
_wavsen_commit=fe27f752e29a94565b6a33083d90df9a020ee76f
_qextra_commit=1ce54ee77fda9679e2bedfb55d9addefb26aa114
_qml_material_commit=9b942c175e89711de1a66467e6a7b35e976f2188
_vecgltf_commit=20bb93a742a4e7246ad27620cb11745d96a4478c
_vrento_commit=02101d93c5fd76d8d4892910ba16765892d197c0

pkgname=waywallen
pkgver=0.6.1
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
sha256sums=('5e213520f17d01f0ff732379defbc36f146634e494ddfed22db45289bccc2dba'
            '03c85e20d4a80e20552f6f2e6655409d68ebaac554dd0044e4c0b150a386f355'
            'e64fd2498d75a21749a71c8f82dbe534b59acb3a462b73c1e2d330538588e5c0'
            '58fd823fc8e948659fa2ffa409897228d79d69d3a97580fbbf77c164e808872b'
            '575b170d8e7acf421e55c54e0670ee6d524c608ed0bdd8af114e7d6f0555b7d4'
            '80614f5810186112c4680d77b6535e89da162e8b17e3e302bc86e1a9d9ae3ace'
            '6bccc21285ccbc9dbcce619b7d7b63293e6d11a72f45b2e4244876f3ce7df244')

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
