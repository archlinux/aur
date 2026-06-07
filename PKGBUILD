# Maintainer: vyogami

pkgname=paruz-git
pkgver=1.1.5.r0.gff4fb6c
pkgrel=1
pkgdesc="A terminal UI (TUI) for the paru AUR helper (latest git)"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/Vyogami/paruz"
license=('MIT')
depends=('paru' 'pacman')
makedepends=('go' 'git')
provides=('paruz')
conflicts=('paruz' 'paruz-bin')
options=('!debug')
source=("${pkgname}::git+https://github.com/Vyogami/paruz.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	git describe --long --abbrev=7 --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
		|| printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"
	export CGO_ENABLED=0
	export GOFLAGS="-trimpath -mod=readonly -modcacherw"
	go build -ldflags "-s -w -X main.version=v${pkgver}" -o paruz ./cmd/paruz
}

package() {
	install -Dm755 "${srcdir}/${pkgname}/paruz" "${pkgdir}/usr/bin/paruz"
	install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
