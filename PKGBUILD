# Maintainer: pika02 <pikakolendo02 at gmail dot com>

_pkgname='imfile-desktop'
_Pkgname='imfile'
pkgname='imfile-appimage'
pkgver=2.3.4
pkgrel=1
pkgdesc='A full-featured download manager, forked from Motrix (AppImage version)'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/imfile-io/imfile-desktop'
license=('MIT')
options=(!strip !debug)
depends=('fuse2' 'hicolor-icon-theme')
provides=('motrix' 'imfile')
conflicts=('imfile' 'imfile-bin')

_baseurl="${url}/releases/download/v${pkgver}"
source_x86_64=("${_Pkgname}-${pkgver}-x86_64.AppImage::${_baseurl}/imFile-${pkgver}.AppImage")
source_aarch64=("${_Pkgname}-${pkgver}-aarch64.AppImage::${_baseurl}/imFile-${pkgver}-arm64.AppImage")
source_armv7h=("${_Pkgname}-${pkgver}-armv7h.AppImage::${_baseurl}/imFile-${pkgver}-armv7l.AppImage")

sha256sums_x86_64=('e232d11e512d8831c0a31d968612979e2d338addff7f7169ea8ef6a8fb7ff628')
sha256sums_aarch64=('1cf5e7612edfbe01f238e3ef49d8c32f9c0cb798cea92c1f7de5b70695202406')
sha256sums_armv7h=('60a48b0c2e3a2b42f18282442b2c82aa55c56f7bf68932cc64fe0270b5746def')

_appimage="${_Pkgname}-${pkgver}-${CARCH}.AppImage"
noextract=("${_appimage}")

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

package() {
# 安装原始 AppImage
install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

# 修复桌面文件
sed -i \
    -e "s|Exec=AppRun|Exec=/usr/bin/${pkgname}|" \
    -e "s|Icon=.*|Icon=imfile|" \
    "${srcdir}/squashfs-root/imfile.desktop"

# 桌面集成
install -Dm644 "${srcdir}/squashfs-root/imfile.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

# 图标处理
install -d "${pkgdir}/usr/share/icons"
cp -R "${srcdir}/squashfs-root/usr/share/icons/hicolor" "${pkgdir}/usr/share/icons/"
find "${pkgdir}/usr/share/icons/hicolor" -type d -exec chmod 755 {} \;
find "${pkgdir}/usr/share/icons/hicolor" -type f -exec chmod 644 {} \;

# 创建启动器脚本
install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<EOF
#!/bin/sh
exec /opt/${pkgname}/${pkgname}.AppImage "\$@"
EOF

# 许可证文件
install -Dm644 "${srcdir}/squashfs-root/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
# MIME类型处理
install -Dm644 "${srcdir}/squashfs-root/usr/share/mime/imfile.xml" \
-t "${pkgdir}/usr/share/mime/packages/"
}

post_install() {
update-mime-database /usr/share/mime
}

post_upgrade() {
post_install
}
