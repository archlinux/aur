# Maintainer: ewen-lbh <hey@ewen.works>

pkgname=ortfo
pkgver=0.1.0.alpha.2
pkgrel=2
pkgdesc="The GUI for ortfo, a portfolio manager"
arch=('x86_64')
url="https://github.com/ortfo/gui"
license=("GPL-3.0")
depends=("gtk3" "webkit2gtk")
makedepends=("go" "git" "curl")
conflicts=("ortfo-git" "ortfo-bin")
provides=("ortfo")
source=("git+${url}")
sha256sums=("SKIP")

pkgver() {
	cd gui
	git describe --tags --abbrev=0 | sed 's/-/./g'
} 

prepare() {
	cd gui
	git checkout tags/v${pkgver/.alpha/-alpha}
	which pnpm || curl -fsSL https://get.pnpm.io/install.sh | PNPM_VERSION=7.0.0-rc.8 sh -
# Install frontend dependencies
	pnpm install || yarn install || npm install
# Install the statik tool
	go install github.com/rakyll/statik
# Prepare statik content
	mkdir -p dist/
	statik -f -src=dist/
# Install backend dependencies
	go mod tidy
}

build() {
	cd gui
	make
}

check() {
	cd gui
	# make test
}

package() {
	cd gui
	install -Dm 755 ortfo -t "${pkgdir}/usr/bin"
	install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
