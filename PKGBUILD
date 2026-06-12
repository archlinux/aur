# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

pkgbase=videoduplicatefinder-git
pkgname=("videoduplicatefinder-git" "videoduplicatefinder-cli-git" "videoduplicatefinder-webui-git")
pkgver=4.0.x.r3.g9c53bca
pkgrel=1
_pkgdesc="Video Duplicate Finder is a cross-platform software to find duplicated video (and image) files on hard disk based on similiarity"
arch=('x86_64')
url="https://github.com/0x90d/videoduplicatefinder"
license=('AGPL-3.0-or-later')
_dotnetver='10.0'
_depends=(
    'ffmpeg'
    "dotnet-runtime-${_dotnetver}"
)
depends=(
    "${_depends[@]}"
)
makedepends=(
    'git'
    "aspnet-targeting-pack-${_dotnetver}"
    "dotnet-sdk-${_dotnetver}"
)
source=("git+${url}.git")
sha256sums=('SKIP')

_sed_escape() {
    echo "${1}" | sed 's/[]\/&.*$^[]/\\&/g'
}

pkgver() {
    cd "videoduplicatefinder"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "videoduplicatefinder"

    # Build GUI
    dotnet publish ./VDF.GUI/VDF.GUI.csproj -c Release -v q -r linux-x64 -o outputGUI
    # Build CLI
    dotnet publish ./VDF.CLI/VDF.CLI.csproj -c Release -v q -r linux-x64 -o outputCLI
    # Build Web
    dotnet publish ./VDF.Web/VDF.Web.csproj -c Release -v q -r linux-x64 -o outputWeb
}

package_videoduplicatefinder-git() {
    pkgdesc="${_pkgdesc}"
    provides=("videoduplicatefinder")
    conflicts=("videoduplicatefinder")

    install -d -m 755 "${pkgdir}/usr/bin"
    ln -s "/opt/videoduplicatefinder/VDF.GUI" "${pkgdir}/usr/bin/VDF.GUI"

    cd "videoduplicatefinder"

    install -d -m 755 "${pkgdir}/usr/share/applications"
    install -m 644 "VDF.GUI/Assets/Linux/videoduplicatefinder.desktop" "${pkgdir}/usr/share/applications"

    install -d -m 755 "${pkgdir}/opt/videoduplicatefinder"
    install -m 644 "VDF.GUI/Assets/Linux/icon.png" "${pkgdir}/opt/videoduplicatefinder"

    install -d -m 755 "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
    ln -s "/opt/videoduplicatefinder/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/videoduplicatefinder.png"

    cd "outputGUI"

    find . -type d -exec install -d -m 755 {} "${pkgdir}/opt/videoduplicatefinder/{}" \;
    find . -type f -exec install -m 644 {} "${pkgdir}/opt/videoduplicatefinder/{}" \;

    chmod +x "${pkgdir}/opt/videoduplicatefinder/VDF.GUI"
}

package_videoduplicatefinder-cli-git() {
    cd "videoduplicatefinder/outputCLI"

    pkgdesc="${_pkgdesc} (CLI)"
    provides=("videoduplicatefinder-cli")
    conflicts=("videoduplicatefinder-cli")

    find . -type d -exec install -d -m 755 {} "${pkgdir}/opt/videoduplicatefinder-cli/{}" \;
    find . -type f -exec install -m 644 {} "${pkgdir}/opt/videoduplicatefinder-cli/{}" \;

    chmod +x "${pkgdir}/opt/videoduplicatefinder-cli/vdf-cli"

    install -d -m 755 "${pkgdir}/usr/bin"

    ln -s "/opt/videoduplicatefinder-cli/vdf-cli" "${pkgdir}/usr/bin/vdf-cli"
}

package_videoduplicatefinder-webui-git() {
    cd "videoduplicatefinder/outputWeb"

    pkgdesc="${_pkgdesc} (WebUI)"
    provides=("videoduplicatefinder-webui")
    conflicts=("videoduplicatefinder-webui")

    depends=(
        "${_depends[@]}"
        "aspnet-runtime-${_dotnetver}"
    )

    find . -type d -exec install -d -m 755 {} "${pkgdir}/opt/videoduplicatefinder-webui/{}" \;
    find . -type f -exec install -m 644 {} "${pkgdir}/opt/videoduplicatefinder-webui/{}" \;

    chmod +x "${pkgdir}/opt/videoduplicatefinder-webui/VDF.Web"

    install -d -m 755 "${pkgdir}/usr/bin"

    # Need to cd to /opt/videoduplicatefinder-webui, won't run otherwise.
    echo "#!/usr/bin/env bash" > "${pkgdir}/usr/bin/VDF.Web"
    echo "trap 'popd > /dev/null 2>&1' EXIT" >> "${pkgdir}/usr/bin/VDF.Web"
    echo "pushd /opt/videoduplicatefinder-webui > /dev/null 2>&1" >> "${pkgdir}/usr/bin/VDF.Web"
    echo "./VDF.Web" >> "${pkgdir}/usr/bin/VDF.Web"
    chmod +x "${pkgdir}/usr/bin/VDF.Web"
}
