# Maintainer: Jasmin <theblazehen@gmail.com>
# Contributor: XSilverTH <XSilverTH@proton.me>

pkgname=adb-gui-kit-bin
pkgver=1.3
pkgrel=2
pkgdesc="A simple, modern GUI for ADB and Fastboot"
arch=("$CARCH")
url="https://github.com/Drenzzz/adb-gui-kit"
license=("LicenseRef-adb-gui-kit")
depends=('gtk3' 'glib2' 'cairo' 'gdk-pixbuf2' 'android-tools' 'hicolor-icon-theme')
provides=('adb-gui-kit')
conflicts=('adb-gui-kit')
options=('!strip')

source_x86_64=("${pkgname}-${pkgver}.AppImage::https://github.com/Drenzzz/adb-gui-kit/releases/download/v${pkgver}/ADBKit-x86_64.AppImage"
               "adb-gui-kit.desktop")

sha256sums_x86_64=('13971ecca89771738b8c256220ee1ba2af3a911d685ba3e6cb4da265027130d1'
                   'dea69b0a76f5cfdf4d0dce7c9d0a8ce40e814d8dca257941114e987df4427cbf')

prepare() {
    cd "$srcdir"
    chmod +x "${pkgname}-${pkgver}.AppImage"
    ./"${pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
    local _squashfs="${srcdir}/squashfs-root"
    local _install_path="${pkgdir}/opt/${pkgname}"

    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
    install -d "${_install_path}/bin/linux"

    # Install main executable from usr/bin
    install -m755 "${_squashfs}/usr/bin/ADBKit" "${_install_path}/adb-gui-kit"

    # Copy mke2fs.conf from AppImage
    install -Dm644 "${_squashfs}/usr/bin/bin/linux/mke2fs.conf" "${_install_path}/bin/linux/mke2fs.conf"

    local _bin_path="${_install_path}/bin/linux"

    for tool in adb fastboot etc1tool hprof-conv sqlite3 mke2fs make_f2fs; do
        if [ -e "/usr/bin/$tool" ]; then
            ln -sf "/usr/bin/$tool" "${_bin_path}/$tool"
        elif [ -e "${_squashfs}/usr/bin/bin/linux/$tool" ]; then
            install -m755 "${_squashfs}/usr/bin/bin/linux/$tool" "${_bin_path}/$tool"
        fi
    done

    if [ -e "${_bin_path}/make_f2fs" ]; then
        ln -sf "${_bin_path}/make_f2fs" "${_bin_path}/make_f2fs_casefold"
    fi

    # Create launcher script
    cat <<EOF > "${pkgdir}/usr/bin/adb-gui-kit"
#!/bin/sh
cd "/opt/${pkgname}"
exec ./adb-gui-kit "\$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/adb-gui-kit"

    install -m644 "${srcdir}/adb-gui-kit.desktop" "${pkgdir}/usr/share/applications/"

    # Use icon from AppImage
    install -m644 "${_squashfs}/usr/share/icons/hicolor/256x256/apps/adbkit.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/adb-gui-kit.png"
}
