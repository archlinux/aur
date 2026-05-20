# Maintainer: Damglador <damglador@gmail.com>

pkgname=dotpeek
_pkgname=dotpeek

pkgver=2026.1.2
pkgrel=1
arch=('x86_64')

pkgdesc="Free .NET Decompiler and Assembly Browser (running in Wine)"
url="https://www.jetbrains.com/decompiler/"
license=("custom")

depends=("wine" "pyside6")
makedepends=("icoutils" "imagemagick")
options=("!strip" "!debug")

source=(
	"${_pkgname}-${pkgver}.exe::https://download.jetbrains.com/resharper/dotUltimate.${pkgver}/dotPeek64.${pkgver}.exe"
	"${_pkgname}.exe.desktop"
  "${_pkgname}.py"
	)
# There are official sums on https://www.jetbrains.com/decompiler/download/other/
sha256sums=('e211a6ad87c530cfda6f68cc4a337cec78e2dacdd1ba493d211169934c67952b'
            '6c35ca1d9caeb98629270e05aaaecce42b937348d5434adad33eacfbf553092c'
            'c3b1ad6a91100841a5d27fb49ebf64b3e99ddc2cf82f98c5b40845fc1b13eebe')

package(){
  install -Dm755 "${_pkgname}-${pkgver}.exe" "$pkgdir/opt/${_pkgname}/${_pkgname}-${pkgver}.exe"
  ln -s "${_pkgname}-${pkgver}.exe" "$pkgdir/opt/${_pkgname}/${_pkgname}.exe"

	# Install launcher script
	install -Dm755 "${_pkgname}.py" "$pkgdir/usr/bin/${_pkgname}"
	# Install destkop file
	install -Dm644 "${_pkgname}.exe.desktop" "$pkgdir/usr/share/applications/${_pkgname}.exe.desktop"
	# Exctract icons
	wrestool -x -t 14 "${_pkgname}-${pkgver}.exe" > icon.ico
	magick icon.ico -set filename:size '%wx%h' '%[filename:size].png'
	# Install icons
	sizes=(16 20 24 32 48 64 256)
	for size in "${sizes[@]}"; do
    install -Dm644 "${size}x${size}.png" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/${_pkgname}.png"
	done
}
