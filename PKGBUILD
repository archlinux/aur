# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=maretf-bin
pkgver=0.10.1
pkgrel=1
pkgdesc="A work in progress command-line utility to work with VTF files."
arch=('x86_64')
url="https://github.com/craftablescience/MareTF"
license=('MIT')
makedepends=('patchelf')
depends=('glibc' 'libstdc++' 'libgcc' 'qt6-base' 'hicolor-icon-theme' 'libglvnd')
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}")
source=("MareTF-Linux-Standalone-gcc-release-${pkgver}.zip::$url/releases/download/v${pkgver}/MareTF-Linux-Standalone-gcc-release.zip"
	"$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d0df263b6f4b381e30aa99552e64888e7801184d723a63ef7b6c628573834bcb'
            'b2c8edfae6ee90918d2cf0aab0f434fa4fde3cc4e1f15157986e92233b5384c7')

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
