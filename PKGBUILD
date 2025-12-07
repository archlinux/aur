# Maintainer: Wiktor Zykubek <dev at wzykubek dot xyz>
pkgname=gotmplfmt
pkgver=1.0.21
pkgrel=1
pkgdesc="Formatter for Go HTML templates."
arch=('x86_64' 'i686' 'pentium4' 'arm' 'armv7h' 'aarch64' 'riscv64')
license=('GPL-3.0')
url="https://github.com/miekg/gotmplfmt"
depends=('glibc')
makedepends=('go>=1.24')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/miekg/gotmplfmt/archive/v${pkgver}.tar.gz")
sha256sums=('7edba86b04ea5c746e71793fbca9563cf0bbea78b1ec274cc44c19efd8000d9b')

prepare() {
    cd "${pkgname}-${pkgver}"
    export GOPATH="${srcdir}"
    go mod download -modcacherw
}

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build ./...
}

check() {
    cd "${pkgname}-${pkgver}"
    go test ./...
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -d "${pkgdir}/usr/share/man/man1"
    gzip -9 < "${pkgname}.1" > "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
