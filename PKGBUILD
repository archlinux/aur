# Maintainer : Sauyon Lee <sauyonl@sauyon.com>
# Contributor : Martin Wimpress <code@flexion.org>

pkgname=syncthing-git
pkgver=0.11.8.r13.g983d7ec
pkgrel=1
pkgdesc="Open Source Continuous Replication / Cluster Synchronization Thing"
url="http://syncthing.net/"
license=('MIT')
makedepends=('git' 'go' 'godep' 'inetutils')
conflicts=('syncthing')
provides=('syncthing')
arch=('i686' 'x86_64')
source=("$pkgname::git+https://github.com/syncthing/syncthing.git"
        "syncthing@.service"
				"syncthing.1")
sha256sums=('SKIP'
            '2b8ae688a7d60be7899b6124591804eacca7dd29e980d3eaa8a28b0f7a28ac44'
            'fb59747ca16d1b19e3cad1c147dcabea14a30a5e4177b90712e6bb837c107912')
install=${pkgname}.install

pkgver() {
	cd "${srcdir}/${pkgname}"
	git describe --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	export GOPATH="${srcdir}"
	mkdir -p "src/github.com/syncthing"
	mv "${pkgname}" "src/github.com/syncthing/syncthing"
}

build() {
	export GOPATH="${srcdir}"
	cd "${srcdir}/src/github.com/syncthing/syncthing"
	./build.sh "" -tags noupgrade
}

check() {
	export GOPATH="${srcdir}"
	cd "${srcdir}/src/github.com/syncthing/syncthing"
	./build.sh test
}

package() {
	cd "${srcdir}"
	install -Dm644 syncthing@.service "${pkgdir}/usr/lib/systemd/system/syncthing@.service"
	install -Dm644 syncthing.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"

	cd "${srcdir}/src/github.com/syncthing/syncthing"
	install -Dm755 bin/syncthing "${pkgdir}/usr/bin/syncthing"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/syncthing/README.md"
}
