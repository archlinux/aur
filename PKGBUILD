# Maintainer: markusressel <mail+archlinuxaur@markusressel.de>
#
# This file is maintained in https://github.com/markusressel/fan2go/tree/master/packaging/aur/fan2go
# and published to the AUR with packaging/aur/publish.sh (see RELEASING.md). Don't edit it on the AUR directly.
pkgname=fan2go
pkgver=0.16.0
pkgrel=1
pkgdesc="A simple daemon providing dynamic fan speed control based on temperature sensors"
arch=('x86_64' 'aarch64')
url="https://github.com/markusressel/fan2go"
license=('AGPL3')
depends=('glibc' 'lm_sensors')
makedepends=('go')
optdepends=('libnotify: desktop notifications on errors'
            'nvidia-utils: NVIDIA GPU fan and temperature support')
provides=("fan2go")
conflicts=("fan2go-git")
install=fan2go.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/markusressel/fan2go/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e881bb284a5a5a4a55bef631c165a94065daf8782eafd98463d2792abc734f4f')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	export GOFLAGS="-mod=readonly -modcacherw"
	go mod download
	mkdir -p bin/
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	# causes issues with nvml
	# export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	# causes issues with nvml
	# export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	# the release tarball contains no .git directory, so version and commit have to be passed explicitly
	make build VERSION="${pkgver}" GIT_REV="${pkgver}"
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./bin/fan2go version
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dt "${pkgdir}/usr/bin" -m755 bin/fan2go
	install -Dt "${pkgdir}/usr/lib/systemd/system/" -m644 fan2go.service
	install -Dt "${pkgdir}/usr/share/${pkgname}" -m644 fan2go.yaml
	install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE
}
