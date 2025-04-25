# Maintainer: Chris Watson <cawatson1993@gmail.com>

pkgname=windsurf
pkgver=1.7.1
pkgrel=1
pkgdesc="The new purpose-built IDE to harness magic"
arch=('x86_64')
url="https://windsurf.com/"
license=('custom')
depends=(
    'alsa-lib'
    'bash'
    'cairo'
    'dbus'
    'expat'
    'fontconfig'
    'gcc-libs'
    'glibc>=2.28-4'
    'gnupg'
    'gtk3'
    'libdrm'
    'libnotify'
    'libsecret'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxkbfile'
    'libxrandr'
    'libxss'
    'libxtst'
    'lsof'
    'mesa'
    'nspr'
    'nss'
    'shared-mime-info'
    'xdg-utils'
)
optdepends=('glib2: Needed for move to trash functionality'
            'org.freedesktop.secrets: Needed for settings sync'
            'libdbusmenu-glib: Needed for KDE global menu'
            'icu69: Needed for live share'
            'vulkan-icd-loader: Vulkan support')

provides=('windsurf')
options=('!strip')

source=(
    "https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/apt/pool/main/w/windsurf/Windsurf-linux-x64-${pkgver}.deb"
)

sha256sums=('4cf3c79d802eda606ce155339775bec06d1bfe5e1d7d92eed44a7e317c1611a4')

prepare() {
    mkdir -p "${srcdir}/deb_file/data"
    bsdtar -xf "${srcdir}/Windsurf-linux-x64-${pkgver}.deb" -C "${srcdir}/deb_file"
    tar -xf "${srcdir}/deb_file/data.tar.xz" -C "${srcdir}/deb_file/data"
}

package() {    

    # Install main binaries
    install -d "${pkgdir}/usr/share/${pkgname}"
    cp -r "${srcdir}/deb_file/data/usr/share/${pkgname}" "${pkgdir}/usr/share/"

    # Install binary launcher symbolic link
    install -d "${pkgdir}/usr/bin"
    ln -s /usr/share/windsurf/windsurf "${pkgdir}/usr/bin/${pkgname}"

    # Install desktop entry files for application and URL handling
    install -d "${pkgdir}/usr/share/applications"
    install -m644 "${srcdir}/deb_file/data/usr/share/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
    install -m644 "${srcdir}/deb_file/data/usr/share/applications/${pkgname}-url-handler.desktop" "${pkgdir}/usr/share/applications/"

    # Install application metadata (AppStream metainfo)
    install -d "${pkgdir}/usr/share/metainfo"
    install -m644 "${srcdir}/deb_file/data/usr/share/appdata/${pkgname}.appdata.xml" "${pkgdir}/usr/share/metainfo/com.codeium.${pkgname}.metainfo.xml"

    install -d "${pkgdir}/usr/share/mime/packages"
    install -m644 "${srcdir}/deb_file/data/usr/share/mime/packages/${pkgname}-workspace.xml" "${pkgdir}/usr/share/mime/packages/"

    install -d "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps"
    install -m644 "${srcdir}/deb_file/data/usr/share/pixmaps/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${pkgname}.png"

    install -d "${pkgdir}/usr/share/bash-completion/completions"
    install -d "${pkgdir}/usr/share/zsh/site-functions"
    install -Dm 644 "${srcdir}/deb_file/data/usr/share/bash-completion/completions/${pkgname}" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}" #bash
    install -Dm 644 "${srcdir}/deb_file/data/usr/share/zsh/vendor-completions/_${pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}" #zsh
}
