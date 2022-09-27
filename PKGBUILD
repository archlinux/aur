# Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Contributor: fatalis <fatalis@fatalis.pw>

pkgname=scream-git
pkgver=4.0.r162.aa11ca9
pkgrel=1
pkgdesc='A Scream audio receiver using Pulseaudio, ALSA, JACK or stdout as audio output (git version)'
url='https://github.com/duncanthrax/scream'
arch=('x86_64')
depends=('jack' 'libpulse' 'libsoxr' 'alsa-lib')
makedepends=('cmake' 'git' 'ninja')
provides=('scream')
conflicts=('scream')
license=('custom:MS-PL')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}"/${pkgname%-git}
    printf "%s.r%s.%s" "$(git describe --abbrev=0 --tags)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -S ${pkgname%-git}/Receivers/unix -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr"

    cmake --build build
}

package() {
    cmake --install build
    install -Dm644 ${pkgname%-git}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
