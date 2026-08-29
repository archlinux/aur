# Maintainer: colegeming <collegeming@outlook.com>

pkgname=snishaper-bin
pkgver=1.29.0beta3
pkgrel=1
pkgdesc='Local proxy to bypass SNI blocking via ECH injection, TLS fragmentation, QUIC and a TUN device (prebuilt binary)'
arch=('x86_64')
url='https://github.com/SnishaperTeam/SniShaper'
license=('AGPL-3.0-only')
# Wails v3 + GTK4 + WebKitGTK 6.0 frontend. The TUN/route plumbing speaks
# netlink directly, so no iproute2 hard-dep; offer it as optional for users
# whose rules shells out to `ip`.
depends=('gtk4' 'webkitgtk-6.0')
optdepends=('iproute2: if your ruleset invokes the `ip` command')
provides=('snishaper')
conflicts=('snishaper')
options=('!strip')
# The release tarball checksum is filled in by the updater from the GitHub
# asset digest. The icon and LICENSE live in the upstream repo (not in any
# release asset), so their sha256 are pinned here on the default branch;
# refresh them only if upstream changes those files.
source_x86_64=(
    "https://github.com/SnishaperTeam/SniShaper/releases/download/v1.29.0-beta.3/snishaper-linux-amd64.tar.gz"
    "snishaper.png::https://raw.githubusercontent.com/SnishaperTeam/SniShaper/main/Assets/AppList.targetsize-256_altform-unplated.png"
    "LICENSE::https://raw.githubusercontent.com/SnishaperTeam/SniShaper/main/LICENSE"
)
sha256sums_x86_64=(
    '68b587bf1c008f150d631c6f8d68e38ff5720e238b01f7be5489208393bd5e12'
    'c8c6fb14ef896c6fe2a3d65632445bb1d01a3c78796f3ed494e0592bf329d40b'
    '95bc608f8ed815a6a47f1c209e33c4ea991c5c5acf664fdf3ba204117a7d96b7'
)

package() {
    local appdir="${pkgdir}/opt/snishaper"

    # Upstream tarball layout: ./SniShaper ./config/ ./rules/
    install -d "${appdir}"
    cp -a SniShaper config rules "${appdir}/"
    chmod 755 "${appdir}/SniShaper"

    # The binary reads config/ and rules/ from its working directory (upstream
    # documents `sudo ./SniShaper` run from the extracted archive), so cd into
    # /opt/snishaper before exec. TUN setup requires root -- run as
    # `sudo snishaper`, or grant cap_net_admin / a polkit rule yourself.
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/snishaper" <<'EOF'
#!/bin/bash
cd /opt/snishaper
exec ./SniShaper "$@"
EOF

    install -Dm644 "${srcdir}/snishaper.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/snishaper.png"

    install -Dm644 /dev/stdin \
        "${pkgdir}/usr/share/applications/snishaper.desktop" <<'EOF'
[Desktop Entry]
Name=SniShaper
Comment=Bypass SNI blocking via ECH injection, TLS fragmentation, QUIC and TUN
Comment[zh_CN]=通过 ECH 注入、TLS 分片、QUIC 与 TUN 绕过 SNI 阻断
Exec=snishaper %U
Icon=snishaper
Terminal=false
Type=Application
Categories=Network;P2P;
StartupWMClass=SniShaper
EOF

    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
