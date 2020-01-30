# Maintainer: Andy Kluger <https://t.me/andykluger>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Command line tool for the Semaphore CI service'
pkgname=semaphoreci-cli
pkgver=0.20.0
pkgrel=1
url=https://github.com/semaphoreci/cli
license=(Apache)
arch=(x86_64)
depends=()
makedepends=(go-pie git)
source=("${pkgname}::git+${url}#tag=v${pkgver}")
sha512sums=()
install=semaphoreci-cli.install

build () {
    cd "${pkgname}"

    local target_arch
    case ${CARCH} in
        x86_64) target_arch=amd64 ;;
        *)
            msg2 "Package not supported on ${CARCH}"
            exit 111
            ;;
    esac

    GOPATH="${srcdir}/_go" GOOS=linux GOARCH=${target_arch} \
        go build -ldflags "-s -w -X cmd.version=${pkgver}-arch" \
        -o semaphoreci

    chmod -R +w "${srcdir}/_go"  # Ugh.
}

package () {
    cd "${pkgname}"
    install -Dm755 -t "${pkgdir}/usr/bin" semaphoreci
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
