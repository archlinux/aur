# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=qBittorrent-ClientBlocker
pkgname="${_pkgname,,}"
pkgver=3.7p2
pkgrel=1
pkgdesc="A client blocker compatible with qBittorrent/Transmission (Beta)/BitComet (Beta, Partial) which is prohibited to include but not limited to clients such as Xunlei."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/Simple-Tracker/qBittorrent-ClientBlocker"
license=("MIT")
backup=("etc/${pkgname}/blockList.json"
        "etc/${pkgname}/config.toml"
        "etc/${pkgname}/ipBlockList.txt")
makedepends=("go")
optdepends=('qbittorrent-nox: downloader'
            'transmission-cli: downloader'
            'bitcomet: downloader')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles"
        "${pkgname}.user.service")
sha256sums=('1fc4de1527287e970b92978a58cfb2d6692e652e71d5ee009835c35995a6906a'
            'ad67b1a1149fdc797e77786557b6bf2a66e0c34e0e622a593c95c6c617fa70d9'
            'b419f001a0e45fa19776cd255170fd12ac19dc878683a98006ff53a6984bf417'
            '57f5a17c4a36b8fed9503e2ed1b6b60b43cd9f10fa249807a084de5744d7aed2'
            '3ec6e39cdfceac6b58c75e995d2f41d15479a9b3f5f5e244ad4b5cfee8f7ac5f')

prepare() {
    cd "${_pkgname}-${pkgver}"
    cp -f config.toml config-user.sample.toml
    sed -e "s|logPath = \"logs\"|logPath = \"/var/log/qbittorrent-clientblocker\"|" \
        -i config.toml
    sed -e "s|logToFile = true|logToFile = false|" \
        -e "s|checkUpdate = true|checkUpdate = false|" \
        -i config.toml config-user.sample.toml
}

build() {
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    local ldflags="-s -w -linkmode external -X main.programVersion=${pkgver} -extldflags '${LDFLAGS}'"

    cd "${_pkgname}-${pkgver}"
    go build -trimpath -ldflags="${ldflags}" -o "${pkgname}" .
}

package() {
    install -Dm644 "${pkgname}.service"      "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.sysusers"     "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.tmpfiles"     "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.user.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"

    cd "${_pkgname}-${pkgver}"
    install -Dm755 "${pkgname}"              "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "config.toml"             "${pkgdir}/etc/${pkgname}/config.toml"
    install -Dm644 "config-user.sample.toml" "${pkgdir}/usr/share/${pkgname}/config-user.sample.toml"
    install -Dm644 "blockList.json"          "${pkgdir}/etc/${pkgname}/blockList.json"
    install -Dm644 "blockList.json"          "${pkgdir}/usr/share/${pkgname}/blockList.json"
    install -Dm644 "ipBlockList.txt"         "${pkgdir}/etc/${pkgname}/ipBlockList.txt"
    install -Dm644 "ipBlockList.txt"         "${pkgdir}/usr/share/${pkgname}/ipBlockList.txt"
    install -Dm644 "LICENSE"                 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README*.md             -t "${pkgdir}/usr/share/doc/${pkgname}"
}
