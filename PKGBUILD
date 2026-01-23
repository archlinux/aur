# Maintainer: Jasmin <theblazehen@gmail.com>
# Contributor: XSilverTH <XSilverTH@proton.me>

pkgname=adb-gui-kit-bin
pkgver=1.1
pkgrel=5
pkgdesc="A simple, modern GUI for ADB and Fastboot"
arch=('x86_64')
url="https://github.com/Drenzzz/adb-gui-kit"
license=('custom')
depends=('gtk3' 'glib2' 'cairo' 'gdk-pixbuf2' 'android-tools' 'rsync')
provides=('adb-gui-kit')
conflicts=('adb-gui-kit')
options=('!strip')

source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/Drenzzz/adb-gui-kit/releases/download/v${pkgver}/ADBKit-${pkgver}.0-linux-standalone.tar.gz"
               "adb-gui-kit.desktop"
               "https://raw.githubusercontent.com/Drenzzz/adb-gui-kit/refs/heads/main/frontend/public/logo.png")

sha256sums_x86_64=('4217c4aa50502d1f0e0f299191a7a977acb00db63907ef69f903a809f74cba0f'
                   'dea69b0a76f5cfdf4d0dce7c9d0a8ce40e814d8dca257941114e987df4427cbf'
                   '30bb96b234bcaaed28edb520d8c2b2759de28bcd83936a1544917465d45583d3')

package() {
    local _app_dir="${srcdir}" 
    local _install_path="${pkgdir}/opt/${pkgname}"

    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
    
    install -d "${_install_path}/bin/linux"

    install -m755 "${_app_dir}/ADBKit" "${_install_path}/adb-gui-kit"
    
    rsync -a \
        --exclude='bin/' \
        --exclude="${pkgname}-${pkgver}.tar.gz" \
        --exclude="adb-gui-kit.desktop" \
        --exclude="logo.png" \
        "${_app_dir}/" \
        "${_install_path}/"

    cp "${_app_dir}/bin/linux/mke2fs.conf" "${_install_path}/bin/linux/"
    
    local _bin_path="${_install_path}/bin/linux"
    
    ln -s /usr/bin/adb "${_bin_path}/adb"
    ln -s /usr/bin/fastboot "${_bin_path}/fastboot"
    ln -s /usr/bin/etc1tool "${_bin_path}/etc1tool"
    ln -s /usr/bin/hprof-conv "${_bin_path}/hprof-conv"
    
    ln -s /usr/bin/sqlite3 "${_bin_path}/sqlite3"
    
    ln -s /usr/bin/mke2fs "${_bin_path}/mke2fs"
    ln -s /usr/bin/make_f2fs "${_bin_path}/make_f2fs"
    ln -s /usr/bin/make_f2fs "${_bin_path}/make_f2fs_casefold"

    cat <<EOF > "${pkgdir}/usr/bin/adb-gui-kit"
#!/bin/sh
cd "/opt/${pkgname}"
exec ./adb-gui-kit "\$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/adb-gui-kit"

    install -m644 "${srcdir}/adb-gui-kit.desktop" "${pkgdir}/usr/share/applications/"

    install -m644 "${srcdir}/logo.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/adb-gui-kit.png"
}
