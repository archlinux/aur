# Maintainer: 9M2PJU <9M2PJU@users.noreply.github.com>
# Contributor: 9M2PJU <9M2PJU@users.noreply.github.com>
#
# VCS package: builds the latest 9M2PJU DroidStar-Linux HEAD from source.
# Updated on every push to the main branch of the upstream repo.
#
# All credit for the original DroidStar software goes to Doug McLain AD8DP.
# Original project: https://github.com/nostar/DroidStar

pkgname=droidstar-9m2pju-git
pkgver=1.0.e8e6129
pkgrel=1
pkgdesc="DroidStar-9M2PJU - amateur radio digital modes client (built from git, Arch-native)"
arch=('x86_64' 'aarch64')
url="https://github.com/9M2PJU/DroidStar-Linux"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-declarative' 'qt6-multimedia' 'qt6-serialport'
         'qt6-shadertools' 'hicolor-icon-theme')
makedepends=('cmake' 'git' 'qt6-shadertools')
provides=('droidstar-9m2pju')
conflicts=('droidstar-9m2pju' 'droidstar-9m2pju-bin' 'droidstar' 'droidstar-git')
options=('!strip' '!debug')

# Use a tagged ref so pkgver is deterministic across rebuilds. To bump, update
# _gitref to the new short SHA and re-run `makepkg --printsrcinfo > .SRCINFO`.
_gitref="e8e6129"
_pkgname="DroidStar-Linux"

source=("${_pkgname}::git+${url}.git#commit=${_gitref}")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    # Format: 1.0.<short-sha> -- matches the binary release version scheme.
    printf "1.0.%s" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"

    # SKIP_QT_DEPLOY=ON: do not bundle Qt6 libraries/plugins into the install
    # tree. The package depends on system qt6-* packages instead, keeping it
    # small and avoiding conflicts with the system Qt.
    cmake -B build -S . \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DSKIP_QT_DEPLOY=ON

    cmake --build build -j"$(nproc)"
}

package() {
    cd "${srcdir}/${_pkgname}"

    # Install the binary into $pkgdir/usr/bin
    DESTDIR="${pkgdir}" cmake --install build --prefix /usr

    # Desktop entry
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/droidstar-9m2pju.desktop" <<'EOF'
[Desktop Entry]
Name=DroidStar-9M2PJU
Comment=Amateur radio digital modes client (9M2PJU build)
Exec=DroidStar
Icon=droidstar-9m2pju
Terminal=false
Type=Application
Categories=HamRadio;Network;Audio;
EOF

    # Icon (shipped in the source tree at images/droidstar.png)
    if [ -f "images/droidstar.png" ]; then
        install -Dm644 "images/droidstar.png" \
            "${pkgdir}/usr/share/icons/hicolor/256x256/apps/droidstar-9m2pju.png"
    fi
}
