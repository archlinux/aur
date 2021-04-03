# Maintainer: nycex <nycex / cccp.org>
pkgname=zig-master-bin
pkgver=0.8.0_dev.1712+2f07d76ee
pkgrel=1
pkgdesc="robust, optimal, and clear programming language"
arch=('x86_64' 'aarch64')
url="https://ziglang.org/"
license=('MIT')
depends=()
makedepends=('jq' 'curl')
provides=('zig')
conflicts=('zig')
source=("https://ziglang.org/download/index.json")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}"
	if build_version="$(jq -r '.master.version' 'index.json' 2>/dev/null)" &&
		[ "${build_version}" != 'null' ]; then

		printf '%s' "${build_version//-/_}"
	else
		printf 'Error: Failed to parse index.json\n' >&2
		exit 1
	fi
}

build() {
	cd "${srcdir}"
	curl -O "https://ziglang.org/builds/zig-linux-${arch}-${pkgver//_/-}.tar.xz"
	tar xf "zig-linux-${arch}-${pkgver//_/-}.tar.xz"
}

package() {
	cd "${srcdir}/zig-linux-${arch}-${pkgver//_/-}"
	install -D zig "${pkgdir}/usr/bin/zig"
	install -D LICENSE "${pkgdir}/usr/share/licenses/zig/LICENSE"
	cp -r lib "${pkgdir}/usr"
	install -d "${pkgdir}/usr/share/doc"
	cp -r docs "${pkgdir}/usr/share/doc/zig"
}
