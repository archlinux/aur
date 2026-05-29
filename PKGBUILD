# Maintainer: Wuxxin <wuxxin@gmail.com>

pkgname=signal-cli-rest-api-git
pkgver=0.99.r49.ge681092
pkgrel=1
pkgdesc="A small REST API around signal-cli (GIT version with patches for unix socket, token auth and polling support)"
arch=('x86_64' 'aarch64')
url="https://github.com/bbernhard/signal-cli-rest-api"
license=('MIT')
depends=('signal-cli')
makedepends=('go' 'git')
provides=('signal-cli-rest-api')
conflicts=('signal-cli-rest-api')
source=(
    "${pkgname}::git+https://github.com/bbernhard/signal-cli-rest-api.git"
    "signal-api.service"
    "signal-api.env"
    "polling-support.patch"
    "token-auth-and-unix-socket.patch"
)

sha256sums=(
    'SKIP'
    'f56566ef6c1138fc2cf1a789b7c1b49c63c9a5831368a3ca5468de6844d78c80'
    'd80fb0030270f710ca6567e35ff31366b0bf7926792a61afa174c887c9745be7'
    'bf9645023b0f23df716ddd5ae3dab241de8a8d9ddea0951f84a917e3cafdbdaa'
    '97a385f2f9be21f94fcb489f3f81eb71acf29be78a4dd50e1e288305b93b3fa7')

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "0.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd "${srcdir}/${pkgname}"
    patch -p1 -i "${srcdir}/polling-support.patch"
    patch -p1 -i "${srcdir}/token-auth-and-unix-socket.patch"
}

build() {
    cd "${srcdir}/${pkgname}/src"
    export CGO_ENABLED=0
    go build -trimpath -ldflags "-s -w" -o ../signal-cli-rest-api .
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm755 signal-cli-rest-api "${pkgdir}/usr/bin/signal-cli-rest-api"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "${srcdir}/signal-api.service" "${pkgdir}/usr/lib/systemd/user/signal-api.service"
    install -Dm644 "${srcdir}/signal-api.env" "${pkgdir}/usr/share/doc/${pkgname}/signal-api.env.example"
}
