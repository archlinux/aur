# Maintainer: ELECTRO <electro@electris.net>

pkgname=rustypaint-git
pkgver=0.2.2
pkgrel=1
pkgdesc="Paint 3D's 2D editor, without the 3D (Git version)"
arch=('x86_64')
url='https://github.com/ItzELECTR0/RustyPaint'
license=('GPL-3.0-only')
depends=('fontconfig' 'libxkbcommon' 'vulkan-icd-loader')
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

pkgver() {
    cd rustypaint
    git describe --long --tags --abbrev=7 --match 'v[0-9]*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd rustypaint
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd rustypaint
    export CARGO_TARGET_DIR=target

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
    install -Dm644 README.md "$pkgdir/usr/share/doc/rustypaint/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/rustypaint/LICENSE"

    for size in 16 24 32 48 64 128 256 512; do
        install -Dm644 "res/icons/icon-$size.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/rustypaint.png"
    done
}
