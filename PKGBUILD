# Maintainer: ewen-lbh <hey@ewen.works>

pkgname=ortfo-git
pkgver=0.1.0.alpha.2.r28.g40b2dd0
pkgrel=1
pkgdesc="The GUI for ortfo, a portfolio manager (latest git commit)"
arch=('x86_64')
url="https://github.com/ortfo/gui"
license=("GPL-3.0")
depends=("gtk3" "webkit2gtk")
makedepends=("go" "git" "curl" "svg2png")
conflicts=("ortfo" "ortfo-bin")
provides=("ortfo")
source=("git+${url}")
sha256sums=("SKIP")

pkgver() {
	cd gui
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd gui
	which pnpm || curl -fsSL https://get.pnpm.io/install.sh | PNPM_VERSION=7.0.0-rc.8 sh -
	make setup
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
	for size in 16 32 48 64 128 256 512 1024; do
		svg2png -w $size -h $size public/assets/light-logo.svg ortfo.png
		install -Dm 644 ortfo.png -t "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
	done
	install -Dm 644 installers/ortfo.desktop "${pkgdir}/usr/share/applications/ortfo.desktop"
	install -Dm 755 ortfo -t "${pkgdir}/usr/bin"
	install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
