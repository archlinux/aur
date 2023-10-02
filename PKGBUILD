# Maintainer: John Ramsden <johnramsden [at] riseup [dot] net>

pkgname=zrepl
pkgver=0.6.1
pkgrel=1
pkgdesc='One-stop ZFS backup & replication solution'
arch=('x86_64')
url='https://zrepl.github.io/'
license=('MIT')
provides=('zrepl')
conflicts=('zrepl-bin')
makedepends=('go')
source=("https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('263c82501b75a1413f8a298c1d67d7e940c1b0cb967979790773237e2a30adbd')

zrepl_version="arch-${pkgver}"

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    GO_LDFLAGS="-X github.com/zrepl/zrepl/version.zreplVersion=${zrepl_version}"

    cd "${pkgname}-${pkgver}"
    go build \
        -ldflags "${GO_LDFLAGS} -linkmode=external -extldflags ${LDFLAGS}" \
        -o "${pkgname}" .
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d "${pkgdir}/usr/share/${pkgname}"
    install -d "${pkgdir}/usr/lib/systemd/system"
    install -d "${pkgdir}/usr/share/bash-completion/completions"
    install -d "${pkgdir}/usr/share/zsh/site-functions"

    install -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -m644 "dist/systemd/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    cp -r "config/samples" "${pkgdir}/usr/share/${pkgname}/samples"

    "${pkgdir}/usr/bin/${pkgname}" gencompletion zsh "${pkgdir}/usr/share/zsh/site-functions/_zrepl"
    "${pkgdir}/usr/bin/${pkgname}" gencompletion bash "${pkgdir}/usr/share/bash-completion/completions/zrepl"

    sed -i s:/usr/local/bin/:/usr/bin/:g "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
