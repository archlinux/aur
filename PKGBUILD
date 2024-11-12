# Maintainer: MYT1 <MYT1 at @ QQ com>

pkgname=tencent-docs-electron
_pkgname=腾讯文档
_pkgname1=tdappdesktop
pkgver=3.8.1
pkgrel=1
pkgdesc="Electron版腾讯文档 Tencent Docs - 让协作更高效，创作更轻松"
arch=("x86_64" "aarch64")
url="https://docs.qq.com/home/"

source=(
    "tencent-docs.sh"
)
depends=(
    "electron33"
)
source_x86_64=("${pkgname}-${pkgver}-${pkgrel}-x86_64.deb::https://docs.qq.com/api/package/get?channel_id=30001&version_id=${pkgver}&package_name=TencentDocs-x64.deb")
source_aarch64=("${pkgname}-${pkgver}-${pkgrel}-aarch64.deb::https://docs.qq.com/api/package/get?channel_id=30001&version_id=${pkgver}&package_name=TencentDocs-arm64.deb")


sha256sums=('291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_x86_64=('6d08eea5b2938bc6d07be1f6aa0ec618ebed2ce6e7e240f8bb22ed1b4a1f7237')
sha256sums_aarch64=('7ab7a0fc74aca6b750acb1439478b3477a7121eadd6a66a001cd4b81d2144793')

build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${_pkgname}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${_pkgname1}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-electron}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed '3s/.*/Exec=tdappdesktop %u/g' -i "${srcdir}/usr/share/applications/${_pkgname1}.desktop"
    sed '6s/.*/Icon=tdappdesktop/g' -i "${srcdir}/usr/share/applications/${_pkgname1}.desktop"
    mv "${srcdir}/opt/${_pkgname}/resources" "${srcdir}/opt/${_pkgname}/${_pkgname}"
}

package() {
    install -m755 -d "${pkgdir}/usr/lib/${_pkgname}"
    install -m755 -d "${pkgdir}/usr/share/doc/${_pkgname1}"
    install -Dm755 "${srcdir}/${pkgname%-electron}.sh" "${pkgdir}/usr/bin/${_pkgname1}"
    cp -r "${srcdir}/opt/${_pkgname}/${_pkgname}" -t "${pkgdir}/usr/lib"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname1}.desktop" -t "${pkgdir}/usr/share/applications"

    install -Dm644 "${srcdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname1}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
    install -Dm644  "${srcdir}/usr/share/doc/${_pkgname1}/changelog.gz" -t "${pkgdir}/usr/share/doc/${_pkgname1}"
    install -Dm644 "${srcdir}/usr/share/mime/packages/${_pkgname1}.xml" -t "${pkgdir}/usr/share/mime/${_pkgname1}"
}
