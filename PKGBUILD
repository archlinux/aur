# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=slint
pkgname=(
    'nodejs-slint'
    'python-slint'
    'slint-cpp'
    'slint-tools')
pkgver=1.15.0
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
    'libx11'
    'libxcb'
    'libxkbcommon'
    'pnpm'
    'python'
    'python-build'
    'python-installer'
    'python-maturin'
    'python-setuptools'
    'python-wheel'
    'wayland')
source=("https://github.com/slint-ui/slint/archive/v${pkgver}/slint-${pkgver}.tar.gz"
        '010-slint-remove-jemalloc.patch')
sha256sums=('0e171da6c39e45b7243d15a373128a3df53a3868bc1808e58fd9f4085bbf3913'
            'fb4c238d6186c434b72e1aa6e24453bee57754466f3091e51095ea92dbc24d84')

prepare () {
    cargo fetch --locked --target "$(rustc --print host-tuple)" --manifest-path="${pkgbase}-${pkgver}/Cargo.toml"
    cargo fetch --locked --target "$(rustc --print host-tuple)" --manifest-path="${pkgbase}-${pkgver}/api/python/slint/Cargo.toml"
    
    patch -d "${pkgbase}-${pkgver}" -Np1 -i "${srcdir}/010-slint-remove-jemalloc.patch"
    
    cd "${pkgbase}-${pkgver}/api/node"
    pnpm config set --local store-dir "${srcdir}/pnpm-cache"
    pnpm install --frozen-lockfile
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
        --package='slint-updater' \
        --package='slint-viewer' \
        --release
    
    # nodejs
    printf '%s\n' '  -> building nodejs-slint...'
    cd "${pkgbase}-${pkgver}/api/node"
    export CARGOFLAGS="--no-default-features --features ${_features}"
    pnpm run build   # generate binary .node file
    pnpm run compile # generate dist/ dir
    # generate node_modules/ dir with needed dependencies only
    pnpm --filter slint-ui --prod --legacy --no-optional --ignore-scripts deploy "${srcdir}/nodejs-deploy"
    
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

package_nodejs-slint() {
    pkgdesc="${pkgdesc} for Node.js apps"
    depends=(
        'fontconfig'
        'gcc-libs'
        'glibc'
        'nodejs'
        'libx11'
        'libxcb'
        'libxkbcommon'
        'wayland')
    optdepends=(
        'libgl: for Skia OpenGL renderer backend'
        'vulkan-icd-loader: for Skia Vulkan renderer backend')
    
    local _nodejs_dir="${pkgdir}/usr/lib/node_modules/slint-ui"
    
    install -D -m644 "${pkgbase}-${pkgver}/api/node"/*.node -t "$_nodejs_dir"
    install -D -m644 nodejs-deploy/package.json -t "$_nodejs_dir"
    install -D -m644 nodejs-deploy/rust-module.cjs -t "$_nodejs_dir"
    install -D -m644 nodejs-deploy/rust-module.d.cts -t "$_nodejs_dir"
    cp -dr --no-preserve='ownership' nodejs-deploy/dist "$_nodejs_dir"
    cp -dr --no-preserve='ownership' nodejs-deploy/node_modules "$_nodejs_dir"
    _install_licenses "$pkgdir" "$pkgname"
    
    # remove unneeded sections from package.json
    sed -i '/"ava":/,/}/d' "${_nodejs_dir}/package.json"
    sed -i '/"devDependencies":/,/}/d' "${_nodejs_dir}/package.json"
    sed -i '/"scripts":/,/}/d' "${_nodejs_dir}/package.json"
    
    # remove references to $srcdir/$pkgdir
    find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
}

package_python-slint() {
    pkgdesc="${pkgdesc} for Python apps"
    depends=(
        'fontconfig'
        'gcc-libs'
        'glibc'
        'python'
        'libx11'
        'libxcb'
        'libxkbcommon'
        'wayland')
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
        'gcc-libs'
        'glibc'
        'libx11'
        'libxcb'
        'libxkbcommon'
        'wayland')
    optdepends=(
        'libgl: for Skia OpenGL renderer backend'
        'vulkan-icd-loader: for Skia Vulkan renderer backend')
    provides=(
        'slint-compiler')
    
    DESTDIR="$pkgdir" cmake --install build-cpp
    _install_licenses "$pkgdir" "$pkgname"
}

package_slint-tools() {
    pkgdesc='Tools for the Slint GUI toolkit (lsp, tr-extractor, updater and viewer)'
    depends=(
        'fontconfig'
        'freetype2'
        'gcc-libs'
        'glibc'
        'libx11'
        'libxcb'
        'libxkbcommon'
        'wayland')
    optdepends=(
        'libgl: for Skia OpenGL renderer backend in slint-viewer'
        'vulkan-icd-loader: for Skia Vulkan renderer backend in slint-viewer')
    provides=(
        'slint-lsp'
        'slint-tr-extractor'
        'slint-updater'
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
