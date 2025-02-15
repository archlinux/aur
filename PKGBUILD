# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=qBittorrent-ClientBlocker
pkgname="${_pkgname,,}"
pkgver=3.7
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
sha256sums=('3b774c0cb91dca5e2317944c3166608f73a7eff2bdcad0c74095a7cab277c26a'
            'c30c581577715838254ae7a5a07cd29df2fd75b9b59aefdb834906c5556f444e'
            'b419f001a0e45fa19776cd255170fd12ac19dc878683a98006ff53a6984bf417'
            '57f5a17c4a36b8fed9503e2ed1b6b60b43cd9f10fa249807a084de5744d7aed2'
            '6a136341031208f12adf1fc7a711f1f5af7519bd00635616b267c50f0a8eb843')

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
