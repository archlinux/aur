# Maintainer: Nathan Robinson <nrobinson2000 at me dot com>

pkgname=pvr-tex-tool-bin
pkgver=2022.1
_versionstr='2022_R1'
pkgrel=4

pkgdesc="A comprehensive texture processing and compression tool with support for PVR textures."
url="https://www.imaginationtech.com/developers/powervr-sdk-tools/pvrtextool/"

arch=('x86_64')
options=('!strip')
license=('custom')

source=("install_${_versionstr}.run::https://cdn.imgtec.com/sdk/OFFLINE/PVRTexToolSetup-${_versionstr}.run-x64"
"LICENSE"
"PVRTexTool.desktop")

sha256sums=('72aa6560636a4db32d822e0c0614ee29bfe7d7e7395260c30070f1e0412f7d16'
            '837064152c1e86d030f76e9beb8da77869f8d8bc183fd8c8a26be696120b5ff4'
            '2172168dd08d1945ed750bd5ec748731e8b068afe705e956862081ec503ed86f')

# discovered with namcap(1)
depends=(qt5-base libxcursor dbus libxrandr freetype2 hicolor-icon-theme)

package() {
_srcname=PVRTexTool

# Run installer
chmod +x "${srcdir}/install_${_versionstr}.run"
"${srcdir}/install_${_versionstr}.run" --prefix "${srcdir}" --mode unattended

# Install license
install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

# Install documentation
mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
mv ${srcdir}/${_srcname}/Documentation/* "${pkgdir}/usr/share/doc/${pkgname}"

# Install library
mkdir -p "${pkgdir}/usr/include"
mkdir -p "${pkgdir}/usr/lib"
mv ${srcdir}/${_srcname}/Library/Include/* "${pkgdir}/usr/include"
mv ${srcdir}/${_srcname}/Library/Linux_x86_64/libPVRTexLib.so "${pkgdir}/usr/lib"

# Install CLI binaries
install -D "${srcdir}/${_srcname}/CLI/Linux_x86_64/PVRTexToolCLI" "${pkgdir}/usr/bin/pvr-tex-tool"

# Install GUI application
mkdir -p "${pkgdir}/usr/share/${pkgname}"
mv ${srcdir}/${_srcname}/GUI/Linux_x86_64/* "${pkgdir}/usr/share/${pkgname}"
ln -s "/usr/share/${pkgname}/PVRTexToolGUI" "${pkgdir}/usr/bin/pvr-tex-tool-gui"

# Fix permissions
find "${pkgdir}/usr/share/${pkgname}" -maxdepth 1 -type d | xargs chmod 755

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
