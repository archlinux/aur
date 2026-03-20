# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=acestep.cpp-bin
pkgver=0.0.3
pkgrel=1
pkgdesc='Portable C++17 music generation using GGML (ACE-Step 1.5). Text + lyrics in, stereo 48kHz audio out'
arch=('x86_64')
url='https://github.com/ServeurpersoCom/acestep.cpp'
license=('MIT')
depends=('gcc-libs' 'glibc')
optdepends=(
    'cuda: NVIDIA GPU acceleration'
    'nvidia-utils: NVIDIA GPU acceleration'
    'vulkan-icd-loader: Vulkan GPU acceleration'
)
makedepends=('patchelf')
provides=('acestep.cpp')
conflicts=('acestep.cpp')
options=('!debug')

_binaries=(ace-lm ace-synth ace-server ace-understand neural-codec mp3-codec quantize)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/audiohacking/acestep.cpp/releases/download/v${pkgver}/acestep-linux-x64.tar.gz"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/ServeurpersoCom/acestep.cpp/refs/heads/master/LICENSE")
sha256sums=('cdc26930604b259f300930a6264f2695aeab0412d516396945cbcdbe989666a5'
            '43e5610846745c687f675badd848d769c8af0a671604efe45cb1466517fd3ddb')

_libdir=/usr/lib/acestep

prepare() {
    cd "${srcdir}"

    # Fix hardcoded CI build path in RUNPATH
    for bin in "${_binaries[@]}"; do
        patchelf --set-rpath "${_libdir}" "${bin}"
    done
    for lib in libggml*.so; do
        patchelf --set-rpath "${_libdir}" "${lib}"
    done
}

package() {
    cd "${srcdir}"

    # Install binaries to private lib dir (GGML discovers backends via /proc/self/exe dir)
    install -dm755 "${pkgdir}${_libdir}"
    for bin in "${_binaries[@]}"; do
        install -Dm755 "${bin}" "${pkgdir}${_libdir}/${bin}"
    done

    # Install shared libraries
    for lib in libggml*.so; do
        install -Dm755 "${lib}" "${pkgdir}${_libdir}/${lib}"
    done

    # Create soname symlinks
    ln -s libggml.so "${pkgdir}${_libdir}/libggml.so.0"
    ln -s libggml-base.so "${pkgdir}${_libdir}/libggml-base.so.0"

    # Create wrapper scripts in /usr/bin
    install -dm755 "${pkgdir}/usr/bin"
    for bin in "${_binaries[@]}"; do
        cat > "${pkgdir}/usr/bin/${bin}" << EOF
#!/bin/sh
exec ${_libdir}/${bin} "\$@"
EOF
        chmod 755 "${pkgdir}/usr/bin/${bin}"
    done

    # License
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

latestver() {
    gh api repos/audiohacking/acestep.cpp/releases/latest --jq '.tag_name' | sed 's/^v//'
}
