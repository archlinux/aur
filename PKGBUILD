# Maintainer: VanillaGreen <brad@vanillagreen.com>
pkgname=vsys-git
pkgver=0.9.0.r1.g6ccf2aa
pkgrel=1
pkgdesc="Terminal dashboard for Linux machines that run AI agents (tracks main)"
arch=('x86_64' 'aarch64')
url="https://github.com/vanillagreencom/vsys"
license=('MIT')
provides=('vsys')
conflicts=('vsys')
makedepends=('git' 'bun')
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
	bun build src/main.ts --compile --outfile vsys
}

package() {
	cd "${srcdir}/${pkgname}"
	install -Dm755 vsys "${pkgdir}/usr/bin/vsys"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
