# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>

_pkgbasename=vmaf
pkgname=lib32-$_pkgbasename
pkgver=1.5.1
pkgrel=1
pkgdesc='Perceptual video quality assessment algorithm based on multi-method fusion'
arch=('x86_64')
url='https://github.com/Netflix/vmaf/'
license=('BSD')
depends=(
        "$_pkgbasename"
        'lib32-gcc-libs'
    )
makedepends=(
        'meson'
#        'meson-cross-x86-linux-gnu>=1.0.4'
        'ninja'
    )
source=("${_pkgbasename}-${pkgver}.tar.gz"::"https://github.com/Netflix/${_pkgbasename}/archive/v${pkgver}.tar.gz")
sha256sums=('9267b40223ac8d67fb6b99726ce7ed3925b9843f18ad5aa8ffbe2fe873e45cbe')

prepare() {
    mkdir -p "${_pkgbasename}-${pkgver}/libvmaf/build"
}

build() {
    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"   

    cd "${_pkgbasename}-${pkgver}/libvmaf"
    meson  build \
        --prefix=/usr \
        --libdir=lib32

    ninja -v -C build
}

# check() {
#     ninja -v -C "${_pkgbasename}-${pkgver}/libvmaf/build" test
# }

package() {
    cd ${_pkgbasename}-${pkgver}/libvmaf

    DESTDIR="$pkgdir" ninja -v -C "build" install
    
    local _bin
    install -D -m755 "build/tools/vmaf" -t "${pkgdir}/usr/bin"
    for _bin in moment ms_ssim psnr ssim
    do
        install -D -m755 "build/tools/${_bin}" "${pkgdir}/usr/bin/vmaf-${_bin}"
    done

  # Use the same naming scheme as the one in the lib32-shaderc-git package for coherence
  # Arch wiki suggest to use the "-32" suffix for 32 bit executables: https://wiki.archlinux.org/index.php/32-bit_package_guidelines
    for i in "${pkgdir}/usr/bin/"*; do
        mv "$i" "$i"-32
    done

    rm -r "$pkgdir"/usr/{include,share}

#    install -D -m644 "${_pkgbasename}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
