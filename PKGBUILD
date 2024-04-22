# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>

pkgname=realesrgan-ncnn-vulkan
_pkgname=Real-ESRGAN-ncnn-vulkan
pkgver=0.2.0
_pkgver="v$pkgver"
pkgrel=7
pkgdesc="NCNN implementation of Real-ESRGAN"
url="https://github.com/xinntao/Real-ESRGAN-ncnn-vulkan"
license=('MIT')
depends=('vulkan-driver' 'libwebp' 'ncnn')
makedepends=('git' 'cmake' 'vulkan-headers' 'glslang')
conflicts=('realesrgan-ncnn-vulkan-bin')
provides=('realesrgan-ncnn-vulkan')
arch=('x86_64')
source=(
    "git+https://github.com/xinntao/$_pkgname#tag=${_pkgver}"
    "https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.5.0/realesrgan-ncnn-vulkan-20220424-ubuntu.zip"
    "realesrgan-ncnn-vulkan"
    cmake.patch
    )

sha256sums=('d07937c80a6befb563e9ab87e532ce8935cf653738427b1a905da322f957e283'
            'e5aa6eb131234b87c0c51f82b89390f5e3e642b7b70f2b9bbe95b6a285a40c96'
            '058bc5167a00ff53a6a135ed033797a4d012bdb86e930ba4eb271ab4c848f8df'
            '8e1e31f2710893552caf3917585b945cd2054b7d9f9eabe6b8672ac97750ae9e')
prepare() {
    cd $_pkgname
    patch -Np1 -i "$srcdir/cmake.patch"
}
build() {
    cd "$srcdir"
    
    cmake -B build -S "$_pkgname/src" \
    -DBUILD_SHARED_LIBS=0 \
    -DUSE_SYSTEM_NCNN=1 \
    -DUSE_SYSTEM_WEBP=1 \
    -DGLSLANG_TARGET_DIR=/usr/lib/cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev

    cmake --build build
}

package() {
    cd "${srcdir}"

    install -Dm644 build/realesrgan-ncnn-vulkan "$pkgdir/usr/lib/realesrgan-ncnn-vulkan/realesrgan-ncnn-vulkan"
    chmod +x "$pkgdir/usr/lib/realesrgan-ncnn-vulkan/realesrgan-ncnn-vulkan"

    cd "${srcdir}"
    
    install -Dm644 realesrgan-ncnn-vulkan "$pkgdir/usr/bin/realesrgan-ncnn-vulkan"
    chmod +x "$pkgdir/usr/bin/realesrgan-ncnn-vulkan"

    mkdir -p "$pkgdir/usr/share/realesrgan-ncnn-vulkan/"
    cp -r models "$pkgdir/usr/share/realesrgan-ncnn-vulkan/models"

    install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
