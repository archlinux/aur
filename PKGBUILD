# Maintainer: deeadly (DC only)

_pkgname='caelestia-shell-plugins'
pkgname="$_pkgname-git"
pkgver=2.5.0.r106.g1c72c05
pkgrel=1
pkgdesc='Caelestia Shell with the plugin system (git)'
arch=('x86_64' 'aarch64')
url='https://github.com/deeadly137/caelestia-plugins'
license=('GPL-3.0-only')
depends=(
    'caelestia-cli'
    'git'
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
    'qt6-multimedia'
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
    'unzip: extracting zipped Shimeji frame packs'
)
makedepends=('cmake' 'ninja' 'qt6-shadertools')
provides=('caelestia-shell' 'caelestia-shell-git')
conflicts=('caelestia-shell' 'caelestia-shell-git' 'midnight-shell' 'midnight-shell-git')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}"

    cmake -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX=/ \
        -DDISTRIBUTOR="AUR (package: $pkgname)"
    cmake --build build
}

package() {
    cd "${srcdir}/${pkgname}"

    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
