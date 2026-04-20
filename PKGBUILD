# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=maretf-bin
pkgver=0.10.4
pkgrel=1
pkgdesc="A work in progress command-line utility to work with VTF files."
arch=('x86_64')
url="https://github.com/craftablescience/MareTF"
license=('MIT')
makedepends=('patchelf')
depends=('glibc' 'libstdc++' 'libgcc' 'qt6-base' 'hicolor-icon-theme' 'libglvnd')
replaces=("vtf-thumbnailer")
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}" "vtf-thumbnailer")
source=("MareTF-Linux-Standalone-gcc-release-${pkgver}.zip::$url/releases/download/v${pkgver}/MareTF-Linux-Standalone-gcc-release.zip"
	"$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a6fdc8d4d633fde4718f60982f2214ed3eab7f3addb616c31896cdf580079a20'
            '3ab8f552d8c828e4b967037e8f33dc59f08cc5d383e49c26e4de8ec94a6c844d')

package() {
	cd "$srcdir"
	install -Dm755 "$srcdir/${pkgname::-4}" "$pkgdir/usr/bin/${pkgname::-4}"
	install -Dm755 "$srcdir/${pkgname::-4}_gui" "$pkgdir/usr/bin/${pkgname::-4}_gui"
	install -Dm755 "$srcdir/${pkgname::-4}_thumbnailer" "$pkgdir/usr/bin/${pkgname::-4}_thumbnailer"
	install -Dm644 "$srcdir/MareTF-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "$srcdir/MareTF-${pkgver}/install/linux/desktop.in" "$pkgdir/usr/share/applications/${pkgname::-4}.desktop"
	install -Dm644 "$srcdir/MareTF-${pkgver}/install/linux/mime-type.xml.in" "$pkgdir/usr/share/mime/packages/${pkgname::-4}.xml"
	install -Dm644 "$srcdir/MareTF-${pkgver}/install/linux/thumbnailer.in" "$pkgdir/usr/share/thumbnailers/${pkgname::-4}.thumbnailer"
	patchelf --remove-rpath "$pkgdir/usr/bin/${pkgname::-4}"
	patchelf --remove-rpath "$pkgdir/usr/bin/${pkgname::-4}_gui"

	pushd "$pkgdir/usr/share"
	sed -i 's/${PROJECT_NAME_PRETTY}/MareTF/g;s/${PROJECT_DESCRIPTION}/A work in progress command-line utility to work with VTF files./g;s/${PROJECT_NAME}/maretf/g' applications/${pkgname::-4}.desktop
	sed -i 's/${PROJECT_NAME}/maretf/g' mime/packages/${pkgname::-4}.xml thumbnailers/${pkgname::-4}.thumbnailer
	popd

	install -Dm644 "$srcdir/MareTF-${pkgver}/res/logo.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/${pkgname::-4}.png"
}
