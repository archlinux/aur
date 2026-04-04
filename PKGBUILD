# Maintainer: John Ramsden <johnramsden [at] riseup [dot] net>
# Maintainer: allddd <me (at) allddd (dot) onl>

pkgname=zrepl
pkgver=0.7.0
pkgrel=2
pkgdesc='One-stop ZFS backup & replication solution'
arch=('x86_64')
url="https://${pkgname}.github.io"
license=('MIT')
makedepends=('go')
provides=("${pkgname}")
conflicts=("${pkgname}")
backup=("etc/${pkgname}/${pkgname}.yml")
source=("https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d451ad1d05a0afdc752daf1dada9327aa338f691eca91e1c8fc9828eebd89757')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    GOPATH="${srcdir}" go mod download -modcacherw
    sed -i 's|/usr/local/bin|/usr/bin|g' "./dist/systemd/${pkgname}.service"
    sed -i "s|USR_SHARE_ZREPL|/usr/share/doc/${pkgname}|g" ./packaging/systemd-default-zrepl.yml
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    CGO_ENABLED=0 GOPATH="${srcdir}" go build -trimpath -modcacherw -buildmode=pie -buildvcs=false -mod=readonly \
        -ldflags "-s -w -X github.com/zrepl/zrepl/internal/version.zreplVersion=v${pkgver} -buildid=" \
        -o "${pkgname}" ./
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    CGO_ENABLED=0 GOPATH="${srcdir}" go test -mod=readonly ./...
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 "./${pkgname}" -t "${pkgdir}/usr/bin/"
    install -Dm644 "./dist/systemd/${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 ./packaging/systemd-default-zrepl.yml "${pkgdir}/etc/${pkgname}/${pkgname}.yml"
    install -Dm644 ./LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
    cp -a ./internal/config/samples "${pkgdir}/usr/share/doc/${pkgname}/examples"
    "${pkgdir}/usr/bin/${pkgname}" gencompletion bash /dev/stdout | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
    "${pkgdir}/usr/bin/${pkgname}" gencompletion zsh /dev/stdout | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}

# vim: ts=4 sw=4 et:
