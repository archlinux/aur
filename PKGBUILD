# Maintainer: Samet Güzeldemirci <samet@guzeldemirci.com> 
# Github: https://github.com/samex/windsurf-ai-arch-linux

pkgname=windsurf-bin
_pkgname=windsurf
pkgver=1.3.11
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
_windsurf_tar_url_prefix="https://windsurf-stable.codeiumdata.com/linux-x64/stable/61d65579650f356494469f86c21fb953834289a0"

#Github Repo 1 URL Prefixes
_git_repo1="https://raw.githubusercontent.com/samex/windsurf-ai-arch-linux/refs/heads/main"
_git_repo1_releases="https://github.com/samex/windsurf-ai-arch-linux/releases/download"

#URLs
_deb_url1="${_windsurf_deb_repo_url_prefix}/Windsurf-linux-x64-${pkgver}.deb" #Official DEB
_deb_url2="${_git_repo1_releases}/${pkgver}/Windsurf-linux-x64-${pkgver}.deb" #Github DEB
_tar_url1="${_windsurf_tar_url_prefix}/Windsurf-linux-x64-${pkgver}.tar.gz" #Official TAR
_tar_url2="${_git_repo1_releases}/${pkgver}/Windsurf-linux-x64-${pkgver}.tar.gz" #Github TAR

#Checksums
_deb_sha256="b282a6aef0793a4f44f7ca0ed7f5fcad96a8bdefc78696b3494469fc8ad8c2b9" #v1.3.11-deb
_tar_sha256="ae19d09937cf8b5b43198db4a472a8272ceebb47fe834ce326dbc847da9b4c17" #v1.3.11-tarball

source=(
    "${_pkgname}.desktop::${_git_repo1}/${_pkgname}.desktop"
    "${_pkgname}.png::${_git_repo1}/${_pkgname}.png"
    "${_pkgname}-url-handler.desktop::${_git_repo1}/${_pkgname}-url-handler.desktop"
    "${_pkgname}-bin.sh::${_git_repo1}/windsurf-bin.sh"
    "com.codeium.${_pkgname}.metainfo.xml::${_git_repo1}/com.codeium.${_pkgname}.metainfo.xml"
    "${_pkgname}-bash-completion::${_git_repo1}/${_pkgname}-bash-completion"
    "${_pkgname}-zsh-completion::${_git_repo1}/${_pkgname}-zsh-completion"
    "${_pkgname}-workspace.xml::${_git_repo1}/${_pkgname}-workspace.xml"
)

sha256sums=('9c074b57164d3d4225a9b1461d22c4999b5986d7802d8e87cb2e1f0342ee3e69'
            '5c54ecf084dbaee5d85036205c2bb2df0d9b2bf77a503d722ee9833e4a236d7a'
            'c637acac4d51c7f8fd60d3825597e2e84d3bb5a505c52fcdec4a386c016e5959'
            '31a4e5539c27c4aa8de6341e22fb7dbb3c22e01e213aaf345b4729664f579426'
            '1ccdd57327c3835ff58cb553d0590bc1a10a3ddcb0ceb23e409739bc8092eb04'
            '099db10e1482accbd605f3fffa69b960c06649d7a5ac25671676bb57295051ab'
            '93fb0f5e2b3de0a6b195ec5dc20d8621270004ace1b4412cc08246a18f99e878'
            '1458655cc211cef5b243baeecc082e597af2a61291571c74b3c639f6d2e7dd97')

