# Maintainer: jessienab <git at nabein dot me>

_prgname=redumper-gui
pkgname=redumper-gui
epoch=
pkgver=1.2.0
pkgrel=1
pkgdesc='A cross-platform digital fidget spinner and GUI for redumper. Package built from tagged release source.'
arch=(x86_64)
url='https://github.com/Deterous/Redumper-GUI'
license=('GPL-3.0')

# The GUI is pre-packaged with a supported and recommended version of redumper therefore, this must be present on the system. Generally this follows redumper git upstream builds.

provides=('redumper')
_redumperver=b773

conflicts=(
    "redumper-gui-bin"
    "redumper-bin"
    "redumper-git"
    "redumper"
)

makedepends=(
    'cargo'
)

source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/Deterous/Redumper-GUI/archive/refs/tags/v$pkgver.tar.gz"
    "https://github.com/superg/redumper/releases/download/$_redumperver/redumper-$_redumperver-linux-x64.zip"
    "https://raw.githubusercontent.com/Deterous/Redumper-GUI/refs/heads/main/LICENSE"
    "https://raw.githubusercontent.com/Deterous/Redumper-GUI/refs/heads/main/README.md"
)

sha256sums=('bfda847309fe788dfee43e2ffa91320ec031f8d139a5471d1f8f94a7aee32117'
'd9b543f1ef85c53998fb8b6d8820e909cb291c2cc914b4d2ee73604742940fc1'
'SKIP'
'SKIP')

# Arch default makepkg LTO settings cause a build failure without the added CFLAGS
# Source of fix: https://github.com/mozilla/sccache/issues/862#issuecomment-2186738388

prepare() {
    cd ${srcdir}/Redumper-GUI-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo update
    cargo fetch --locked --target host-tuple
}

build() {
    cd ${srcdir}/Redumper-GUI-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    CFLAGS+=' -ffat-lto-objects' cargo build --all-features --frozen --release --verbose --target x86_64-unknown-linux-gnu 
}

package() {
	# install binary
	install -Dm 755 ${srcdir}/Redumper-GUI-${pkgver}/target/x86_64-unknown-linux-gnu/release/redumper-gui ${pkgdir}/usr/bin/${pkgname}
	install -Dm 755 ${srcdir}/redumper-$_redumperver-linux-x64/bin/redumper ${pkgdir}/usr/bin/redumper

	# install documentation
	install -Dm 644 ${srcdir}/README.md ${pkgdir}/usr/local/share/doc/${pkgname}/README.md

	# install license
	install -Dm 644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
