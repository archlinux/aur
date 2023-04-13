# Maintainer: Adrian Lopez <zeioth@hotmail.com>
# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=linux-command-gpt
pkgver=0.1.3
pkgrel=7
pkgdesc='Get Linux commands in natural language with the power of ChatGPT'
arch=('x86_64' 'aarch64')
url='https://github.com/asrul10/linux-command-gpt'
license=('MIT')
depends=('glibc')
makedepends=('go')
conflicts=('linux-command-gpt-git')
source=("git+${url}#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${pkgname}"
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
  cd "${pkgname}"
  go test ./...
}

package() {
    cd "${pkgname}"
    install -Dm755 "lcg" "${pkgdir}/usr/bin/lcg"
    install -Dm755 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

