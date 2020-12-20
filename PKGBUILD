# Maintainer: Krystian Chachuła <krystian@krystianch.com>
pkgname=prometheus-bsbmp-exporter-git
pkgver=r40.31a6756
pkgrel=1
pkgdesc="Prometheus exporter for Bosch Sensortec temperature, atmospheric pressure and humidity sensors"
arch=('x86_64' 'armv7h')
url="https://github.com/David-Igou/bsbmp-exporter"
license=('MIT')
makedepends=('go' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=('etc/conf.d/prometheus-bsbmp-exporter')
source=("${pkgname%-git}::git+$url"
        "${pkgname%-git}.conf"
        "${pkgname%-git}.service")
md5sums=('SKIP'
         '28bc78c950218c5607986aa390c1400e'
         '14cb12ea4139bac88043d94c77d6bc11')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
    mkdir -p build/
}

build() {
	cd "$srcdir/${pkgname%-git}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build .
}

package() {
    install -Dm644 ${pkgname%-git}.conf "$pkgdir"/etc/conf.d/${pkgname%-git}
    install -Dm644 ${pkgname%-git}.service "$pkgdir"/usr/lib/systemd/system/${pkgname%-git}.service

	cd "$srcdir/${pkgname%-git}"
    install -Dm755 build/bsbmp-exporter "$pkgdir"/usr/bin/${pkgname%-git}
}
