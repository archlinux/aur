# Maintainer: Adrian Lopez <zeioth@hotmail.com>
# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=linux-command-gpt-git
_pkgname=linux-command-gpt
pkgver=v0.1.2.r0.g952eee1
pkgrel=1
pkgdesc='Get Linux commands in natural language with the power of ChatGPT'
arch=('x86_64' 'aarch64')
url='https://github.com/asrul10/linux-command-gpt'
license=('MIT')
depends=('glibc')
makedepends=('go')
provides=('linux-command-gpt')
conflicts=('linux-command-gpt')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_pkgname}"
    # https://wiki.archlinux.org/index.php/Go_package_guidelines
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOPATH="${srcdir}/go"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o lcg
}

check() {
  cd "${_pkgname}"
  go test ./...
}

package() {
    cd "${_pkgname}"
    install -Dm755 "lcg" "${pkgdir}/usr/bin/lcg"
    install -Dm755 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

