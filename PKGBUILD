# Maintainer: Sergey Shatunov <me@aur.rocks>
# Contributor: solopasha <daron439 at gmail dot com>

pkgname=torrserver-git
_pkgname="${pkgname%-git}"
pkgver=132.2.r4.g65e08eb
pkgrel=2
pkgdesc="Torrent stream server"
arch=('x86_64' 'armv7h' 'aarch64' 'i686')
url="https://github.com/YouROK/TorrServer"
license=("GPL3")
provides=("$_pkgname=${pkgver%%.*}")
conflicts=("$_pkgname")
depends=("glibc" "gcc-libs")
makedepends=("git" "go" "yarn" "npm")
options=(!lto)
source=("${pkgname}::git+${url}.git"
        "torrserver.service")
install=torrserver.install
sha512sums=('SKIP'
            'f60b5d39214d0ef26598effcbdcda63cfa751a39ebc0fe63f615779a5d8990b9727f3c606e8bbf7718a798ba92b54ae3fa01b73feb427d243ef358c2e328b08a')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^MatriX\.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    env -C "$srcdir/$pkgname/web" yarn install --ignore-scripts --no-fund --cache "$srcdir/yarn"
    env -C "$srcdir/$pkgname/server" go mod tidy
}

build() {
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
           CGO_CPPFLAGS="${CPPFLAGS}" \
           CGO_CFLAGS="${CFLAGS}" \
           CGO_CXXFLAGS="${CXXFLAGS}" \
           CGO_LDFLAGS="${LDFLAGS}" \
           CGO_ENABLED=1

    env -C "$srcdir/$pkgname/web" UV_USE_IO_URING=0 NODE_OPTIONS=--openssl-legacy-provider yarn run build --no-fund --cache "${srcdir}/yarn"
    env -C "$srcdir/$pkgname" go run gen_web.go
    env -C "$srcdir/$pkgname/server" go build -o "$_pkgname" ./cmd
}
package() {
    install -Dm755 "${pkgname}/server/$_pkgname" -t "${pkgdir}/usr/bin"
    install -Dm644 "torrserver.service" -t "${pkgdir}/usr/lib/systemd/user"
}
