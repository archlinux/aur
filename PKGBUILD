# Maintainer: 9M2PJU <9m2pju@gmail.com>
# Contributor: 9M2PJU <9m2pju@gmail.com>
#
# VCS package: builds the latest OpenHamClock HEAD from source.
#
# OpenHamClock - Modern Web-Based Amateur Radio Dashboard
# In memory of Elwood Downey, WB0OEW.
# Original project: https://github.com/accius/openhamclock

pkgname=openhamclock-git
_pkgname=openhamclock
pkgver=26.7.2.r0.ge1f5cef5
pkgrel=1
pkgdesc="Amateur Radio Dashboard - A modern web-based HamClock alternative (VCS / git version)"
arch=('any')
url="https://github.com/accius/openhamclock"
license=('MIT')
depends=('nodejs>=18')
makedepends=('git' 'npm')
optdepends=(
    'hamlib: for transceiver and rotator control via rigctld/rotctld'
    'flrig: for transceiver CAT control via flrig'
    'xdg-utils: to open default web browser automatically in desktop mode'
)
provides=('openhamclock')
conflicts=('openhamclock')
backup=('etc/openhamclock/openhamclock.env')
options=('!strip')
source=(
    "${_pkgname}::git+https://github.com/accius/openhamclock.git#branch=main"
    "openhamclock.sh"
    "openhamclock.service"
    "openhamclock-user.service"
    "openhamclock.desktop"
    "openhamclock.env"
)
sha256sums=(
    'SKIP'
    '649f85ee70b5e5e04be64a86388f9f5727011fad7acc77eeacb37954ce2f5a2f'
    '25ef5af49ab9fc5737a7bcb6b25c2e476d0ba4e16a49ff9ca86b4bcd5275c7ba'
    '790b2098c340be12a3bbaf09c0a1990ead29a447fd788cc124b97677a69ad75b'
    'e4e6e8a0b3bc70127997c13e71bd1f2fb8be034181a62dcae676fcf08a318a74'
    '1d7ed07d68c0475a325c04f1689c136f27c86adf0ccd541a9e1620184eb91688'
)

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags --always | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    npm ci --no-audit --no-fund || npm install --no-audit --no-fund
}

build() {
    cd "${srcdir}/${_pkgname}"
    npm run build
    npm prune --omit=dev --no-audit --no-fund
}

package() {
    cd "${srcdir}/${_pkgname}"

    local appdir="${pkgdir}/usr/lib/${_pkgname}"
    install -d "${appdir}"

    # Copy frontend build, assets, server and runtime dependencies
    cp -a dist "${appdir}/"
    cp -a public "${appdir}/"
    cp -a server "${appdir}/"
    mkdir -p "${appdir}/src"
    cp -a src/server "${appdir}/src/"
    cp -a node_modules "${appdir}/"
    cp package.json server.js "${appdir}/"
    [ -f config.example.json ] && cp config.example.json "${appdir}/"
    [ -f .env.example ] && cp .env.example "${appdir}/"

    # Install CLI wrapper / launcher
    install -Dm755 "${srcdir}/openhamclock.sh" "${pkgdir}/usr/bin/${_pkgname}"

    # Install systemd services (system and user session)
    install -Dm644 "${srcdir}/openhamclock.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm644 "${srcdir}/openhamclock-user.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"

    # Install desktop entry
    install -Dm644 "${srcdir}/openhamclock.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Install application icons
    if [ -f "public/icons/icon-512.png" ]; then
        install -Dm644 "public/icons/icon-512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    fi
    if [ -f "public/icons/icon-192.png" ]; then
        install -Dm644 "public/icons/icon-192.png" "${pkgdir}/usr/share/icons/hicolor/192x192/apps/${_pkgname}.png"
    fi
    if [ -f "public/favicon.ico" ]; then
        install -Dm644 "public/favicon.ico" "${pkgdir}/usr/share/pixmaps/${_pkgname}.ico"
    fi

    # Install default configuration template in /etc
    install -Dm644 "${srcdir}/openhamclock.env" "${pkgdir}/etc/${_pkgname}/${_pkgname}.env"

    # Install license and documentation
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    if [ -d docs ]; then
        mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/docs"
        cp -a docs/* "${pkgdir}/usr/share/doc/${pkgname}/docs/"
    fi
}
