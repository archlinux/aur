# Maintainer: BryanLiang <liangrui.ch at gmail dot com>
# Contributor: huyz

# shellcheck disable=SC2034,SC2154,SC2164

pkgname=aliyunpan-go
pkgver=0.3.4
pkgrel=1
pkgdesc="阿里云盘命令行客户端，支持webdav文件服务，支持JavaScript插件，支持同步备份功能。"
arch=('x86_64' 'aarch64')
url='https://github.com/tickstep/aliyunpan'
license=('Apache-2.0')
conflicts=("${pkgname}-bin" "${pkgname}-git")
makedepends=('go')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fc657cc752c6818f6658ce46cb3931004f55b7bb536de25be56f80a756ecd911')

build() {
    cd "${pkgname%-go}-${pkgver}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export GOPATH="${srcdir}"

    go build -o ./aliyunpan-go -ldflags "-s -w -X main.Version=v$version"
}

package() {
    cd "${srcdir}/${pkgname%-go}-${pkgver}"
    install -Dm 755 aliyunpan-go "${pkgdir}/usr/bin/aliyunpan-go"
}
