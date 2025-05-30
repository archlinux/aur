# Maintainer: Nathan Chere <git@nathanchere.com.au>
# Contributor: Phillip Schichtel <phillip@schich.tel>
pkgname=grayjay
pkgver=7
pkgrel=1
pkgdesc="Follow creators, not platforms (privacy- and freedom-respecting streaming client)"
arch=('x86_64')
conflicts=('grayjay-bin')
conflicts=('grayjay-git')
options=('!strip' 'staticlibs')
# Even though GitLab is the official Futo repo and Github is just a mirror, for some reason they are a lot
# lazier with tagging their Gitlab releases. Use Gitlab where possible, but to keep up with latest release it will
# sometimes be neccessary to reference the Github mirror instead.
_futo_gitlab_base="gitlab.futo.org/videostreaming"
_futo_github_base="github.com/futo-org"
_github_git_url="https://${_futo_github_base}/Grayjay.Desktop.git"
_gitlab_git_url="https://${_futo_gitlab_base}/Grayjay.Desktop.git"
url="${_github_git_url}"
license=('custom:Source-First-License-1.1')
depends=('ffmpeg' 'libsodium')
makedepends=('dotnet-sdk>=9' 'git' 'git-lfs' 'npm')
source=("${pkgname}::git+${url}#tag=${pkgver}"
        "${pkgname}.desktop"
        "${pkgname}.sh"
        "Grayjay.Desktop.CEF.csproj.user"
        "FUTO.MDNS.csproj.user")
sha256sums=('34be2a165277ece11719dedd5c1f5c46f42be4df67586525a88d2fec83ea6f2f'
            '3d37aacfe2c23495448da3d7202abfa2e28db5a10cb69453f9b00b1e80a70f5d'
            '3a1f43abacc62ad257edbb6c7744c132f5a50d64d0725aa79e251ddc19b6e489'
            'bc13ae396e2fcd2849e4564db67fad6e1461cedebb2abdafece81fc4c00f38dd'
            'be103a98e070fd289a2e5bbd1ad1e8e45fd6d9e3c9c01e791c93cc89fe1a8936')

export GIT_LFS_SKIP_SMUDGE=1

prepare() {
    cd "${srcdir}/${pkgname}"

    # When cloning from GitHub, we need to explicitly set submodule URLs to GitLab
    if [[ "${url}" == *"github"* ]]; then
        git config submodule.FUTO.MDNS.url "https://${_futo_gitlab_base}/FUTO.MDNS.git"
        git config submodule.Grayjay.Engine.url "https://${_futo_gitlab_base}/Grayjay.Engine.git"
        git config submodule.JustCef.url "https://${_futo_gitlab_base}/JustCef.git"
        git config submodule.SyncServer.url "https://${_futo_gitlab_base}/syncserver.git"
    fi

    # Initialize Git LFS
    git lfs install
    
    # Force checkout instead of using lfs fetch/pull which can be problematic
    GIT_LFS_SKIP_SMUDGE=0 git checkout -- .
    
    # Initialize and update submodules
    git submodule update --init --recursive
    
    # Handle LFS in submodules
    git submodule foreach 'GIT_LFS_SKIP_SMUDGE=0 git checkout -- . || true'

    cp "${srcdir}/Grayjay.Desktop.CEF.csproj.user" Grayjay.Desktop.CEF
    cp "${srcdir}/FUTO.MDNS.csproj.user" FUTO.MDNS/FUTO.MDNS
}

_configuration="Release"
_target="linux-x64"

build() {
    cd "${srcdir}/${pkgname}"

    # Build front-end
    cd Grayjay.Desktop.Web
    npm install
    npm run build
    cd ..

    # Publish CEF
    local _targetdir="Grayjay.Desktop.CEF/bin/${_configuration}/net9.0/${_target}"
    rm -R "${_targetdir}" 2> /dev/null || true
    mkdir -p "${_targetdir}/publish/wwwroot"
    cp -a "Grayjay.Desktop.Web/dist" "${_targetdir}/publish/wwwroot/web"

    cd Grayjay.Desktop.CEF
    dotnet publish -r "${_target}" -c "${_configuration}"
    cd ..
}

package() {
    # Create necessary directories
    install -dm755 "${pkgdir}/opt/${pkgname}"
    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/share/applications"
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"

    # Copy application files
    local _appdir="${pkgdir}/opt/${pkgname}"
    cp -va "${srcdir}/${pkgname}/Grayjay.Desktop.CEF/bin/${_configuration}/net9.0/${_target}/publish/." "${_appdir}"
    rm -v "${_appdir}/ffmpeg"
    rm -v "${_appdir}/Portable"
    rm -v "${_appdir}/libsodium.so"
    find "${_appdir}" -type f -name '*.so' -o -name '*.so.*' -o -name 'dotcefnative' -exec chmod a+x "{}" \;

    install -Dm755 "${srcdir}/grayjay.sh" "${pkgdir}/usr/bin/grayjay"
    install -Dm644 "${srcdir}/grayjay.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/${pkgname}/Grayjay.Desktop.CEF/grayjay.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
