# Maintainer: hashworks <mail@hashworks.net>

pkgname=brickstrap-git
_pkgname="${pkgname%-git}"
pkgver=0.6.8.r4.ga48aea5
pkgrel=1
pkgdesc="Tool for turning Docker images into bootable image files for embedded systems"
url="https://github.com/ev3dev/brickstrap"
license=("MIT")
arch=("any")
conflicts=("${_pkgname}")
provides=("${_pkgname}")
depends=("docker" "libguestfs")
makedepends=("git" "pandoc")
optdepends=("qemu-arm-static: Build arm images (f.e. LEGO ev3 bricks)")
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
	cd "${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${_pkgname}"
	pandoc --standalone --to man docs/brickstrap.md > docs/brickstrap.1
	gzip -f docs/brickstrap.1
}

package() {
	install -Dm644 "${_pkgname}/docs/brickstrap.1.gz" "${pkgdir}/usr/share/man/man1/brickstrap.1.gz"
	install -Dm644 "${_pkgname}/COPYING.MIT" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.MIT"
	install -Dm755 "${_pkgname}/src/brickstrap.sh" "${pkgdir}/usr/bin/brickstrap"
}
