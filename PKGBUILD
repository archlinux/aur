# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=slint-git
pkgname=(
    'nodejs-slint-git'
    'python-slint-git'
    'slint-cpp-git'
    'slint-tools-git')
pkgver=1.14.1.r579.g2cac71880
pkgrel=1
pkgdesc='Declarative GUI toolkit to build native user interfaces (git version)'
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
source=('git+https://github.com/slint-ui/slint.git'
        '010-slint-cpp-disable-jemalloc.patch')
sha256sums=('SKIP'
            'e8e6b5acd5c85a2bd73872b5272d3b2d3787536551d14ad73978c8e6d94cd3a9')

prepare () {
    cargo fetch --target "$(rustc --print host-tuple)" --manifest-path='slint/Cargo.toml'
    cargo fetch --target "$(rustc --print host-tuple)" --manifest-path='slint/api/python/slint/Cargo.toml'
    
    patch -d slint -Np1 -i "${srcdir}/010-slint-cpp-disable-jemalloc.patch"
    
    cd slint
    
    # The commands bellow remove jemalloc, as it causes build issues (avoid patching due to ever changing code from git repo)
    
    # Remove jemalloc from the workspace entirely
    find . -name "Cargo.toml" -exec sed -i '/tikv-jemallocator/d' {} +
    
    # Remove any forced jemalloc features from tools
    find . -name "Cargo.toml" -exec sed -i 's/"jemalloc"//g' {} +
    find . -name "Cargo.toml" -exec sed -i 's/jemalloc = \[.*\]//g' {} +
    
    # Remove the jemalloc block from tools/compiler/main.rs
    sed -i '0,/static GLOBAL: Jemalloc = Jemalloc;/{ /#\[cfg(all(/,/static GLOBAL: Jemalloc = Jemalloc;/d }' tools/compiler/main.rs
    
    # Remove the 'use' statements for jemalloc from tools
    sed -i '/use tikv_jemallocator::Jemalloc;/d' tools/{compiler,lsp,viewer}/main.rs
    
    # Remove the global_allocator static definitions from tools
    # This looks for the #[global_allocator] line and the 'static GLOBAL' line following it
    sed -i '/#\[global_allocator\]/,/static GLOBAL: Jemalloc = Jemalloc;/d' tools/{compiler,lsp,viewer}/main.rs
    
    # Comment out the allocator usage in the entire tree
    find . -name "*.rs" -exec sed -i 's/#!\[no_std\]//g' {} + # Ensure we stay in std mode
    find . -name "*.rs" -exec sed -i 's/extern crate tikv_jemallocator;//g' {} +
    find . -name "*.rs" -exec sed -i '/@\[global_allocator\]/,/;/ s/^/\/\//' {} +
    
    cd api/node
    pnpm config set --local store-dir "${srcdir}/pnpm-cache"
    pnpm install --frozen-lockfile
}

pkgver() {
    git -C slint describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    export CARGO_TARGET_DIR="${srcdir}/cargo-target"
    export RUSTUP_TOOLCHAIN='stable'
    export SLINT_NO_QT='1'
    local _features='backend-winit,gettext,renderer-femtovg,renderer-skia,renderer-skia-opengl,renderer-skia-vulkan,renderer-software'
    
    # c++
    printf '%s\n' '  -> building slint-cpp...'
    cmake -S slint -B build-cpp \
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
        --manifest-path='slint/Cargo.toml' \
        --no-default-features \
        --package='slint-lsp' \
        --package='slint-tr-extractor' \
        --package='slint-updater' \
        --package='slint-viewer' \
        --release
    
    # nodejs
    printf '%s\n' '  -> building nodejs-slint...'
    cd slint/api/node
    export CARGOFLAGS="--no-default-features --features ${_features}"
    pnpm run build   # generate binary .node file
    pnpm run compile # generate dist/ dir
    # generate node_modules/ dir with needed dependencies only
    pnpm --filter slint-ui --prod --legacy --no-optional --ignore-scripts deploy "${srcdir}/nodejs-deploy"
    
    # python
    printf '%s\n' '  -> building python-slint...'
    cd "${srcdir}/slint/api/python/slint"
    export MATURIN_SETUP_ARGS="--no-default-features --features ${_features}"
    python -m build --wheel --no-isolation
}

# arguments: $1: $pkgdir, $2: $pkgname
_install_licenses() {
    install -D -m644 slint/LICENSES/LicenseRef-Slint-Royalty-free-2.0.md -t "${1}/usr/share/licenses/${2}"
    install -D -m644 slint/LICENSES/LicenseRef-Slint-Software-3.0.md -t "${1}/usr/share/licenses/${2}"
}

package_nodejs-slint-git() {
    pkgdesc='Declarative GUI toolkit to build native user interfaces for Node.js apps (git version)'
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
    provides=(
        'nodejs-slint')
    conflicts=(
        'nodejs-slint')
    
    local _nodejs_dir="${pkgdir}/usr/lib/node_modules/slint-ui"
    
    install -D -m644 slint/api/node/*.node -t "$_nodejs_dir"
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

package_python-slint-git() {
    pkgdesc='Declarative GUI toolkit to build native user interfaces for Python apps (git version)'
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
    provides=(
        'python-slint')
    conflicts=(
        'python-slint')
    
    python -m installer --destdir="$pkgdir" slint/api/python/slint/dist/*.whl
    _install_licenses "$pkgdir" "$pkgname"
}

package_slint-cpp-git() {
    pkgdesc='Declarative GUI toolkit to build native user interfaces for C++ apps (git version)'
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
        'slint-cpp'
        'slint-compiler')
    conflicts=(
        'slint-cpp'
        'slint-compiler')
    
    DESTDIR="$pkgdir" cmake --install build-cpp
    _install_licenses "$pkgdir" "$pkgname"
}

package_slint-tools-git() {
    pkgdesc='Tools for the Slint GUI toolkit (lsp, tr-extractor, updater and viewer) (git version)'
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
        'slint-tools'
        'slint-tr-extractor'
        'slint-updater'
        'slint-viewer')
    conflicts=(
        'slint-lsp'
        'slint-tools'
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
