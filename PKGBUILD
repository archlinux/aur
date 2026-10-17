# Maintainer: jessienab <git at nabein dot me>

_prgname=redumper-gui
pkgname=redumper-gui
epoch=
pkgver=1.1.0
pkgrel=3
pkgdesc='A cross-platform digital fidget spinner and GUI for redumper. Package built from tagged release source.'
arch=(x86_64)
url='https://github.com/Deterous/Redumper-GUI'
license=('GPL-3.0')

# The GUI is pre-packaged with a supported and recommended version of redumper therefore, this must be present on the system. Generally this follows redumper git upstream builds.

provides=('redumper')
_redumperver=b766

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

sha256sums=('05fb27caa2714ed2bc4fa3da2278997f0e8740f4e1d07cf0fa4b83d0e57440fd'
'db3be33dbe7015d020875942fa780dbeb8524c15b8428b3c6b1e28f104428fa2'
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
