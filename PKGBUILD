# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=odiff-bin
pkgver=4.4.4
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
sha256sums_x86_64=('4f1768963b9583c0eb764555f1629f164a901fe47317ed581a908b4ddec6eb43')
sha256sums_aarch64=('2b72b9b536d9168106d336526413ea8abad07e422a261b3da2ec1ada4cc15f03')
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
