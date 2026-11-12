# Maintainer: markusressel <mail+archlinuxaur@markusressel.de>
#
# This file is maintained in https://github.com/markusressel/fan2go-tui/tree/main/packaging/aur/fan2go-tui
# and published to the AUR with packaging/aur/publish.sh (see RELEASING.md). Don't edit it on the AUR directly.
pkgname=fan2go-tui
pkgver=0.5.0
pkgrel=1
pkgdesc="Terminal UI for fan2go."
arch=('x86_64')
url="https://github.com/markusressel/fan2go-tui"
license=('AGPL3')
depends=('glibc')
makedepends=('go' 'just')
provides=("fan2go-tui")
conflicts=("fan2go-tui-git")
install=fan2go-tui.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/markusressel/fan2go-tui/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('90d0610bbf192814709d5aeaafcdfd99838116bd38aa744ea25409a0c688df3d')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	export GOFLAGS="-mod=readonly -modcacherw"
	go mod download
	mkdir -p bin/
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	# the release tarball contains no .git directory, so version and commit have to be passed explicitly.
	# make: releases up to 0.4.0 have no Justfile, later ones have a Makefile that forwards to the Justfile.
	make build VERSION="${pkgver}" GIT_REV="${pkgver}"
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./bin/fan2go-tui version
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dt "${pkgdir}/usr/bin" -m755 bin/fan2go-tui
	install -Dt "${pkgdir}/usr/share/${pkgname}" -m644 fan2go-tui.yaml
	install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE
}
