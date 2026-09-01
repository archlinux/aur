# Maintainer: deeadly (DC only)

pkgname='midnight-shell-git'
_pkgname='midnight-shell'
pkgver=r3087.bb7b565
pkgrel=1
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
    "qt6-m3shapes"
    "qt6-m3shapes-git"
)
conflicts=(
    "${_pkgname}"
    'dim-caelestia-shell-git'
    'caelestia-shell'
    'caelestia-shell-git'
    'noctalia-qs'
    'noctalia-qs-git'
    'dim-caelestia-shell-git-debug'
    'qt6-m3shapes'
    'qt6-m3shapes-git'
    'polkit-gnome'
)
replaces=('dim-caelestia-shell-git')

source=("${pkgname}::git+https://github.com/dim-ghub/midnight-shell.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"

    cmake -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX=/ \
        -DVERSION="$(git describe --tags --abbrev=0 2>/dev/null | sed 's/^v//')" \
        -DGIT_REVISION="$(git rev-parse --short HEAD)" \
        -DDISTRIBUTOR="AUR (package: $pkgname)"
    cmake --build build
}

package() {
    cd "${srcdir}/${pkgname}"

    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
