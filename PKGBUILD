# TODO: Use system qmlmaterial, remove qt6-shadertools and git-lfs

# lito.lock
_rstd_commit=fdb99aaa894d76b04032cd301ac82b5ee6e3ec6d
_luato_commit=61dd40dca1e9aeda69eed208ddf0d10b34f59db7
_vvk_commit=f53d60cc70938d0485802750deeb15d18ba033ea
_ncrequest_commit=fbf353f079ea7bc5bcf967c3cb04cbf3f6835139
_wavsen_commit=c7cb2b2304b0b0e309c19373ac0722d904ddebc0
_qml_material_commit=a32dbc712baa041f4782f14482dab99cb3aeaa39
_qextra_commit=98cec17a8576c27fbc39e6d2788926cf676cf1b7

pkgname=waywallen
pkgver=0.3.6
pkgrel=1
pkgdesc="Wallpaper Manager for Linux."
arch=(x86_64)
url=https://github.com/waywallen/waywallen
license=(MIT)
depends=(libgcc libstdc++ glibc ffmpeg mesa sqlite vulkan-icd-loader
         qt6-base qt6-declarative qt6-grpc qt6-websockets zstd)
makedepends=(git cmake cargo lito "clang>=22" lld llvm vulkan-headers ninja qt6-shadertools git-lfs
             vulkan-memory-allocator qt6-tools)
optdepends=('waywallen-display: Required for layer-shell based compositors')
options=(!lto)
source=("git+https://github.com/waywallen/waywallen.git#tag=v$pkgver"
        "git+https://github.com/litocpp/rstd.git#commit=$_rstd_commit"
        "git+https://github.com/litocpp/luato.git#commit=$_luato_commit"
        "git+https://github.com/litocpp/vvk.git#commit=$_vvk_commit"
        "git+https://github.com/hypengw/ncrequest.git#commit=$_ncrequest_commit"
        "git+https://github.com/hypengw/wavsen.git#commit=$_wavsen_commit"
        "git+https://github.com/hypengw/QmlMaterial.git#commit=$_qml_material_commit"
        "git+https://github.com/hypengw/QExtra.git#commit=$_qextra_commit")
sha256sums=('54cf1938eccfd3b5284ea97f1e5b4fd35de7a873aef51f001f905692cb8cdade'
            '5e459ff93db361faf3c893d714d1f1d26b7d133f62c58c091a20357476a37a3c'
            '351dcdfd54a6df473f457a853ce0f9dc80a2950c60b4c821eeeb252ae861f19a'
            '0abff36a8194edd20feb96e87abc772b13a2ac725c99df091ea8e08b57562f0f'
            '3a5d287be95af26b10fdaf39d5190f880438e09c562614f4daaf37fccf77e42d'
            'd8f3d376fa801c263173ad157eb743c31390dc2cf259a3e540b843df09da5c80'
            'ba2b1469da9b0c0685045bf99394732d6185a80dc1561d60fbcc4728840f790e'
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

[patch."https://github.com/hypengw/QmlMaterial.git"]
path = "../QmlMaterial"

[tools.cmake.overrides.VulkanMemoryAllocator]
source = "installed"
EOF

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target host-tuple

    cd "$srcdir/QmlMaterial"
    git lfs install --local
    git remote add network-origin https://github.com/hypengw/QmlMaterial.git
    git lfs pull network-origin
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
