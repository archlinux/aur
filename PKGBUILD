# Maintainer: rez <rez@ifwerez.ru>
pkgname=cider-studio
pkgver=2.7.0
pkgrel=1
pkgdesc="run & control roblox studio advancedly on linux"
arch=('x86_64')
url="https://ifwerez.ru/git/rez/cider"
license=('MIT')
depends=('sdl2' 'libgl' 'zlib' 'xz' 'curl' 'cabextract' 'wine')
makedepends=('cmake' 'gcc' 'curl' 'git')
optdepends=('bubblewrap: filesystem sandbox for studio')
source=()
sha256sums=()

build() {
    rm -rf src
    git -c advice.detachedHead=false clone --branch "${pkgver}" --depth 1 "https://ifwerez.ru/git/rez/cider.git" src
    cd src
    cmake -B build -DCMAKE_BUILD_TYPE=Release
    cmake --build build -j"$(nproc)"
}

package() {
    cd src
    install -Dm755 build/cider "${pkgdir}/usr/bin/cider"

    install -Dm644 src/resources/cider.png \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/cider.png"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/cider.desktop" <<EOF
[Desktop Entry]
Name=Cider
Comment=run & control roblox studio advancedly on linux
Exec=cider %U
Type=Application
Icon=cider
Categories=Game;Development;
StartupWMClass=cider
EOF

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/roblox-studio.desktop" <<EOF
[Desktop Entry]
Name=Roblox Studio
Comment=guess what this is
Exec=cider %U
Type=Application
Icon=cider
Categories=Game;Development;
MimeType=application/x-roblox-rbxl;application/x-roblox-rbxlx;application/x-roblox-rbxm;application/x-roblox-rbxmx;x-scheme-handler/roblox-studio;x-scheme-handler/roblox-studio-auth;
StartupWMClass=RobloxStudioBeta.exe
EOF

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/mime/packages/cider-mimetypes.xml" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
  <mime-type type="application/x-roblox-rbxl"><comment>Roblox Place</comment><glob pattern="*.rbxl"/></mime-type>
  <mime-type type="application/x-roblox-rbxlx"><comment>Roblox Place XML</comment><glob pattern="*.rbxlx"/></mime-type>
  <mime-type type="application/x-roblox-rbxm"><comment>Roblox Model</comment><glob pattern="*.rbxm"/></mime-type>
  <mime-type type="application/x-roblox-rbxmx"><comment>Roblox Model XML</comment><glob pattern="*.rbxmx"/></mime-type>
</mime-info>
EOF
}
