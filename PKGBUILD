# Maintainer: Dimitrije Randjelovic <m1z23r@gmail.com>
pkgname=nikode
pkgver=3.0.10
pkgrel=1
pkgdesc="A modern API client for developers"
arch=('x86_64')
url="https://github.com/m1z23r/nikode"
license=('GPL-3.0-or-later')
depends=('c-ares' 'ffmpeg' 'gtk3' 'libevent' 'libxslt' 'minizip' 'nss' 're2' 'snappy')
makedepends=('nodejs' 'npm' 'libxcrypt-compat')
optdepends=('libnotify: desktop notifications'
            'libappindicator-gtk3: system tray support')
provides=('nikode')
conflicts=('nikode-bin' 'nikode-git')
options=(!strip !debug)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')  # Run: updpkgsums

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Install dependencies
    npm ci

    # Build pacman package using Makefile target
    make build-pacman
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Extract the built pacman package (excluding pacman metadata files)
    tar -xf dist-electron/*.pacman -C "${pkgdir}" --exclude='.PKGINFO' --exclude='.INSTALL' --exclude='.MTREE' --exclude='.BUILDINFO'

    # Fix permissions
    chmod -R g-w "${pkgdir}"
}
