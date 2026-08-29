# caelestia-shell

# Maintainer: Soramane <soramane32 at gmail dot com>

pkgname='caelestia-shell'
pkgver=2.4.0
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
    'qt6-m3shapes-git'

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
sha256sums=('af7491727ff30699698150f9f7c186089ccd171a509def332bcba1de1cb31771')

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
