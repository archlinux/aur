# Maintainer: Glucy2 <glucy-2@outlook.com>
# Contributor: rubin55 <me@rubin55.org>

_pkgname=neo4j-community
pkgname=${_pkgname}-bin
pkgver="2026.10.0"
pkgrel="1"
pkgdesc='A fully transactional graph database implemented in Java (binary package)'
license=('GPL-3.0-only')
arch=('any')
url="https://neo4j.com/deployment-center/#panel7"
_min_java_version="21"
depends=("java-runtime>=$_min_java_version" "psmisc")
provides=("${_pkgname}" "${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" neo4j-enterprise)
source=(
    "https://dist.neo4j.org/deb/neo4j_${pkgver}_all.deb"
    "neo4j.sysusers"
    "neo4j.tmpfiles"
)
# https://dist.neo4j.org/deb/neo4j_${pkgver}_all.deb.sha256
sha256sums=('44280a6be377f84c5eaa02541be07bd23dcd006c46c1d64b78930ef844bcd595'
            '440874201629f436b3817be05d7f8240c9bef603a11dc0a125634287c0376b5d'
            'a4a12084b93c357adfc54d1c0736d710ff507418824e08e33cc1f30bdc8a67f8')

package() {
    local data_archives=()
    local archive
    for archive in data.tar.xz data.tar.zst data.tar.gz; do
        [[ ! -f "$archive" ]] || data_archives+=("$archive")
    done
    if (( ${#data_archives[@]} != 1 )); then
        printf '%s\n' 'Expected exactly one data.tar.{xz,zst,gz}' >&2
        return 1
    fi
    bsdtar -xf "${data_archives[0]}" -C "${pkgdir}"
    install -Dm644 "$srcdir/neo4j.sysusers" "$pkgdir/usr/lib/sysusers.d/neo4j.conf"
    install -Dm644 "$srcdir/neo4j.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/neo4j.conf"
}
