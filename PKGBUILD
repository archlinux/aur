# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=slint
pkgname=(
    'nodejs-slint'
    'python-slint'
    'slint-tools')
pkgver=1.14.1
pkgrel=1
pkgdesc='Declarative GUI toolkit to build native user interfaces'
license=('GPL-3.0-or-later OR LicenseRef-Slint-Royalty-free-2.0 OR LicenseRef-Slint-Software-3.0')
arch=('x86_64')
url='https://github.com/slint-ui/slint/'
makedepends=(
    'cargo'
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
sha256sums=('009dba754f0bdb42f56381b960dc9169568bcdecc588096b70ccccd2771ffff1'
            'fcb40b0b3395785debab59d4d4c09ee8ded180e013de563aab3585f2358aaceb')

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
        ! -name 'libslint_node.so*' \
        ! -name 'libslint_python.so*' \
        -exec cp -dr --no-preserve='ownership' {} "${pkgdir}/usr/lib/" \;
    
    _install_licenses "$pkgdir" "$pkgname"
}
