# Maintainer: Nathan Robinson <nrobinson2000 at me dot com>

pkgname=pvr-tex-tool-bin
pkgver=2020.2
_versionstr='2020_R2'
pkgrel=7

pkgdesc="A comprehensive texture processing and compression tool with support for PVR textures."
url="https://www.imaginationtech.com/developers/powervr-sdk-tools/pvrtextool/"

arch=('x86_64')
options=('!strip')
license=('custom')

source=("install.run::https://cdn.imgtec.com/sdk/OFFLINE/PVRTexToolSetup-${_versionstr}.run-x64"
"LICENSE"
"PVRTexTool.desktop")

sha256sums=('5f6bea49943e52d2f59541efca0bce8c1f841f9a5baf1a193c94cd0e1fcb4a31'
            '73479399ac54ac4675d6db8f1387bcc0092896d503803ec573cf0560280dc707'
            '993d3b02d822ad2b87feae194740d1eda4293375d8e82c9455cc5ec5dcdb1444')

# discovered with namcap(1)
depends=(qt5-base libxcursor dbus libxrandr freetype2 hicolor-icon-theme)

package() {
_srcname=PVRTexTool

# Run installer
chmod +x "${srcdir}/install.run" 
"${srcdir}/install.run" --prefix "${srcdir}" --mode unattended

# Install license
install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

# Install documentation
mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
mv ${srcdir}/${_srcname}/Documentation/* "${pkgdir}/usr/share/doc/${pkgname}"

# Install library
mkdir -p "${pkgdir}/usr/include"
mkdir -p "${pkgdir}/usr/lib"
mv ${srcdir}/${_srcname}/Library/Include/* "${pkgdir}/usr/include"
mv ${srcdir}/${_srcname}/Library/Linux_x86_64/* "${pkgdir}/usr/lib"

# Install CLI binaries
install -D "${srcdir}/${_srcname}/CLI/Linux_x86_64/compare" "${pkgdir}/usr/bin/pvr-compare"
install -D "${srcdir}/${_srcname}/CLI/Linux_x86_64/PVRTexToolCLI" "${pkgdir}/usr/bin/pvr-tex-tool"

# Install GUI application
mkdir -p "${pkgdir}/usr/share/${pkgname}"
mv ${srcdir}/${_srcname}/GUI/Linux_x86_64/* "${pkgdir}/usr/share/${pkgname}"
ln -s "/usr/share/${pkgname}/PVRTexToolGUI" "${pkgdir}/usr/bin/pvr-tex-tool-gui"

# Delete .run file (only pacman should be allowed to perform updates)
rm "${pkgdir}/usr/share/${pkgname}/autoupdate-linux-x64.run"

# Copy icons
pushd "${pkgdir}/usr/share/${pkgname}/Icons" > /dev/null
for _image in *.png; do
_size="${_image//[^0-9]/}"
install -D "${_image}" "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/PVRTexTool.png"
done
popd > /dev/null

# Create desktop entry
install -D "PVRTexTool.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
