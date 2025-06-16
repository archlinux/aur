# caelestia-shell

# Maintainer: Soramane <soramane32 at gmail dot com>

pkgname='caelestia-shell-git'
pkgver=r681.2f9179d
pkgrel=1
pkgdesc='The desktop shell for the Caelestia dotfiles'
arch=('x86_64')
url='https://github.com/caelestia-dots/shell'
license=('GPL-3.0-only')
depends=('caelestia-cli' 'quickshell' 'ddcutil' 'brightnessctl' 'app2unit' 'cava' 'networkmanager' 'bluez-utils' 'lm_sensors' 'fish' 'curl' 'aubio' 'libpipewire' 'glibc' 'qt6-declarative' 'gcc-libs' 'ttf-material-symbols-variable')
makedepends=('git' 'gcc')
provides=('caelestia-shell')
conflicts=('caelestia-shell')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}/assets"
    g++ $CXXFLAGS -std=c++17 -Wall -Wextra -I/usr/include/pipewire-0.3 -I/usr/include/spa-0.2 -I/usr/include/aubio -o beat_detector beat_detector.cpp -lpipewire-0.3 -laubio $LDFLAGS
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm755 ./assets/beat_detector "$pkgdir"/usr/lib/caelestia/beat_detector
    rm ./assets/beat_detector

    install -dm755 "$pkgdir"/etc/xdg/quickshell/caelestia
    cp -r ./* "$pkgdir"/etc/xdg/quickshell/caelestia/
}
