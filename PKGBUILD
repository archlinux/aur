# Maintainer: asjur <asjur at proton dot me>
pkgname=dbgate-beta-bin
pkgver=5.2.8
pkgrel=10
_electronversion=25
pkgdesc="Database manager for MySQL, PostgreSQL, SQL Server, MongoDB, SQLite and others. Runs under Windows, Linux, Mac or as web application"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://dbgate.org/"
_ghurl="https://github.com/dbgate/dbgate"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}-bin"
    'hicolor-icon-theme'
)
makedepends=(
    'fuse2'
)
# https://github.com/dbgate/dbgate/releases/download/v5.2.8-beta.10/dbgate-5.2.8-beta.10-linux_x86_64.AppImage
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${_ghurl}/releases/download/v${pkgver}-beta.${pkgrel}/dbgate-${pkgver}-beta.${pkgrel}-linux_arm64.AppImage")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.AppImage::${_ghurl}/releases/download/v${pkgver}-beta.${pkgrel}/dbgate-${pkgver}-beta.${pkgrel}-linux_armv7l.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/v${pkgver}-beta.${pkgrel}/dbgate-${pkgver}-beta.${pkgrel}-linux_x86_64.AppImage")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/dbgate/dbgate/v${pkgver}-beta.${pkgrel}/LICENSE"
	"${pkgname%-bin}.sh"
)
sha256sums=('4ba7d897a31d45781b6bbc0b87e9a241873d61fff657af2f0c54608f652d235b'
            'beb56bb45d0f3c3bf5bfb269bdc039355ff59dbb28c4f427f219385dba455ad3')
sha256sums_aarch64=('dd602ab4106b7cbb5cee3115ab65e7dfe9e9672f8e34aac92d5e4c92bf7bda87')
sha256sums_armv7h=('aae363642f3c02be45f8e8241c7797f8bbbdd47328b43ee6e9f6ebd1f751e526')
sha256sums_x86_64=('a33d748090d50aebc19533e4a2101b83fe8e36d18c977a4fd92228c204fec127')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox|${pkgname%-beta-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-beta-bin}.desktop"
    sed -i "s|Name=DbGate|Name=DbGate Beta|g" "${srcdir}/squashfs-root/${pkgname%-beta-bin}.desktop"
    sed -i "s|${pkgname%-bin}|${pkgname%-beta-bin}|g" "${srcdir}/squashfs-root/${pkgname%-beta-bin}.desktop"
    sed -i "s|Exec=${pkgname%-beta-bin}|Exec=${pkgname%-bin}|g" "${srcdir}/squashfs-root/${pkgname%-beta-bin}.desktop"
    mv "${srcdir}/squashfs-root/${pkgname%-beta-bin}.desktop" "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
      install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-beta-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

