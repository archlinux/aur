# Maintainer: KafCoppelia <k740677208@gmail.com>

pkgname=scopy-appimage
_disname=${pkgname%-appimage}
pkgver=2.0.0
pkgrel=1
pkgdesc="A software oscilloscope and signal analysis toolset."
arch=('x86_64' 'aarch64')
url="https://github.com/analogdevicesinc/scopy"
license=('GPL-3.0-only')
conflicts=('scopy-git')
depends=('zlib' 'hicolor-icon-theme' 'glibc')

if [ ${CARCH} = "aarch64" ]; then
    _arch="arm64"
else
    _arch=${CARCH}
fi

_ver=v${pkgver}
_zip=Scopy-${_ver}-Linux-${_arch}-AppImage.zip
source_x86_64=(
    ${url}/releases/download/${_ver}/${_zip}
    LICENSE::https://raw.githubusercontent.com/analogdevicesinc/scopy/main/LICENSE
)
source_aarch64=(
    ${url}/releases/download/${_ver}/${_zip}
    LICENSE::https://raw.githubusercontent.com/analogdevicesinc/scopy/main/LICENSE
)
sha256sums_x86_64=('8d5d4e26c3a98ef0f417d867e4c8c8911cafbc8a59e4983fb0bcf41e7083314e'
                   '589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2')
sha256sums_aarch64=('8d5d4e26c3a98ef0f417d867e4c8c8911cafbc8a59e4983fb0bcf41e7083314e'
                    '589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2')

options=('!strip')
noextract=(${_zip})
_appimage=Scopy-${_ver}-Linux-${_arch}.AppImage


prepare() {
    cd ${srcdir} && rm -rf "squashfs-root"
    bsdtar -xf ${_zip} --strip-components=1 -C ./
    chmod +x ${_appimage}
    ./${_appimage} --appimage-extract > /dev/null
    sed -i "/^Exec=/c\Exec=/usr/bin/${_disname} %U" "${srcdir}/squashfs-root/${_disname}.desktop"
}

package() {
    # AppImage
    install -Dm755 ${srcdir}/${_appimage} ${pkgdir}/opt/${pkgname}/${_disname}.AppImage
    
    # Desktop file
    install -Dm644 ${srcdir}/squashfs-root/${_disname}.desktop -t ${pkgdir}/usr/share/applications

    # Icon images
    install -Dm644 ${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${_disname}.png -t ${pkgdir}/usr/share/icons/hicolor/512x512/apps
    
    # Symlink executable
    install -dm755 ${pkgdir}/usr/bin && ln -sf /opt/${pkgname}/${_disname}.AppImage ${pkgdir}/usr/bin/${_disname}

    # License
    install -Dm644 ${srcdir}/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}
}
