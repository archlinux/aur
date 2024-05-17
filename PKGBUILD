# Maintainer: asjur <asjur at proton dot me>
pkgname=dbgate-beta-bin
pkgver=5.2.9
pkgrel=2
_electronversion=30
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
# https://github.com/dbgate/dbgate/releases/download/v5.2.9-beta.2/dbgate-5.2.9-beta.2-linux_x86_64.AppImage
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${_ghurl}/releases/download/v${pkgver}-beta.${pkgrel}/dbgate-${pkgver}-beta.${pkgrel}-linux_arm64.AppImage")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.AppImage::${_ghurl}/releases/download/v${pkgver}-beta.${pkgrel}/dbgate-${pkgver}-beta.${pkgrel}-linux_armv7l.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/v${pkgver}-beta.${pkgrel}/dbgate-${pkgver}-beta.${pkgrel}-linux_x86_64.AppImage")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/dbgate/dbgate/v${pkgver}-beta.${pkgrel}/LICENSE"
	"${pkgname%-bin}.sh"
)
sha256sums=('4ba7d897a31d45781b6bbc0b87e9a241873d61fff657af2f0c54608f652d235b'
            'beb56bb45d0f3c3bf5bfb269bdc039355ff59dbb28c4f427f219385dba455ad3')
sha256sums_aarch64=('6343d827f5e1897c5aaa238d13f16344e0ad657d9e7591821ae43e3b2bf31a65')
sha256sums_armv7h=('b79bf25951259bad22c630b3455eb4cd4bbc7bacb098f56e155ac96587516112')
sha256sums_x86_64=('ae93c54f1b03d70707930c36f114c8517d0b287949b754eeef23114df0bda3a2')
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
    # install -Dm644 "${srcdir}/squashfs-root/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
      install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-beta-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

