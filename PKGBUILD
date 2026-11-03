# Maintainer: taotieren <admin@taotieren.com>

pkgname=mothx
pkgver=1.3.106
pkgrel=1
pkgdesc="🚀 One Binary to Rule Them All — Your AI Coding Assistant in the Terminal"
arch=($CARCH)
url="https://github.com/oschina/mothx"
license=('MIT')
provides=(${pkgname} vibecoding)
conflicts=(${pkgname} vibecoding)
#replaces=(${pkgname})
depends=(
    sh
    bubblewrap
)
makedepends=(
    git
    go
    npm
    nodejs
)
optdepends=()
backup=()
options=('!debug')
#install=${pkgname}.install
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('a0e7847fb0b36bc3cb6fef4f1c186f3b153077f52cf296eb7a699f287358e607')

prepare() {
	git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    export GO111MODULE=on
    export GOPROXY=https://goproxy.cn,direct

    # mkdir -pv build/
    # go build -o build/${pkgname%-git} ./cmd/mothx
    make ui-install
    make ui-build
    make build
}

package() {
    cd "${srcdir}/${pkgname}"

    install -vDm755 bin/${pkgname} -t ${pkgdir}/usr/bin/
    install -vDm0644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    cp -R docs "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm0644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -sf /usr/bin/${pkgname} ${pkgdir}/usr/bin/vibecoding
}
