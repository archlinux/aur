# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sqlui-native-bin
pkgver=3.1.9
pkgrel=1
pkgdesc="A simple UI client for most SQL Engines,supports most dialects of RMBDs and has limited supports for Cassandra,MongoDB,Redis,CockroachDB,Azure CosmosDB and Azure Storage Tab.(Prebuilt version)"
arch=('x86_64')
url="https://synle.github.io/sqlui-native"
_ghurl="https://github.com/synle/sqlui-native"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/synle/sqlui-native/v${pkgver}/LICENSE.md"
)
sha256sums=('97ba4b5bcfda0b9656dc8cb63eadb5afa163f80e8db5eee8abe7a48f56453f59'
            'a73494126f54d27c6155eecb8504842414b50317f84986eb1439fee7bb326099')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/Categories=/Categories=Development;/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	cp -a "${srcdir}/usr/lib" "${pkgdir}/usr/"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
