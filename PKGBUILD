# Contributor: taotieren <admin@taotieren.com>

pkgname=cloudflarespeedtest-git
pkgver=2.2.3.3.g1800c2e
pkgrel=1
pkgdesc="「自选优选 IP / 过滤假墙」测试 Cloudflare CDN 延迟和速度，获取最快 IP (IPv4+IPv6)！ "
arch=('any')
url="https://github.com/XIU2/CloudflareSpeedTest"
license=('GPLv3')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname%-git})
#replaces=(${pkgname})
depends=(go git)
optdepends=()
makedepends=('git')
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --tags | sed 's/^v//;s/-/./g'
}

prepare() {
    cd "${srcdir}/${pkgname%-git}"
    go mod tidy
    mkdir -p build/
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build
}

package() {
    cd "${srcdir}/${pkgname%-git}"

    install -Dm0755 build/CloudflareSpeedTest "${pkgdir}"/usr/share/${pkgname%-git}/${pkgname%-git}
    install -Dm0755 script/cfst_hosts.sh "${pkgdir}"/usr/share/${pkgname%-git}/cfst-hosts
    cp -rv *.txt "${pkgdir}"/usr/share/${pkgname%-git}/
    install -Dm0644 "${srcdir}/${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/CloudflareST" << EOF
#!/bin/sh

cd /usr/share/${pkgname%-git}/
./${pkgname%-git} "\$@"

EOF
    ln -sf /usr/share/${pkgname%-git}/cfst-hosts "${pkgdir}"/usr/bin/cfst-hosts
}
