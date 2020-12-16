# Maintainer: Krystian Chachuła <krystian@krystianch.com>
pkgname=rtsp-simple-server-git
pkgver=r466.007cfb3
pkgrel=1
pkgdesc="Ready-to-use RTSP server and RTSP proxy that allows to read, publish and proxy video and audio streams"
arch=('any')
url="https://github.com/aler9/rtsp-simple-server"
license=('MIT')
groups=()
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+https://github.com/aler9/rtsp-simple-server"
        'rtsp-simple-server.service')
noextract=()
md5sums=('SKIP'
         '81b313c4715f2ec997c64aa47f75e444')

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
    install -Dm644 rtsp-simple-server.service "$pkgdir"/usr/lib/systemd/system/rtsp-simple-server.service

	cd "$srcdir/${pkgname%-git}"
    install -Dm755 build/${pkgname%-git} "$pkgdir"/usr/bin/${pkgname%-git}
    install -Dm644 rtsp-simple-server.yml "$pkgdir/etc/${pkgname%-git}/${pkgname%-git}.yml"
}
