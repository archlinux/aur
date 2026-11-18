# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

pkgbase=videoduplicatefinder
pkgname=("videoduplicatefinder" "videoduplicatefinder-cli" "videoduplicatefinder-webui")
pkgver=4.1.1
pkgrel=1
_pkgdesc="Video Duplicate Finder is a cross-platform software to find duplicated video (and image) files on hard disk based on similiarity"
arch=('x86_64')
url="https://github.com/0x90d/videoduplicatefinder"
license=('AGPL-3.0-or-later')
_dotnetver='10.0'
_depends=(
    'ffmpeg'
    "dotnet-runtime=${_dotnetver}"
)
depends=(
    "${_depends[@]}"
)
makedepends=(
    'git'
    "aspnet-targeting-pack=${_dotnetver}"
    "dotnet-sdk=${_dotnetver}"
)
source=("videoduplicatefinder-${pkgver}.tar.gz::https://github.com/0x90d/videoduplicatefinder/archive/refs/tags/v${pkgver}.tar.gz"
        'VDF.Web')
sha256sums=('726e139ff7befcc4d7d276a3b751de28924412d396e3fa4b38bba5643779c3c7'
            '01d2a2104970b78bda5833eb96a98beab574eb1e01730611c642f097e9ec7fb8')

build() {
    cd "videoduplicatefinder-${pkgver}"

    # Build GUI
    dotnet publish ./VDF.GUI/VDF.GUI.csproj -c Release -v q -r linux-x64 -o outputGUI
    # Build CLI
    dotnet publish ./VDF.CLI/VDF.CLI.csproj -c Release -v q -r linux-x64 -o outputCLI
    # Build Web
    dotnet publish ./VDF.Web/VDF.Web.csproj -c Release -v q -r linux-x64 -o outputWeb
}

package_videoduplicatefinder() {
    pkgdesc="${_pkgdesc}"
    provides=("videoduplicatefinder")
    conflicts=("videoduplicatefinder")

    install -d -m 755 "${pkgdir}/usr/bin"
    ln -s "/opt/videoduplicatefinder/VDF.GUI" "${pkgdir}/usr/bin/VDF.GUI"

    cd "videoduplicatefinder-${pkgver}"

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

package_videoduplicatefinder-cli() {
    cd "videoduplicatefinder-${pkgver}/outputCLI"

    pkgdesc="${_pkgdesc} (CLI)"
    provides=("videoduplicatefinder-cli")
    conflicts=("videoduplicatefinder-cli")

    find . -type d -exec install -d -m 755 {} "${pkgdir}/opt/videoduplicatefinder-cli/{}" \;
    find . -type f -exec install -m 644 {} "${pkgdir}/opt/videoduplicatefinder-cli/{}" \;

    install -d -m 755 "${pkgdir}/usr/bin"

    ln -s "/opt/videoduplicatefinder-cli/vdf-cli" "${pkgdir}/usr/bin/vdf-cli"

    chmod +x "${pkgdir}/opt/videoduplicatefinder-cli/vdf-cli"
}

package_videoduplicatefinder-webui() {
    cd "videoduplicatefinder-${pkgver}/outputWeb"

    pkgdesc="${_pkgdesc} (WebUI)"
    provides=("videoduplicatefinder-webui")
    conflicts=("videoduplicatefinder-webui")

    depends=(
        "${_depends[@]}"
        "aspnet-runtime=${_dotnetver}"
    )

    find . -type d -exec install -d -m 755 {} "${pkgdir}/opt/videoduplicatefinder-webui/{}" \;
    find . -type f -exec install -m 644 {} "${pkgdir}/opt/videoduplicatefinder-webui/{}" \;

    chmod +x "${pkgdir}/opt/videoduplicatefinder-webui/VDF.Web"

    install -d -m 755 "${pkgdir}/usr/bin"

    # Need to cd to /opt/videoduplicatefinder-webui, won't run otherwise.
    cat << EOF > "${pkgdir}/usr/bin/VDF.Web"
#!/bin/sh
cd /opt/videoduplicatefinder-webui
exec ./VDF.Web
EOF

    chmod +x "${pkgdir}/usr/bin/VDF.Web"
}
