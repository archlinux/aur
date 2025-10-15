# Maintainer: z3n <z3nlabs at proton dot me>

pkgname=fcp-support-git
_pkgname=fcp-support
pkgver=r21.edae476
pkgrel=1
pkgdesc="Focusrite Control Protocol user-space driver for Scarlett 4th Gen big models (16i16, 18i16, 18i20)"
arch=('x86_64' 'i686')
url="https://github.com/geoffreybennett/fcp-support"
license=('GPL-3.0-or-later')
depends=(
    'alsa-lib'
    'systemd-libs'
    'openssl'
    'zlib'
    'json-c'
    'libcap'
)
makedepends=(
    'gcc'
    'make'
    'git'
    'pkgconf'
)
optdepends=(
    'alsa-scarlett-gui-git: GUI for controlling Focusrite interfaces'
    'scarlett4-firmware: Firmware files for Scarlett 4th Gen (required for first-time setup)'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
install=$pkgname.install
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    # Get version from git tags
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"

    # Build with proper version string and PREFIX
    VERSION="$(git describe --abbrev=4 --dirty --always --tags 2>/dev/null || echo 'Unknown')" \
    PREFIX=/usr \
    make
}

package() {
    cd "$srcdir/$_pkgname"

    # Install to /usr instead of /usr/local
    make install \
        PREFIX=/usr \
        DESTDIR="$pkgdir"
}
