# Maintainer: taotieren <admin@taotieren.com>

pkgname=go-aliddns-git
pkgver=r25.1109de0
pkgrel=11
pkgdesc="用 golang 实现 aliddns，同时对 certbot 进行 txt 信息更新提交"
arch=(x86_64
    aarch64
    riscv64)
url="https://github.com/N-O-S-T/go-aliddns"
license=('unknow')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
#replaces=(${pkgname})
depends=()
optdepends=()
makedepends=(git
    go)
backup=(etc/go-aliddns/config.yaml)
options=()
#install=${pkgname}.install
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
#     git describe --tags | sed 's/^v//;s/-/./g'
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare()
{
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    mkdir -pv build/
    go build -o build
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm755 build/${pkgname%-git} -t ${pkgdir}/usr/bin/
#     install -Dm0644 "${srcdir}/${pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm0644 "${srcdir}/${pkgname}/config.yaml" -t "${pkgdir}/etc/go-aliddns/"
    cp -rv "${srcdir}/${pkgname}/usr"  "${pkgdir}/"
}
