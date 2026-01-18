# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=slint-cpp
pkgver=1.14.1
pkgrel=1
pkgdesc='Declarative GUI toolkit to build native user interfaces for C++ apps'
license=('GPL-3.0-or-later OR LicenseRef-Slint-Royalty-free-2.0 OR LicenseRef-Slint-Software-3.0')
arch=('x86_64')
url='https://github.com/slint-ui/slint/'
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
makedepends=(
    'cargo'
    'cmake'
    'git')
provides=(
    'slint-compiler')
source=("https://github.com/slint-ui/slint/archive/v${pkgver}/slint-${pkgver}.tar.gz"
        '010-slint-remove-jemalloc.patch')
sha256sums=('009dba754f0bdb42f56381b960dc9169568bcdecc588096b70ccccd2771ffff1'
            'fcb40b0b3395785debab59d4d4c09ee8ded180e013de563aab3585f2358aaceb')

prepare () {
    cargo fetch --locked --target "$(rustc --print host-tuple)" --manifest-path="slint-${pkgver}/Cargo.toml"
    
    patch -d "slint-${pkgver}" -Np1 -i "${srcdir}/010-slint-remove-jemalloc.patch"
}

build() {
    export CARGO_TARGET_DIR='cargo-target'
    export RUSTUP_TOOLCHAIN='stable'
    export SLINT_NO_QT='1'
    
    cmake -S "slint-${pkgver}" -B build-cpp \
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
}

package() {
    DESTDIR="$pkgdir" cmake --install build-cpp
    install -D -m644 "slint-${pkgver}/LICENSES/LicenseRef-Slint-Royalty-free-2.0.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 "slint-${pkgver}/LICENSES/LicenseRef-Slint-Software-3.0.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
