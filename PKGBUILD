# Maintainer: jessienab <git at nabein dot me>

pkgname=redumper-gui
epoch=
pkgver=1.0.3
pkgrel=1
pkgdesc='A cross-platform digital fidget spinner and GUI for redumper. Package built from tagged release source.'
arch=(x86_64)
url='https://github.com/Deterous/Redumper-GUI'
license=('GPL-3.0')

# The GUI is pre-packaged with a supported and recommended version of redumper therefore, this must be present on the system. Generally this follows redumper git upstream builds.
# The redumper-bin AUR package is only updated when Media Preservation Frontend (MPF) marks a redumper version as "safe", or based on "safe" Redump.org version

conflicts=(
    "redumper-gui-bin"
    "redumper-bin"
    "redumper"
)

makedepends=(
    'cargo'
)

source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/Deterous/Redumper-GUI/archive/refs/tags/v$pkgver.tar.gz"
    "https://github.com/superg/redumper/releases/download/b734/redumper-b734-linux-x64.zip"
    "https://raw.githubusercontent.com/Deterous/Redumper-GUI/refs/heads/main/LICENSE"
    "https://raw.githubusercontent.com/Deterous/Redumper-GUI/refs/heads/main/README.md"
)

sha256sums=('SKIP'
'36e3fbcb20482014c508867fce8225e01e31f881d4a698bedfa015adcd1c1b0c'
'SKIP'
'SKIP')

# Arch default makepkg LTO settings cause a build failure without the added CFLAGS
# Source of fix: https://github.com/mozilla/sccache/issues/862#issuecomment-2186738388

build() {
        cd ${srcdir}/Redumper-GUI-$pkgver
        CFLAGS+=' -ffat-lto-objects' cargo build --release --verbose --target x86_64-unknown-linux-gnu 
}

package() {
	# install binary
	install -Dm 755 ${srcdir}/Redumper-GUI-${pkgver}/target/x86_64-unknown-linux-gnu/release/redumper-gui ${pkgdir}/usr/bin/${pkgname}
	install -Dm 755 ${srcdir}/redumper-b734-linux-x64/bin/redumper ${pkgdir}/usr/bin/redumper

	# install documentation
	install -Dm 644 ${srcdir}/README.md ${pkgdir}/usr/local/share/doc/${_prgname}/README.md

	# install license
	install -Dm 644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${_prgname}/LICENSE
}
