# Maintainer: markusressel <mail+archlinuxaur@markusressel.de>
pkgname=fan2go-git
pkgver=0.9.2.r68.g5bc5dd3
pkgrel=1
pkgdesc="A simple daemon providing dynamic fan speed control based on temperature sensors"
arch=('x86_64')
url="https://github.com/markusressel/fan2go"
license=('AGPL3')
depends=('glibc' 'lm_sensors')
makedepends=('go' 'git')
provides=("fan2go")
conflicts=("fan2go")
source=('git+https://github.com/markusressel/fan2go')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	go mod tidy
	mkdir -p bin/
}

build() {
	cd "$srcdir/${pkgname%-git}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	# causes issues with nvml
	# export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	# causes issues with nvml
	# export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	make build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dt ${pkgdir}/usr/bin -m755 bin/fan2go
	install -Dt ${pkgdir}/usr/lib/systemd/system/ -m644 fan2go.service
	install -Dt ${pkgdir}/usr/share/${pkgname%-git} -m644 fan2go.yaml
	install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE
}
