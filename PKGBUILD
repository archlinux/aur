# caelestia-shell

# Maintainer: Soramane <soramane32 at gmail dot com>

pkgname='caelestia-shell'
pkgver=2.3.0
pkgrel=1
pkgdesc='The desktop shell for the Caelestia dotfiles'
arch=('x86_64' 'aarch64')
url='https://github.com/caelestia-dots/shell'
license=('GPL-3.0-only')
depends=(
    'caelestia-cli'
    'quickshell-git'
    'glibc'
    'gcc-libs'

    # Brightness
    'ddcutil'
    'brightnessctl'

    # Services
    'libcava'
    'networkmanager'
    'lm_sensors'
    'aubio'
    'libpipewire'
    'libqalculate'
    'power-profiles-daemon'

    # Fonts
    'ttf-material-symbols-variable'
    'ttf-rubik-vf'
    'ttf-cascadia-code-nerd'

    # Qt modules
    'qt6-base'
    'qt6-declarative'
    'qt6-imageformats'

    # Extra functionality
    'swappy'
    'fish'
    'bash'
)
optdepends=(
    'asdbctl: controlling the brightness of Apple Studio Displays'
    'fprintd: fingerprint unlock for the lock screen'
    'howdy-next: face unlock for the lock screen'
)
makedepends=('cmake' 'ninja' 'qt6-shadertools')
provides=($pkgname)
conflicts=($pkgname-git)
source=("$url/releases/download/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('1233e7317c689d801ec095b5fd7290502e5f6ea214ef14b02375d35b5542e78e')

build() {
    cd "${srcdir}/release"

    cmake -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX=/ \
        -DVERSION=$pkgver \
        -DGIT_REVISION="$(cat REVISION)" \
        -DDISTRIBUTOR="AUR (package: $pkgname)"
    cmake --build build
}

package() {
    cd "${srcdir}/release"

    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
