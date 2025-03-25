# Maintainer: Chris Watson <cawatson1993@gmail.com>

pkgname=windsurf
_pkgname=windsurf
pkgver=1.5.8
pkgrel=1
pkgdesc="Tomorrow's Editor, Today. Built to keep you in flow state with instant, invaluable AI developer assistance."
arch=('x86_64')
url="https://codeium.com/"
license=('MIT')
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
conflicts=('windsurf')
options=('!strip')

#Official Repo URL Prefixes
_windsurf_deb_repo_url_prefix="https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/apt/pool/main/w/windsurf"

#Github Repo 1 URL Prefixes
_git_repo="https://raw.githubusercontent.com/watzon/aur-packages/refs/heads/main/packages/windsurf"

#URLs
_deb_url1="${_windsurf_deb_repo_url_prefix}/Windsurf-linux-x64-${pkgver}.deb"

#Checksums
_deb_sha256="SKIP" 

source=(
    $_deb_url1
    "${_pkgname}.png::${_git_repo}/${_pkgname}.png"
    "${_pkgname}-bin.sh::${_git_repo}/windsurf-bin.sh"
)

sha256sums=(
    $_deb_sha256
    '5c54ecf084dbaee5d85036205c2bb2df0d9b2bf77a503d722ee9833e4a236d7a'
    '5288e6a845852d5fc1c6045da57d5b973bd24eda866d4222a8cee41ffb0c6041'
)

prepare() {
    mkdir -p "${srcdir}/deb_file/data"
    bsdtar -xf "${srcdir}/Windsurf-linux-x64-${pkgver}.deb" -C "${srcdir}/deb_file"
    tar -xf "${srcdir}/deb_file/data.tar.zst" -C "${srcdir}/deb_file/data"
}

package() {    

    # Install main binaries
    install -d "${pkgdir}/usr/share/${_pkgname}"
    cp -r "${srcdir}/deb_file/data/usr/share/${_pkgname}" "${pkgdir}/usr/share/"

    # Fix chrome-sandbox permissions
    chmod 4755 "${pkgdir}/usr/share/${_pkgname}/chrome-sandbox"

    # Install binary launcher script
    install -d "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/${_pkgname}-bin.sh" "${pkgdir}/usr/bin/${_pkgname}"

    # Install desktop entry files for application and URL handling
    install -d "${pkgdir}/usr/share/applications"
    install -m644 "${srcdir}/deb_file/data/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/"
    install -m644 "${srcdir}/deb_file/data/usr/share/applications/${_pkgname}-url-handler.desktop" "${pkgdir}/usr/share/applications/"

    # Install application metadata (AppStream metainfo)
    install -d "${pkgdir}/usr/share/metainfo"
    install -m644 "${srcdir}/deb_file/data/usr/share/appdata/${_pkgname}.appdata.xml" "${pkgdir}/usr/share/metainfo/com.codeium.${_pkgname}.metainfo.xml"

    # Install MIME type definitions
    install -d "${pkgdir}/usr/share/mime/packages"
    install -m644 "${srcdir}/deb_file/data/usr/share/mime/packages/${_pkgname}-workspace.xml" "${pkgdir}/usr/share/mime/packages/"

    # Install application icon (128x128 resolution)
    install -d "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
    install -m644 "${srcdir}/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"

    # Install shell completion scripts
    install -d "${pkgdir}/usr/share/bash-completion/completions"
    install -d "${pkgdir}/usr/share/zsh/site-functions"
    install -Dm 644 "${srcdir}/deb_file/data/usr/share/bash-completion/completions/${_pkgname}" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}" #bash
    install -Dm 644 "${srcdir}/deb_file/data/usr/share/zsh/vendor-completions/_${_pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}" #zsh
}