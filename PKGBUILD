# Maintainer: Ansel Hayashi <Telegram: @sym_ansel>
pkgname=kemulatornnmod-bin
pkgver=2.22
pkgrel=1
pkgdesc="Emulator for j2me, CLDC, MIDP applications and games"
arch=('x86_64')
url="https://nnproject.cc/kem/"
license=('custom')
depends=('java-runtime-openjdk'
	'xdg-utils'
	'polkit'
	'bash'
	'gtk3')
optdepends=('vlc-cli: for MMAPI/JSR135 support'
	'jdk8-openjdk: recommended JDK'
	'unzip: for Intellij IDEA integration'
	'wget: for Intellij IDEA integration'
	'proguard: for Intellij IDEA integration'
	'intellij-idea-community-edition: compatible Intellij IDEA package')
source=(pkg_${pkgver}.zip::"https://github.com/shinovon/KEmulator/releases/download/v${pkgver}/kemnnx64.v${pkgver}.zip"
    "icon.png")
sha256sums=('f9a5a442014d43f1d9d2c51243795680d99fd91e49c300712ac6bd0823ed8e5e'
	'b6215676e6550a4472bbabe238ad55daaa52a7efe0f7475de58a109755f470ab')

prepare() {
	cd ${srcdir}/kemnnx64
	rm *windows*
	rm *win32*
	rm *macos*
	rm *.dll
	rm *-osx*
	rm *.bat
	rm *arm32*
	rm *arm64*
	rm *aarch64*
	rm *armhf*
	rm *-x86.jar
	rm libjinput-linux.so
}

package() {
	# crlf
	sed -i 's/\r$//' "${srcdir}/kemnnx64/kemulator.sh"
	sed -i 's/\r$//' "${srcdir}/kemnnx64/builder.sh"
	sed -i 's/\r$//' "${srcdir}/kemnnx64/.package/cc.nnproject.kemulator.desktop"
	sed -i 's/\r$//' "${srcdir}/kemnnx64/.package/cc.nnproject.kemulator.xml"

	# wheels
	install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/cc.nnproject.kemulator.png"
	install -Dm644 "${srcdir}/kemnnx64/.package/cc.nnproject.kemulator.desktop" -t "${pkgdir}/usr/share/applications/"
	install -Dm644 "${srcdir}/kemnnx64/.package/cc.nnproject.kemulator.xml" -t "${pkgdir}/usr/share/metainfo/"
	install -Dm755 "${srcdir}/kemnnx64/kemulator.sh" "${pkgdir}/usr/bin/kemulator"
	install -Dm755 "${srcdir}/kemnnx64/builder.sh" "${pkgdir}/usr/bin/kembuild"

	# kemnn itself
	install -Dm644 "${srcdir}/kemnnx64/"*.jar -t "${pkgdir}/usr/share/kemulator/"
	install -Dm755 "${srcdir}/kemnnx64/"*.so "${pkgdir}/usr/share/kemulator/"
	install -Dm644 "${srcdir}/kemnnx64/lang/"* -t "${pkgdir}/usr/share/kemulator/lang/"

	# uei
	install -Dm644 "${srcdir}/kemnnx64/uei/"* -t "${pkgdir}/usr/share/kemulator/uei/"
	chmod 755 "${pkgdir}/usr/share/kemulator/uei/preverify"
	chmod 755 "${pkgdir}/usr/share/kemulator/uei/preverify1.0"
	chmod 755 "${pkgdir}/usr/share/kemulator/uei/preverify1.1"
	chmod 755 "${pkgdir}/usr/share/kemulator/uei/emulator"
}
