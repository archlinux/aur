# Maintainer: Donien <donien.96@hotmail.com>

pkgname="icingadb"
pkgver="1.2.0"
pkgrel=1
epoch=0
pkgdesc="Icinga configuration and state database supporting multiple environments"
arch=(
    "x86_64"
    "aarch64"
)
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
changelog="icingadb.changelog"
source=(
    "https://github.com/Icinga/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
    "icingadb.sysusers"
    "icingadb.service"
)
noextract=()
sha256sums=(
    "f3452f796a471e848c2e51d2820444df8907be7f972cdd139e2abcd6f66a4890"
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
