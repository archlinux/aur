# caelestia-shell

# Maintainer: Soramane <soramane32 at gmail dot com>

_pkgname='caelestia-shell'
pkgname="$_pkgname-git"
pkgver=2.4.0.r0.g24aa15e
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
    'qt6-m3shapes-git' # We use -git explicitly to because midnight-shell provides the normal package

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
makedepends=('git' 'cmake' 'ninja' 'qt6-shadertools')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}"

    cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/ -DDISTRIBUTOR="AUR (package: $pkgname)"
    cmake --build build
}

package() {
    cd "${srcdir}/${pkgname}"

    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}
