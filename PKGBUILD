# Maintainer: Siavash Askari Nasr <ciavash@protonmail.com>

_app_name=grist-electron
pkgname="${_app_name}-bin"
pkgver=0.1.9
pkgrel=1
pkgdesc="Unofficial Electron build of Grist, a modern relational spreadsheet. It combines the flexibility of a spreadsheet with the robustness of a database to organize your data and make you more productive."
arch=('x86_64')
url='https://github.com/paulfitz/grist-electron'
license=('Apache')
provides=('grist-electron')
depends=('libxss' 'libxtst' 'libappindicator-gtk2' 'libnotify' 'libxcrypt-compat')
source=("${pkgname}-${pkgver}.AppImage::https://github.com/paulfitz/${_app_name}/releases/download/v${pkgver}/${_app_name}-linux-${pkgver}-x86_64.AppImage"
        "grist16.png"
        "grist32.png"
        "grist48.png"
        "grist64.png"
        "grist128.png"
        "grist192.png"
        "grist512.png")
sha512sums=('d195c4bb9ed6c51eaf44dad555a034507b2294a0b68a905c130a84651dd6c4e4a7dd8ea37687da93993421ee63ba735a3ee050e1ed413efd699748b6226dea50'
            '9ba082a4d41a7aba98f9fd62a6960142f48d1c4793035b5bd013604420d49f926e17b6931d4caf8a34a97be151cbbf0a781bf1341311352516e61d17b5027e16'
            'cadb1529099f5e3d7d4c5236fcb18a8ffe8eeb0f3045b50fa321789c262d8e4edd6b8db56b899e8327350020b5ccd703b709172290f04544e7dfdc697784d37b'
            'd90b965e4426d04e6df6fb8374a66f9b8c30b8429ed0dbbf1a366403d1fe8be872e08e9ccdfff07b0c633df2218e83c86b93fb53ab4f4157540ca31c9a092e00'
            'a7a487bc775ec23cf51f73655634c4174e5d207ba4dc57d8994555b625a08a814f0532452c4e8022905e274e4b1824e61da6dbbe08fa5201f461475785d878ea'
            '86011a12f7aa7bd07f7e1fb4bb15fd775e9c8ebea49789916fd517e014d1c0302bd2221be477e607ef1d5ee7e6ef662aa13f83a657af4100584137e2021628c7'
            'f7e5d4ef816130556ec5617cde6502a228cfa44dbdb01bae2060a637a6210b7a11d09ed6fe37bb3775e48309532e3775a9a6500d7371bff3913116caa3f953e6'
            '7c69e529c4a29349e3056902e1d3709c57f2170d17aeabad28316be15e67cc472ab01480fe8eabc104766dbdb261bb9bf5b19f1bf0018c5d45554dc431b34bc6')

prepare() {
    chmod +x "${pkgname}-${pkgver}.AppImage"
    ./"${pkgname}-${pkgver}.AppImage" --appimage-extract

    # Correct path for .desktop file
    sed -i "s|Exec=AppRun|Exec=/opt/${pkgname}/${_app_name}|g" "squashfs-root/${_app_name}.desktop"

    # Remove X-AppImage-Version
    sed -i '/AppImage/d' "squashfs-root/${_app_name}.desktop"

    sed -i -r 's/Name=.+/Name=Grist Electron/' "squashfs-root/${_app_name}.desktop"
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
