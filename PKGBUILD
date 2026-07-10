# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=slint
pkgname=(
    'python-slint'
    'slint-cpp'
    'slint-tools')
pkgver=1.17.1
pkgrel=1
pkgdesc='Declarative GUI toolkit to build native user interfaces'
license=('GPL-3.0-or-later OR LicenseRef-Slint-Royalty-free-2.0 OR LicenseRef-Slint-Software-3.0')
arch=('x86_64')
url='https://github.com/slint-ui/slint/'
makedepends=(
    'cargo'
    'cmake'
    'fontconfig'
    'freetype2'
    'git'
    'gstreamer'
    'libinput'
    'libxkbcommon'
    'mesa'
    'python'
    'python-build'
    'python-installer'
    'python-maturin'
    'python-setuptools'
    'python-wheel'
    'systemd-libs')
source=("https://github.com/slint-ui/slint/archive/v${pkgver}/slint-${pkgver}.tar.gz"
        '010-slint-remove-jemalloc.patch'
        '020-slint-allow-python-maturin-0.14.1.patch')
sha256sums=('68222567f8c70ff677cd4a98cd94fb4765ac0f797eb8f8608a646911c908dc2a'
            'dc2411d147835e4211ada3f316eae20bb095391ed2ff35723405a30a050c979a'
            '784edbc91e7f5c6e9fcc650a652d30f7f1027a115e657a96b719b0e46f78f988')

prepare () {
    cargo fetch --locked --target "$(rustc --print host-tuple)" --manifest-path="${pkgbase}-${pkgver}/Cargo.toml"
    cargo fetch --locked --target "$(rustc --print host-tuple)" --manifest-path="${pkgbase}-${pkgver}/api/python/slint/Cargo.toml"
    
    patch -d "${pkgbase}-${pkgver}" -Np1 -i "${srcdir}/010-slint-remove-jemalloc.patch"
    patch -d "${pkgbase}-${pkgver}" -Np1 -i "${srcdir}/020-slint-allow-python-maturin-0.14.1.patch"
}

build() {
    export CARGO_TARGET_DIR="${srcdir}/cargo-target"
    export RUSTUP_TOOLCHAIN='stable'
    export SLINT_NO_QT='1'
    local _features='backend-winit,gettext,renderer-femtovg,renderer-skia,renderer-skia-opengl,renderer-skia-vulkan,renderer-software'
    
    # c++
    printf '%s\n' '  -> building slint-cpp...'
    cmake -S "${pkgbase}-${pkgver}" -B build-cpp \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DSLINT_FEATURE_BACKEND_QT:BOOL='OFF' \
        -DSLINT_FEATURE_BACKEND_WINIT:BOOL='ON' \
        -DSLINT_FEATURE_GETTEXT:BOOL='ON' \
        -DSLINT_FEATURE_LIVE_PREVIEW:BOOL='ON' \
        -DSLINT_FEATURE_RENDERER_FEMTOVG:BOOL='ON' \
        -DSLINT_FEATURE_RENDERER_SKIA:BOOL='ON' \
        -DSLINT_FEATURE_RENDERER_SKIA_OPENGL:BOOL='ON' \
        -DSLINT_FEATURE_RENDERER_SKIA_VULKAN:BOOL='ON' \
        -DSLINT_FEATURE_RENDERER_SOFTWARE:BOOL='ON'
    cmake --build build-cpp
    
    # tools
    printf '%s\n' '  -> building tools...'
    cargo build \
        --features="$_features" \
        --frozen \
        --manifest-path="${pkgbase}-${pkgver}/Cargo.toml" \
        --no-default-features \
        --package='slint-lsp' \
        --package='slint-tr-extractor' \
        --package='slint-viewer' \
        --release
    
    # python
    printf '%s\n' '  -> building python-slint...'
    cd "${srcdir}/${pkgbase}-${pkgver}/api/python/slint"
    export MATURIN_SETUP_ARGS="--no-default-features --features ${_features}"
    python -m build --wheel --no-isolation
}

# arguments: $1: $pkgdir, $2: $pkgname
_install_licenses() {
    install -D -m644 "${pkgbase}-${pkgver}/LICENSES/LicenseRef-Slint-Royalty-free-2.0.md" -t "${1}/usr/share/licenses/${2}"
    install -D -m644 "${pkgbase}-${pkgver}/LICENSES/LicenseRef-Slint-Software-3.0.md" -t "${1}/usr/share/licenses/${2}"
}

package_python-slint() {
    pkgdesc="${pkgdesc} for Python apps"
    depends=(
        'fontconfig'
        'freetype2'
        'glibc'
        'libgcc'
        'libinput'
        'libstdc++'
        'libxkbcommon'
        'mesa'
        'python'
        'systemd-libs')
   optdepends=(
        'libgl: for Skia OpenGL renderer backend'
        'vulkan-icd-loader: for Skia Vulkan renderer backend')
    
    python -m installer --destdir="$pkgdir" "${pkgbase}-${pkgver}/api/python/slint/dist"/*.whl
    _install_licenses "$pkgdir" "$pkgname"
}

package_slint-cpp() {
    pkgdesc="${pkgdesc} for C++ apps"
    depends=(
        'fontconfig'
        'freetype2'
        'glibc'
        'libgcc'
        'libstdc++')
    optdepends=(
        'libgl: for Skia OpenGL renderer backend'
        'vulkan-icd-loader: for Skia Vulkan renderer backend')
    provides=(
        'slint-compiler')
    
    DESTDIR="$pkgdir" cmake --install build-cpp
    _install_licenses "$pkgdir" "$pkgname"
}

package_slint-tools() {
    pkgdesc='Tools for the Slint GUI toolkit (lsp, tr-extractor and viewer)'
    depends=(
        'fontconfig'
        'freetype2'
        'glibc'
        'libgcc'
        'libstdc++')
    optdepends=(
        'libgl: for Skia OpenGL renderer backend in slint-viewer'
        'vulkan-icd-loader: for Skia Vulkan renderer backend in slint-viewer')
    provides=(
        'slint-lsp'
        'slint-tr-extractor'
        'slint-viewer')
    
    install -d -m755 "${pkgdir}/usr/lib"
    
    find cargo-target/release -maxdepth 1 -type f \
        -executable \
        ! -name '*.so*' \
        ! -name 'slint-compiler' \
        -exec install -D -m755 -t "${pkgdir}/usr/bin" {} +
    
    find cargo-target/release -maxdepth 1 -type f \
        -name '*.so*' \
        ! -name 'libslint_cpp.so*' \
        ! -name 'libslint_node.so*' \
        ! -name 'libslint_python.so*' \
        -exec cp -dr --no-preserve='ownership' {} "${pkgdir}/usr/lib/" \;
    
    _install_licenses "$pkgdir" "$pkgname"
}
