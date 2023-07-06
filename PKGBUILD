# Maintainer: Simon Mangel <simon dot mangel dot sm at gmail dot com>

_pkgname="miniMover (CLI only)"
pkgname="minimover-git"
pkgver=e7da9d3
pkgrel=1
pkgdesc="This is a project that lets you send GCode to an XYZ da Vinci prniter."
arch=("x86_64")
url="https://github.com/reality-boy/miniMover"
license=("MIT")
depends=("glibc" "gcc-libs")
makedepends=('git')
source=("git+https://github.com/reality-boy/miniMover.git#branch=master")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}"/miniMover
	printf %s $(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}"/miniMover/miniMoverConsole
  sed -i 's/\(LDFLAGS *= *\)/\1-Wl,-z,relro,-z,now /' Makefile # Enable full RELRO
  make
}

package() {
  cd "${srcdir}"/miniMover/miniMoverConsole
  install -Dm755 minimover "${pkgdir}"/usr/bin/minimover

  cd "${srcdir}"/miniMover/docs
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

}