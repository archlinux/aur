# caelestia-shell

# Maintainer: Soramane <soramane32 at gmail dot com>

pkgname='caelestia-shell-git'
pkgver=r1110.b52822f
pkgrel=1
pkgdesc='The desktop shell for the Caelestia dotfiles'
arch=('x86_64')
url='https://github.com/caelestia-dots/shell'
license=('GPL-3.0-only')
depends=('caelestia-cli' 'quickshell-git' 'ddcutil' 'brightnessctl' 'app2unit' 'cava' 'networkmanager'
         'lm_sensors' 'fish' 'aubio' 'libpipewire' 'glibc' 'gcc-libs' 'ttf-material-symbols-variable' 'power-profiles-daemon'
         'ttf-rubik-vf' 'ttf-cascadia-code-nerd' 'grim' 'swappy' 'libqalculate' 'wayland' 'bash' 'qt6-declarative')
makedepends=('git' 'gcc' 'wayland-protocols')
provides=('caelestia-shell')
conflicts=('caelestia-shell')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}/assets/cpp"

    g++ $CXXFLAGS -std=c++17 -Wall -Wextra -I/usr/include/pipewire-0.3 -I/usr/include/spa-0.2 -I/usr/include/aubio -o beat_detector beat-detector.cpp -lpipewire-0.3 -laubio $LDFLAGS

    wayland-scanner client-header < /usr/share/wayland-protocols/unstable/idle-inhibit/idle-inhibit-unstable-v1.xml > idle-inhibitor.h
    wayland-scanner private-code < /usr/share/wayland-protocols/unstable/idle-inhibit/idle-inhibit-unstable-v1.xml > idle-inhibitor.c
    gcc $CFLAGS -o idle-inhibitor.o -c idle-inhibitor.c
    g++ $CXXFLAGS -o inhibit_idle idle-inhibitor.cpp idle-inhibitor.o -lwayland-client $LDFLAGS
    rm idle-inhibitor.{h,c,o}
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm755 ./assets/cpp/beat_detector "$pkgdir"/usr/lib/caelestia/beat_detector
    rm ./assets/cpp/beat_detector

    install -Dm755 ./assets/cpp/inhibit_idle "$pkgdir"/usr/lib/caelestia/inhibit_idle
    rm ./assets/cpp/inhibit_idle

    install -dm755 "$pkgdir"/etc/xdg/quickshell/caelestia
    cp -r ./* "$pkgdir"/etc/xdg/quickshell/caelestia/
}