prepare() {
    cd "${srcdir}"
    
    echo "Checking if .deb package is available..."

    if curl --head --silent --fail "$_deb_url1" > /dev/null; then
        echo "Downloading .deb package from primary URL..."
        wget -O "${srcdir}/Windsurf-linux-x64-${pkgver}.deb" "$_deb_url1"
    elif curl --head --silent --fail "$_deb_url2" > /dev/null; then
        echo "Downloading .deb package from secondary URL..."
        wget -O "${srcdir}/Windsurf-linux-x64-${pkgver}.deb" "$_deb_url2"
    else
        echo ".deb not available, falling back to tar.gz..."
        
        if curl --head --silent --fail "$_tar_url1" > /dev/null; then
            echo "Downloading tar.gz package from primary URL..."
            wget -O "${srcdir}/Windsurf-linux-x64-${pkgver}.tar.gz" "$_tar_url1"
        elif curl --head --silent --fail "$_tar_url2" > /dev/null; then
            echo "Downloading tar.gz package from secondary URL..."
            wget -O "${srcdir}/Windsurf-linux-x64-${pkgver}.tar.gz" "$_tar_url2"
        else
            echo "ERROR: No valid package source found!" >&2
            exit 1
        fi

        # Verify SHA256 checksum for tar.gz
        echo "$_tar_sha256  ${srcdir}/Windsurf-linux-x64-${pkgver}.tar.gz" | sha256sum --check --status
        if [[ $? -ne 0 ]]; then
            echo "ERROR: SHA256 checksum mismatch for tar.gz package!" >&2
            exit 1
        fi
        echo "Checksum verified for tar.gz package."

        tar -xzf "${srcdir}/Windsurf-linux-x64-${pkgver}.tar.gz" -C "${srcdir}/${_pkgname}-latest"
        return
    fi

    # Verify SHA256 checksum for .deb
    echo "$_deb_sha256  ${srcdir}/Windsurf-linux-x64-${pkgver}.deb" | sha256sum --check --status
    if [[ $? -ne 0 ]]; then
        echo "ERROR: SHA256 checksum mismatch for .deb package!" >&2
        exit 1
    fi
    echo "Checksum verified for .deb package."

    mkdir -p "${srcdir}/deb_file/data"

    bsdtar -xf "${srcdir}/Windsurf-linux-x64-${pkgver}.deb" -C "${srcdir}/deb_file"
    tar -xf "${srcdir}/deb_file/data.tar.zst" -C "${srcdir}/deb_file/data"

    cp "${srcdir}/deb_file/data/usr/share/appdata/${_pkgname}.appdata.xml" "${srcdir}/com.codeium.${_pkgname}.metainfo.xml"
    cp "${srcdir}/deb_file/data/usr/share/mime/packages/${_pkgname}-workspace.xml" "${srcdir}/"
    cp "${srcdir}/deb_file/data/usr/share/bash-completion/completions/${_pkgname}" "${srcdir}/${_pkgname}-bash-completion"
    cp "${srcdir}/deb_file/data/usr/share/zsh/vendor-completions/_${_pkgname}" "${srcdir}/${_pkgname}-zsh-completion"

    cp -r "${srcdir}/deb_file/data/usr/share/${_pkgname}" "${srcdir}/${_pkgname}-latest"
}

package() {    

    # Install main binaries
    install -d "${pkgdir}/usr/share/${_pkgname}"
    ls "${srcdir}/${_pkgname}-latest/"
    cp -r "${srcdir}/${_pkgname}-latest/"* "${pkgdir}/usr/share/${_pkgname}/"

    # Install binary launcher script
    install -d "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/${_pkgname}-bin.sh" "${pkgdir}/usr/bin/${_pkgname}"

    # Install desktop entry files for application and URL handling
    install -d "${pkgdir}/usr/share/applications"
    install -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -m644 "${srcdir}/${_pkgname}-url-handler.desktop" "${pkgdir}/usr/share/applications/${_pkgname}-url-handler.desktop"

    # Install application metadata (AppStream metainfo)
    install -d "${pkgdir}/usr/share/metainfo"
    install -m644 "${srcdir}/com.codeium.${_pkgname}.metainfo.xml" "${pkgdir}/usr/share/metainfo/"

    # Install MIME type definitions
    install -d "${pkgdir}/usr/share/mime/packages"
    install -m644 "${srcdir}/${_pkgname}-workspace.xml" "${pkgdir}/usr/share/mime/packages/${_pkgname}-workspace.xml"

    # Install application icon (128x128 resolution)
    install -d "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
    install -m644 "${srcdir}/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"

    # Install shell completion scripts
    install -d "${pkgdir}/usr/share/bash-completion/completions"
    install -d "${pkgdir}/usr/share/zsh/site-functions"
    install -Dm 644 "${srcdir}/${_pkgname}-bash-completion" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}" #bash
    install -Dm 644 "${srcdir}/${_pkgname}-zsh-completion" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}" #zsh
}