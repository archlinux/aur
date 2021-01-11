pkgname=openpomodoro
provides=("pomodoro")
pkgver=0.2.1
pkgrel=1
pkgdesc='A command-line Pomodoro tracker which uses the Open Pomodoro Format'
arch=('x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/open-pomodoro/openpomodoro-cli"
makedepends=("go" "git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('5f1dda7e2fdfdf9fbdb851449eb40220ac7195cd9354d81923ba50c3ffa2530d')

build() {
    cd "${pkgname}-cli-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

		go get ./...
    go build -o ${pkgname} -ldflags "-extldflags ${LDFLAGS} -s -w -X main.version=${pkgver}" main.go
}

package() {
    install -Dm755 "${pkgname}-cli-${pkgver}/pomodoro" ${pkgdir}/usr/bin/pomodoro
}
