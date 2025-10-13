# Maintainer: Nathan Chere <git@nathanchere.com.au>
_base_ver=10
pkgname=grayjay-git
_appname=Grayjay
pkgver=10.r17.g04a4c7e
pkgrel=1
pkgdesc="Grayjay Desktop - follow creators, not platforms (privacy- and freedom-respecting client for YouTube, Rumble, Twitch, Spotify etc)"
arch=('x86_64')
url="https://grayjay.app/desktop/"
provides=('grayjay')
conflicts=('grayjay-bin')
options=('!strip' 'staticlibs')
# Even though GitLab is the official Futo repo and Github is just a mirror, for some reason they are a lot
# lazier with tagging their Gitlab releases. Use Gitlab where possible, but to keep up with latest release it will
# sometimes be neccessary to reference the Github mirror instead.
_futo_gitlab_base="https://gitlab.futo.org/videostreaming"
_futo_github_base="https://github.com/futo-org"
host="${_futo_gitlab_base}"
license=('custom:Source-First-License-1.1')
depends=('ffmpeg' 'libsodium')
makedepends=('dotnet-sdk>=9' 'git' 'git-lfs' 'npm')
source=("${_appname}::git+${host}/Grayjay.Desktop.git"
        "grayjay.desktop"
        "grayjay.sh"
        "Grayjay.Desktop.CEF.csproj.user"
        "FUTO.MDNS.csproj.user")
sha256sums=('SKIP'
            '3d37aacfe2c23495448da3d7202abfa2e28db5a10cb69453f9b00b1e80a70f5d'
            '3a1f43abacc62ad257edbb6c7744c132f5a50d64d0725aa79e251ddc19b6e489'
            'bc13ae396e2fcd2849e4564db67fad6e1461cedebb2abdafece81fc4c00f38dd'
            'be103a98e070fd289a2e5bbd1ad1e8e45fd6d9e3c9c01e791c93cc89fe1a8936')

export GIT_LFS_SKIP_SMUDGE=1

pkgver() {
    cd "${srcdir}/${_appname}"
    local commits=$(git rev-list --count $_base_ver..HEAD 2>/dev/null || echo 0)
    local hash=$(git rev-parse --short HEAD 2>/dev/null || echo 000000)
    printf "%s.r%s.g%s" "$_base_ver" "$commits" "$hash"
}

prepare() {
    cd "${srcdir}/${_appname}"

    for _sub in FUTO.MDNS Grayjay.Engine JustCef SyncServer; do
        # SyncServer isn't mirrored on Github so we use Gitlab for all submodules even
        #  if we're using the Github main repo.
        git config submodule.${_sub}.url "${_futo_gitlab_base}/${_sub}.git"
    done

    git lfs install

    GIT_LFS_SKIP_SMUDGE=0 git checkout -- .
    git submodule update --init --recursive

    git submodule foreach 'GIT_LFS_SKIP_SMUDGE=0 git checkout -- . || true'

    cp "${srcdir}/Grayjay.Desktop.CEF.csproj.user" Grayjay.Desktop.CEF
    cp "${srcdir}/FUTO.MDNS.csproj.user" FUTO.MDNS/FUTO.MDNS
}

_configuration="Release"
_target="linux-x64"

build() {
    cd "${srcdir}/${_appname}"

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
    install -dm755 "${pkgdir}/opt/${_appname}"
    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/share/applications"
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
    install -dm755 "${pkgdir}/usr/share/licenses/grayjay"

    # Copy application files
    local _appdir="${pkgdir}/opt/grayjay"
    cp -va "${srcdir}/${_appname}/Grayjay.Desktop.CEF/bin/${_configuration}/net9.0/${_target}/publish/." "${_appdir}"
    rm -v "${_appdir}/ffmpeg"
    rm -v "${_appdir}/Portable"
    rm -v "${_appdir}/libsodium.so"
    find "${_appdir}" -type f -name '*.so' -o -name '*.so.*' -o -name 'dotcefnative' -exec chmod a+x "{}" \;

    install -Dm755 "${srcdir}/grayjay.sh" "${pkgdir}/usr/bin/grayjay"
    install -Dm644 "${srcdir}/grayjay.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
    install -Dm644 "${srcdir}/${_appname}/Grayjay.Desktop.CEF/grayjay.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/grayjay.png"
    install -Dm644 "${srcdir}/${_appname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${_appname}/LICENSE"
}
