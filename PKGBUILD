# Contributor: liberodark

pkgname=cloaker-bin
pkgver=4.0
pkgrel=1
pkgdesc="Simple password-based file encryption"
arch=('x86_64')
url="https://github.com/spieglt/Cloaker"
license=('GPL3')
depends=(gcc-libs xdg-utils qt5-{base,declarative,translations})
makedepends=(patchelf binutils)
optdepends=(qt5-{imageformats,svg,virtualkeyboard})
source=("src.iso::https://github.com/spieglt/Cloaker/releases/download/v${pkgver}/Cloaker_Linux.AppImage"
cloaker.{png,desktop})
sha256sums=('9a74aafdebe1257f7d613ddd584c47aeafbc2e10de13db7af17dcdca957ebcbc'
            'bcc57d448943333c9f937c013e718f922c3141011c8ede6428b2963f4ec559fd'
            'a00563de575ed4b28c764616475bb73aacdaa7a2ff0d35ca1fdbde06b6d998e1')
prepare() {
	chmod +x src.iso
	./src.iso --appimage-extract > /dev/null
}
build() {
	# Remove Qt5 version from symbol
	patchelf --remove-rpath squashfs-root/cloaker $(nm -D squashfs-root/cloaker|grep @Qt_5|sed 's/@Qt_5.*//;s/^\s*U/--clear-symbol-version/'|tr '\n' ' ')
}
package() {
	install -D squashfs-root/cloaker "${pkgdir}/usr/bin/cloaker"
	install -Dm644 cloaker.desktop "${pkgdir}/usr/share/applications/cloaker.desktop"
	install -Dm644 cloaker.png "${pkgdir}/usr/share/pixmaps/cloaker.png"
}
