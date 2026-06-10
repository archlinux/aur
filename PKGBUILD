# Maintainer: Nook Release Bot <release-bot@nook.local>
pkgname=nook-beta-bin
pkgver=0.2.9
pkgrel=1
pkgdesc='Nook Beta desktop collaboration app'
arch=('x86_64')
url='https://nook.cloudylake.io'
license=('custom')
depends=('alsa-lib' 'at-spi2-core' 'gtk3' 'hicolor-icon-theme' 'libayatana-appindicator' 'libdrm' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxss' 'libxtst' 'mesa' 'nss' 'xdg-utils')
optdepends=('libpulse: PulseAudio audio support')
provides=('nook-beta')
conflicts=('nook-beta')
options=(!strip)
source_x86_64=("nook-beta-0.2.9-linux-${pkgver}-${pkgrel}.deb::https://nook.cloudylake.io/download/beta/nook-beta-0.2.9-linux.deb")
sha256sums_x86_64=('34a1ff8455bc89634b9ab747cc647000085b8f81cb60f84232998748a03aa02d')

package() {
    bsdtar -xf "nook-beta-0.2.9-linux-${pkgver}-${pkgrel}.deb" -C "${srcdir}"

    local data_archive
    local app_install_dir='nook-beta'
    local versioned_app_dir="${app_install_dir}-${pkgver}"
    data_archive="$(find "${srcdir}" -maxdepth 1 -type f -name 'data.tar*' | head -n 1)"
    if [ -z "${data_archive}" ]; then
        echo "Unable to find data archive in extracted .deb" >&2
        return 1
    fi

    bsdtar -xf "${data_archive}" -C "${pkgdir}"

    if [ ! -d "${pkgdir}/opt/${app_install_dir}" ]; then
        echo "Unable to find /opt/${app_install_dir} in extracted .deb" >&2
        return 1
    fi

    # AUR upgrades must not write hashed Electron/Vite assets into a stable
    # /opt path. If an older install left unowned files behind, pacman checks
    # would fail before scriptlets can clean them. Keep the app payload
    # versioned and point the stable launchers at it instead.
    rm -rf "${pkgdir}/opt/${versioned_app_dir}"
    mv "${pkgdir}/opt/${app_install_dir}" "${pkgdir}/opt/${versioned_app_dir}"

    mkdir -p "${pkgdir}/usr/bin"
    ln -sfn "/opt/${versioned_app_dir}/${app_install_dir}" "${pkgdir}/usr/bin/${app_install_dir}"

    local desktop_file="${pkgdir}/usr/share/applications/${app_install_dir}.desktop"
    if [ -f "${pkgdir}/usr/share/applications/Nook.desktop" ]; then
        mv "${pkgdir}/usr/share/applications/Nook.desktop" "${desktop_file}"
    fi
    if [ -f "${desktop_file}" ]; then
        sed -i "s#/opt/${app_install_dir}/${app_install_dir}#/opt/${versioned_app_dir}/${app_install_dir}#g" "${desktop_file}"
    fi
}
