# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>

_pkgbasename=vmaf
pkgname=("lib32-$_pkgbasename" "lib32-lib$_pkgbasename")
pkgver=3.0.0
pkgrel=1
pkgdesc='Perceptual video quality assessment algorithm based on multi-method fusion (32 bit)'
arch=('x86_64')
url='https://github.com/Netflix/vmaf/'
license=('BSD')
depends=(
        "$_pkgbasename>=${pkgver}"
        'lib32-gcc-libs'
    )
makedepends=(
        'meson'
#        'meson-cross-x86-linux-gnu>=1.0.4'
        'ninja'
        'nasm'
    )
# checkdepends=('vim')
source=("https://github.com/Netflix/${_pkgbasename}/archive/v${pkgver}/${_pkgbasename}-${pkgver}.tar.gz")
sha256sums=('7178c4833639e6b989ecae73131d02f70735fdb3fc2c7d84bc36c9c3461d93b1')

prepare() {
    mkdir -p "${_pkgbasename}-${pkgver}/libvmaf/build"
}

build() {
    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"   

    arch-meson -Denable_avx512='false' "${_pkgbasename}-${pkgver}/libvmaf" build \
        --prefix=/usr \
        --libdir=lib32 \
        -D enable_tests=false \
        -D enable_docs=false

    meson compile -C  build
}

# check() {
#     meson test -C  build
# }

package_lib32-libvmaf() {
    pkgdesc='Perceptual video quality assessment algorithm based on multi-method fusion - library (32 bit)'
    depends=(
      "$_pkgbasename"
      "lib32-gcc-libs"
    )
    provides=("lib32-vmaf")

    meson install -C build --destdir "$pkgdir"
    
    rm -r "$pkgdir"/usr/{include,bin}

#    install -D -m644 "${_pkgbasename}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    cp -dr --no-preserve='ownership' "${_pkgbasename}-${pkgver}/model" "${pkgdir}/usr/share"
}

package_lib32-vmaf() {
    pkgdesc='Perceptual video quality assessment algorithm based on multi-method fusion (32 bit)'
    depends=(
      "$_pkgbasename"
      "lib32-gcc-libs"
      "lib32-libvmaf"
    )

    meson install -C build --destdir "$pkgdir"

    # Use the same naming scheme as the one in the lib32-shaderc-git package for coherence
    # Arch wiki suggest to use the "-32" suffix for 32 bit executables: https://wiki.archlinux.org/index.php/32-bit_package_guidelines
    for i in "${pkgdir}/usr/bin/"*; do
        mv "$i" "$i"-32
    done

    rm -r "$pkgdir"/usr/{include,lib32}
}
