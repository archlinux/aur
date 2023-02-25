# Maintainer: Gnarflord <aur@gnarf.link>
pkgname=mqtt2prometheus
_pkgname=mqtt2prometheus
pkgver=v0.1.7.4.gc9296a9
pkgrel=3
pkgdesc="Prometheus exporter that can be used to scrape topics from MQTT"
arch=("x86_64" "i686" "armv6h" "armv7h" "aarch64")
url="https://github.com/hikhvar/mqtt2prometheus"
license=("MIT")
makedepends=("git" "go")
source=("${_pkgname}::git+https://github.com/hikhvar/mqtt2prometheus.git"
        "mqtt2prometheus.service"
        "sysusers.conf")
sha256sums=("SKIP"
        86e4168f3eff691984630b47464aa0c87d3a8a94330c7d18ccc7d0aebcf8c95c
        f3df0c3edd39c0e93b282f493c2a113da71ab0b07768c71db0365a60b3c267c1
)

pkgver() {
    cd ${srcdir}/${_pkgname}

    git describe --always --tags | sed "s|-|.|g"
}

prepare() {
    cd "${srcdir}/${_pkgname}"

    export GOPATH="${srcdir}/gopath"
    go get -d ./...
}

build() {
    cd "${srcdir}/${_pkgname}"

    export GOPATH="${srcdir}/gopath"
    go build\
      -trimpath \
      -buildmode=pie \
      -mod=readonly \
      -modcacherw \
      --ldflags "-extldflags "static"" \
      -o bin/mqtt2prometheus ./cmd

    go clean -modcache
}

package() {
    backup=("etc/${_pkgname}/config.yaml")
    cd "${srcdir}/${_pkgname}"

    install -Dm0755 "bin/mqtt2prometheus" "${pkgdir}/usr/bin/mqtt2prometheus"

    install -Dm0644 "${srcdir}/mqtt2prometheus.service" "${pkgdir}/usr/lib/systemd/system/mqtt2prometheus.service"
    install -Dm0644 "${srcdir}/sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/mqtt2prometheus.conf"

    install -Dm0644 "config.yaml.dist" "${pkgdir}/etc/${pkgname}/config.yaml"
}
