# Maintainer: ELECTRO <electro@electris.net>

pkgname=rustypaint-git
pkgver=0.2.3.r22.ga9f31dd
pkgrel=1
pkgdesc="Paint 3D's 2D editor, without the 3D (Git version)"
arch=('x86_64' 'aarch64')
url='https://github.com/ItzELECTR0/RustyPaint'
license=('GPL-3.0-only')
depends=('fontconfig' 'libxkbcommon' 'vulkan-icd-loader' 'gcc-libs')
makedepends=('cargo' 'git')
optdepends=('xdg-desktop-portal: native file dialogs, and following the system colour scheme'
            'vulkan-radeon: AMD GPU driver'
            'nvidia-utils: NVIDIA GPU driver'
            'vulkan-intel: Intel GPU driver')
provides=('rustypaint')
conflicts=('rustypaint')
options=('!debug')
_native=1
source=('rustypaint::git+https://github.com/ItzELECTR0/RustyPaint.git')
b2sums=('SKIP')
source_x86_64=('onnxruntime-x86_64.tar.lzma2::https://cdn.pyke.io/0/pyke:ort-rs/ms@1.28.0/x86_64-unknown-linux-gnu.tar.lzma2')
source_aarch64=('onnxruntime-aarch64.tar.lzma2::https://cdn.pyke.io/0/pyke:ort-rs/ms@1.28.0/aarch64-unknown-linux-gnu.tar.lzma2')
sha256sums_x86_64=('e454f710f8a49f53aa5b4ff51e3454ae1835777e431c6c35c5255ce6f205fd68')
sha256sums_aarch64=('06a050ab9137ccb32421d0cb49e9ccf72d9e18ab0aeb8f8d038d1b5cc844b35a')
noextract=('onnxruntime-x86_64.tar.lzma2' 'onnxruntime-aarch64.tar.lzma2')

pkgver() {
    cd rustypaint
    git describe --long --tags --abbrev=7 --match 'v[0-9]*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    mkdir -p "$srcdir/onnxruntime"
    xz --decompress --stdout --format=raw --lzma2=dict=64MiB "$srcdir/onnxruntime-$CARCH.tar.lzma2" | tar -xf - -C "$srcdir/onnxruntime"
    cd rustypaint
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd rustypaint
    export CARGO_TARGET_DIR=target
    export ORT_LIB_PATH="$srcdir/onnxruntime"

    for variable in CFLAGS CXXFLAGS; do
        read -ra flags <<< "${!variable}"
        flags=("${flags[@]/#-flto*/}")
        printf -v "$variable" '%s ' "${flags[@]}"
        export "$variable"
    done

    if [[ -n "${_native:-}" ]]; then
        export RUSTFLAGS="${RUSTFLAGS:-} -C target-cpu=native"
    fi

    cargo build --profile dist --frozen -p rustypaint
}

package() {
    cd rustypaint
    install -Dm755 target/dist/rustypaint "$pkgdir/usr/bin/rustypaint"
    install -Dm644 packaging/net.electris.RustyPaint.desktop \
        "$pkgdir/usr/share/applications/net.electris.RustyPaint.desktop"
    install -Dm644 packaging/flatpak/net.electris.RustyPaint.metainfo.xml \
        "$pkgdir/usr/share/metainfo/net.electris.RustyPaint.metainfo.xml"
    install -Dm644 packaging/mime/net.electris.RustyPaint.xml \
        "$pkgdir/usr/share/mime/packages/net.electris.RustyPaint.xml"
    install -Dm644 README.md "$pkgdir/usr/share/doc/rustypaint/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/rustypaint/LICENSE"

    for size in 16 24 32 48 64 128 256 512; do
        install -Dm644 "res/icons/icon-$size.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/rustypaint.png"
    done
}
