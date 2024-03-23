# Maintainer: Zosoled <zosoled@codecow.xyz>

pkgname=greenlight-git
pkgver=v2.2.1.r2.f71ee05
pkgrel=1
pkgdesc="Client for xCloud and Xbox home streaming."

arch=(x86_64)
url=https://github.com/unknownskl/greenlight
license=(MIT)
depends=(nodejs)
makedepends=(git yarn libxcrypt-compat)
provides=(${pkgname%-git}=${pkgver})
conflicts=(${pkgname%-git})

source=(
	${pkgname%-git}::git+https://github.com/unknownskl/greenlight.git
	LICENSE::https://raw.githubusercontent.com/unknownskl/greenlight/main-v2/LICENSE
)

sha512sums=(
	"SKIP"
	"7462e619774282261613b33196fbfd4840087a7e1b863cc039e217cea289bea7a3d0c1100c32e16168494ae3873b4c6ea2aacd6d62790450b12b39dba39039ae"
)

pkgver() {
	cd ${srcdir}/${pkgname%-git}
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd ${srcdir}/${pkgname%-git}
	git submodule update --init --recursive
	sed -i -e 's/- "AppImage"/# - "AppImage"/;s/- "deb"/# - "deb"/' electron-builder.yml
}

build() {
	cd ${srcdir}/${pkgname%-git}
	yarn
	yarn build
}

package() {
	install -dm755 ${pkgdir}/usr/lib/${pkgname%-git}
	cp -r ${srcdir}/${pkgname%-git}/dist/linux-unpacked/* ${pkgdir}/usr/lib/${pkgname%-git}

	install -dm755 ${pkgdir}/usr/bin
	ln -s /usr/lib/${pkgname%-git}/${pkgname%-git} ${pkgdir}/usr/bin/${pkgname%-git}

	install -Dm644 -t ${pkgdir}/usr/share/licenses/${pkgname%-git} LICENSE
}
