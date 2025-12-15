# Submitter: Siavash Askari Nasr <ciavash@protonmail.com>
# Maintainer: mpsijm

_app_name=grist-desktop
pkgname="${_app_name}-bin"
pkgver=0.3.7
pkgrel=1
pkgdesc="Desktop Grist, packaged with Electron. Grist is a modern relational spreadsheet. It combines the flexibility of a spreadsheet with the robustness of a database."
arch=('x86_64')
url='https://github.com/gristlabs/grist-desktop'
license=('Apache')
provides=("${_app_name}")
depends=('libxss' 'libxtst' 'libappindicator' 'libnotify' 'libxcrypt-compat')
options=(!debug)
source=("${pkgname}-${pkgver}.AppImage::https://github.com/gristlabs/${_app_name}/releases/download/v${pkgver}/${_app_name}-${pkgver}-linux-x86_64.AppImage"
        "grist16.png"
        "grist32.png"
        "grist48.png"
        "grist64.png"
        "grist128.png"
        "grist192.png"
        "grist512.png")
sha512sums=('10746fe90e7b6649fa507e9aa9b48784f595179b350d869129dee48ce3bc97e6acc3629a998a6aaa9903ed55a204665914f1eb29f94fed4093b457ed2785cf43'
            '9ba082a4d41a7aba98f9fd62a6960142f48d1c4793035b5bd013604420d49f926e17b6931d4caf8a34a97be151cbbf0a781bf1341311352516e61d17b5027e16'
            'cadb1529099f5e3d7d4c5236fcb18a8ffe8eeb0f3045b50fa321789c262d8e4edd6b8db56b899e8327350020b5ccd703b709172290f04544e7dfdc697784d37b'
            'd90b965e4426d04e6df6fb8374a66f9b8c30b8429ed0dbbf1a366403d1fe8be872e08e9ccdfff07b0c633df2218e83c86b93fb53ab4f4157540ca31c9a092e00'
            'a7a487bc775ec23cf51f73655634c4174e5d207ba4dc57d8994555b625a08a814f0532452c4e8022905e274e4b1824e61da6dbbe08fa5201f461475785d878ea'
            '86011a12f7aa7bd07f7e1fb4bb15fd775e9c8ebea49789916fd517e014d1c0302bd2221be477e607ef1d5ee7e6ef662aa13f83a657af4100584137e2021628c7'
            'f7e5d4ef816130556ec5617cde6502a228cfa44dbdb01bae2060a637a6210b7a11d09ed6fe37bb3775e48309532e3775a9a6500d7371bff3913116caa3f953e6'
            '7c69e529c4a29349e3056902e1d3709c57f2170d17aeabad28316be15e67cc472ab01480fe8eabc104766dbdb261bb9bf5b19f1bf0018c5d45554dc431b34bc6')

prepare() {
    chmod +x "${pkgname}-${pkgver}.AppImage"
    "./${pkgname}-${pkgver}.AppImage" --appimage-extract

    # Correct Exec path for .desktop file and remove '--no-sandbox' argument
    sed -i "s|Exec=AppRun --no-sandbox|Exec=/opt/${pkgname}/${_app_name}|g" "squashfs-root/${_app_name}.desktop"

    # Remove X-AppImage-Version from .desktop file
    sed -i '/AppImage/d' "squashfs-root/${_app_name}.desktop"
}

package() {
    local opt_dir="/opt/${pkgname}"

    install -d "${pkgdir}${opt_dir}" "${pkgdir}/usr/bin"

    find squashfs-root/{locales,resources,usr/share/icons}/ -type d -exec chmod 755 {} +

    cp -av squashfs-root/* "${pkgdir}${opt_dir}"
    chmod 4755 "${pkgdir}${opt_dir}/chrome-sandbox"
    rm -rf "${pkgdir}${opt_dir}/usr"
    rm "${pkgdir}${opt_dir}"/{"$_app_name".desktop,AppRun}

    # Fix permisssions
    chmod 644 "${pkgdir}${opt_dir}"/resources/app{.asar,-update.yml}

    ln -s "${opt_dir}/${_app_name}" "${pkgdir}/usr/bin/"

    install -Dm644 "squashfs-root/${_app_name}.desktop" -t "${pkgdir}/usr/share/applications/"

    for i in 16 32 48 64 128 192 512; do
        install -C -Dm644 "grist${i}.png" "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/${_app_name}.png"
    done
}
