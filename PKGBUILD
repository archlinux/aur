# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sqlui-native-bin
pkgver=1.62.22
_electronversion=20
pkgrel=5
pkgdesc="A simple UI client for most SQL Engines,supports most dialects of RMBDs like MySQL, Microsoft SQL Server, Postgres, SQLite and has limited supports for Cassandra, MongoDB, Redis, CockroachDB, Azure CosmosDB and Azure Storage Tab"
arch=("x86_64")
url="https://synle.github.io/sqlui-native/"
_ghurl="https://github.com/synle/sqlui-native"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}-bin"
    'hicolor-icon-theme'
)
source=(
    "${pkgname%-bin}-${pkgver}.pacman::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}.pacman"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/synle/sqlui-native/${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('0975f884cd6b7340eed9e091db73fd93fbbf4a166f65843225fe672cc3f022de'
            'a73494126f54d27c6155eecb8504842414b50317f84986eb1439fee7bb326099'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    sed "s|/opt/${pkgname%-bin}/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}