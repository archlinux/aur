# Maintainer: Donien <donien.96@hotmail.com>

pkgname="icingadb"
pkgver="1.1.1"
pkgrel=1
epoch=0
pkgdesc="Icinga configuration and state database supporting multiple environments"
arch=("x86_64")
url="https://github.com/Icinga/icingadb"
license=("GPL")
groups=()
depends=()
makedepends=(
    "go"
)
optdepends=()
provides=(
    "icingadb"
)
conflicts=()
replaces=()
backup=(
    "etc/icingadb/config.yml"
)
options=()
install="icingadb.install"
changelog=
source=(
    "https://github.com/Icinga/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
    "icingadb.sysusers"
    "icingadb.service"
)
noextract=()
sha256sums=(
    "8f4246765dc364917170905e38b01c62a6c44eab7d333c131fc46691a47c150a"
    "SKIP"
    "SKIP"
)



build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    pwd
    go build -buildvcs=false -trimpath -o icingadb cmd/icingadb/main.go
}

package() {
    pwd
    install -dm700                                                     "${pkgdir}/etc/icingadb"
    install -Dm600 "${srcdir}/${pkgname}-${pkgver}/config.example.yml" "${pkgdir}/etc/icingadb/config.yml"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/icingadb"           "${pkgdir}/usr/bin/icingadb"

    install -Dm644 "${srcdir}/icingadb.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${srcdir}/icingadb.service"  "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/icingadb/LICENSE"

    install -dm755 "${pkgdir}/usr/share/icingadb"
    cp -r "${srcdir}/${pkgname}-${pkgver}/schema" "${pkgdir}/usr/share/icingadb/"
}
