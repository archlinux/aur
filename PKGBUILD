# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=maretf-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="A work in progress command-line utility to work with VTF files."
arch=('x86_64')
url="https://github.com/craftablescience/MareTF"
license=('MIT')
makedepends=('patchelf')
depends=('glibc' 'gcc-libs' 'qt6-base' 'hicolor-icon-theme' 'libglvnd')
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}")
source=("MareTF-Linux-Standalone-gcc-release-${pkgver}.zip::$url/releases/download/v${pkgver}/MareTF-Linux-Standalone-gcc-release.zip"
	"$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('392d951c101f89b79f6bc1bdbf5da8e07833265f6a69412af483d4f17412c1aa'
            '31cd47f1e4594e89f288f50aeb434db85299fc13ed2ca1fc1f566c05632195de')

package() {
	cd "$srcdir"
	install -Dm755 "$srcdir/${pkgname::-4}" "$pkgdir/usr/bin/${pkgname::-4}"
	install -Dm755 "$srcdir/${pkgname::-4}_gui" "$pkgdir/usr/bin/${pkgname::-4}_gui"
	install -Dm644 "$srcdir/MareTF-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "$srcdir/MareTF-${pkgver}/install/linux/desktop.in" "$pkgdir/usr/share/applications/${pkgname::-4}.desktop"
	install -Dm644 "$srcdir/MareTF-${pkgver}/install/linux/mime-type.xml.in" "$pkgdir/usr/share/mime/packages/${pkgname::-4}.xml"
	patchelf --remove-rpath "$pkgdir/usr/bin/${pkgname::-4}"
	patchelf --remove-rpath "$pkgdir/usr/bin/${pkgname::-4}_gui"

	pushd "$pkgdir/usr/share"
	sed -i 's/${PROJECT_NAME_PRETTY}/MareTF/g;s/${PROJECT_DESCRIPTION}/A work in progress command-line utility to work with VTF files./g;s/${PROJECT_NAME}/maretf/g' applications/${pkgname::-4}.desktop
	sed -i 's/${PROJECT_NAME}/maretf/g' mime/packages/${pkgname::-4}.xml
	popd

	install -Dm644 "$srcdir/MareTF-${pkgver}/res/logo.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/${pkgname::-4}.png"
}
