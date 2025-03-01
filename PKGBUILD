# Maintainer: viable <hi@viable.gg>
_pkgbase=lifetch
pkgname=${_pkgbase}-git
pkgver=0.1.1.r0.g1234567
pkgrel=4
pkgdesc="Fast system information fetcher written in zig"
arch=('x86_64' 'aarch64')
url="https://github.com/nuiipointerexception/${_pkgbase}"
license=('MIT')
depends=('glibc')
options=('!debug')
makedepends=('zig' 'git')
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd ${_pkgbase}
	git describe --long --tags --abbrev=7 --match="v*" HEAD 2>/dev/null |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		echo "0.1.1.r$(git rev-list --count HEAD).g$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd ${_pkgbase}
}

build() {
	cd ${_pkgbase}
	zig build \
		--summary all \
		-Doptimize=ReleaseFast \
		-Dcpu=native
}

package() {
	cd ${_pkgbase}
	install -Dm755 zig-out/bin/${_pkgbase} "${pkgdir}/usr/bin/${_pkgbase}"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgbase}/README.md"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgbase}/LICENSE"
} 
