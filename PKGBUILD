# Maintainer: deeadly (DC only)

pkgname='midnight-shell-git'
_pkgname='midnight-shell'
pkgver=2.4.0.r580.g61e5fab
pkgrel=2
pkgdesc="DiM's fork of Caelestia-Shell"
arch=('x86_64' 'aarch64')
url='https://github.com/dim-ghub/midnight-shell.git'
license=('GPL-3.0-only')

depends=(
    'bash'
    'fish'
    'glibc'
    'gcc-libs'
    'qt6-base'
    'qt6-declarative'
    'qt6-imageformats'
    'qt6-multimedia'
    'protobuf'
    'midnight-cli'
    'quickshell-git'
    'ddcutil'
    'brightnessctl'
    'libcava'
    'networkmanager'
    'lm_sensors'
    'aubio'
    'libpipewire'
    'ttf-material-symbols-variable'
    'power-profiles-daemon'
    'ttf-rubik-vf'
    'ttf-cascadia-code-nerd'
    'swappy'
    'libqalculate'

    # Qt modules
    'qt6-m3shapes-git' # We use -git explicitly because midnight-shell provides the normal package
)

makedepends=(
    'git'
    'cmake'
    'ninja'
    'qt6-shadertools'
)

provides=(
    "${_pkgname}=${pkgver}"
    "caelestia-shell=${pkgver}"
    "caelestia-shell-git=${pkgver}"
)
conflicts=(
    "${_pkgname}"
    'dim-caelestia-shell-git'
    'caelestia-shell'
    'caelestia-shell-git'
    'noctalia-qs'
    'noctalia-qs-git'
    'dim-caelestia-shell-git-debug'
    'polkit-gnome'
)
replaces=('dim-caelestia-shell-git')

source=("${pkgname}::git+https://github.com/dim-ghub/midnight-shell.git")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}/${pkgname}"
    git fetch --tags https://github.com/caelestia-dots/shell.git
}

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
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
