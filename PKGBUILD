# Maintainer: Donien <donien.96@hotmail.com>

pkgbase="icingadb"
pkgname=(
    "icingadb"
    "icingadb-migrate"
)
pkgver="1.4.0"
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
    "icingadb-migrate"
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
    "https://github.com/Icinga/${pkgbase}/archive/refs/tags/v${pkgver}.tar.gz"
    "icingadb.sysusers"
    "icingadb.service"
)
noextract=()
sha256sums=(
    "e244998da7c6f817fc590ca0852451a12fee4bc8fda8d3183c4f6c4df1ab38bd"
    "SKIP"
    "SKIP"
)



build() {
    cd "${srcdir}/${pkgbase}-${pkgver}"
    go build -buildvcs=false -trimpath -o icingadb ./cmd/icingadb
    go build -buildvcs=false -trimpath -o icingadb-migrate ./cmd/icingadb-migrate
}

package_icingadb() {
    install -dm700                                                     "${pkgdir}/etc/icingadb"
    install -Dm600 "${srcdir}/${pkgbase}-${pkgver}/config.example.yml" "${pkgdir}/etc/icingadb/config.yml"
    install -Dm755 "${srcdir}/${pkgbase}-${pkgver}/icingadb"           "${pkgdir}/usr/bin/icingadb"

    install -Dm644 "${srcdir}/icingadb.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgbase}.conf"
    install -Dm644 "${srcdir}/icingadb.service"  "${pkgdir}/usr/lib/systemd/system/${pkgbase}.service"

    install -Dm644 "${srcdir}/${pkgbase}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/icingadb/LICENSE"

    install -dm755 "${pkgdir}/usr/share/icingadb"
    cp -r "${srcdir}/${pkgbase}-${pkgver}/schema" "${pkgdir}/usr/share/icingadb/"
}

package_icingadb-migrate() {
    install -dm700                                                                     "${pkgdir}/etc/icingadb"
    install -Dm600 "${srcdir}/${pkgbase}-${pkgver}/doc/icingadb-migration.example.yml" "${pkgdir}/etc/icingadb/icingadb-migration.yml"
    install -Dm755 "${srcdir}/${pkgbase}-${pkgver}/icingadb-migrate"                   "${pkgdir}/usr/bin/icingadb-migrate"

    sed -i '1s|^|# Documentation: https://icinga.com/docs/icinga-db/latest/doc/06-Migration/#migration-from-ido\n\n|' "${pkgdir}/etc/icingadb/icingadb-migration.yml"

    install -Dm644 "${srcdir}/${pkgbase}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/icingadb-migrate/LICENSE"
}
