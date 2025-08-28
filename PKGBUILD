# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=maretf-bin
pkgver=0.7.3
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
sha256sums=('d1e7d16dcf8b2ce8361f4e1222fccf76fa2da4105bd1b824eaf18da17a84b215'
            '2d6c09cab24634d2caf8ff8810633663837b5c8676f542df0941cd0801450c31')

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
