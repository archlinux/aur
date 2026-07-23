# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=odiff-bin
pkgver=4.5.0
pkgrel=1
pkgdesc="Blazing fast SIMD-optimized image comparison CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/dmtrKovalenko/odiff"
license=('MIT')
depends=('glibc')
options=('!debug')

provides=('odiff')
conflicts=('odiff')
source=(
	"LICENSE-${pkgver}.txt::https://raw.githubusercontent.com/dmtrKovalenko/odiff/v${pkgver}/LICENSE.txt"
)
sha256sums=('9608ab37156c8d14fbb2fab1381d023c1fce07e7850306bba3a227a85ec4fab4')
sha256sums_x86_64=('2eb5a7f44df925d93b451898de8bf213f0aac270a9781187746097ed7cd45324')
sha256sums_aarch64=('245ad45851da200cfdd361374618fca22781919faaca255aed1c93b883beb476')
source_x86_64=("odiff-linux-x64::https://github.com/dmtrKovalenko/odiff/releases/download/v${pkgver}/odiff-linux-x64")
source_aarch64=("odiff-linux-arm64::https://github.com/dmtrKovalenko/odiff/releases/download/v${pkgver}/odiff-linux-arm64")
noextract=('odiff-linux-x64' 'odiff-linux-arm64')

latestver() {
	gh api --paginate repos/dmtrKovalenko/odiff/releases --jq '.[] | select(.prerelease == false and .draft == false and any(.assets[]; .name == "odiff-linux-x64") and any(.assets[]; .name == "odiff-linux-arm64")) | .tag_name' |
	head -1 | sed -E 's/^v//'
}

package() {
	case "${CARCH}" in
		x86_64) _binary="odiff-linux-x64" ;;
		aarch64) _binary="odiff-linux-arm64" ;;
	esac
	install -Dm755 "${srcdir}/${_binary}" "${pkgdir}/usr/bin/odiff"
	install -Dm644 "${srcdir}/LICENSE-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
