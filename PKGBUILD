# Maintainer: VanillaGreen <brad@vanillagreen.com>
pkgname=vsys-git
pkgver=0.10.0.r47.g9d3dca8
pkgrel=1
pkgdesc="Terminal dashboard for Linux machines that run AI agents (tracks main)"
arch=('x86_64' 'aarch64')
url="https://github.com/vanillagreencom/vsys"
license=('MIT')
depends=('python' 'systemd-libs')
provides=('vsys')
conflicts=('vsys')
makedepends=('git' 'bun')
options=('!strip' '!debug')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	git describe --long --tags --abbrev=7 2>/dev/null |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "0.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"
	bun install --frozen-lockfile
	bun run compile
}

package() {
	cd "${srcdir}/${pkgname}"
	install -Dm755 vsys "${pkgdir}/usr/bin/vsys"
	packaging/stage-runtime-files.sh "${pkgdir}/usr"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
