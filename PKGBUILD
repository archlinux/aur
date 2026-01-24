# Maintainer: Jasmin <theblazehen@gmail.com>
# Contributor: XSilverTH <XSilverTH@proton.me>

pkgname=adb-gui-kit-bin
pkgver=1.2
pkgrel=1
pkgdesc="A simple, modern GUI for ADB and Fastboot"
arch=('x86_64')
url="https://github.com/Drenzzz/adb-gui-kit"
license=('custom')
depends=('gtk3' 'glib2' 'cairo' 'gdk-pixbuf2' 'android-tools' 'hicolor-icon-theme')
provides=('adb-gui-kit')
conflicts=('adb-gui-kit')
options=('!strip')

source_x86_64=("${pkgname}-${pkgver}.AppImage::https://github.com/Drenzzz/adb-gui-kit/releases/download/v${pkgver}/ADBKit-x86_64.AppImage"
               "adb-gui-kit.desktop")

sha256sums_x86_64=('fd1f8de4540a88d6f2efb78557f78a63065d1f37389e543d6db16666009fa68d'
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

    # Symlink system tools instead of bundled ones
    local _bin_path="${_install_path}/bin/linux"

    ln -sf /usr/bin/adb "${_bin_path}/adb"
    ln -sf /usr/bin/fastboot "${_bin_path}/fastboot"
    ln -sf /usr/bin/etc1tool "${_bin_path}/etc1tool"
    ln -sf /usr/bin/hprof-conv "${_bin_path}/hprof-conv"
    ln -sf /usr/bin/sqlite3 "${_bin_path}/sqlite3"
    ln -sf /usr/bin/mke2fs "${_bin_path}/mke2fs"
    ln -sf /usr/bin/make_f2fs "${_bin_path}/make_f2fs"
    ln -sf /usr/bin/make_f2fs "${_bin_path}/make_f2fs_casefold"

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
