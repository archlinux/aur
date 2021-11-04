# Maintainer: manvari <maxime.anvari+aur@gmail.com>
pkgname=fan2go-git
pkgver=0.0.18.r6.g0719fb2
pkgrel=2
pkgdesc="A simple daemon providing dynamic fan speed control based on temperature sensors"
arch=('x86_64')
url="https://github.com/markusressel/fan2go"
license=('AGPL3')
depends=('glibc' 'lm_sensors')
makedepends=('go' 'git')
provides=("fan2go")
conflicts=("fan2go")
source=('git://github.com/markusressel/fan2go'
	'fan2go.service')
sha256sums=('SKIP'
	'e9a9f1552fc039cb9dc9671490d4205198d7fb9bf6ec3911bf3dde1809259a08')

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
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o bin/fan2go main.go
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dt ${pkgdir}/usr/bin -m755 bin/fan2go
	install -Dt ${pkgdir}/usr/lib/systemd/system/ -m644 "${srcdir}/fan2go.service"
	install -Dt ${pkgdir}/usr/share/${pkgname%-git} -m644 fan2go.yaml
	install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE
}
