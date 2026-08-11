# Maintainer: deeadly (DC only)

pkgname='dim-caelestia-shell-git'
_pkgname='caelestia-shell'
pkgver=r3078.7a98d03
pkgrel=1
pkgdesc="DiM's fork of Caelestia-Shell"
arch=('x86_64' 'aarch64')
url='https://github.com/dim-ghub/caelestia-shell'
license=('GPL-3.0-only')
depends=('caelestia-cli' 'quickshell-git' 'ddcutil' 'brightnessctl' 'libcava' 'networkmanager'
         'lm_sensors' 'fish' 'aubio' 'libpipewire' 'glibc' 'gcc-libs' 'ttf-material-symbols-variable' 'power-profiles-daemon'
         'ttf-rubik-vf' 'ttf-cascadia-code-nerd' 'swappy' 'libqalculate' 'bash' 'qt6-base' 'qt6-declarative' 'qt6-imageformats' 'qt6-multimedia' 'protobuf')
makedepends=('git' 'cmake' 'ninja' 'qt6-shadertools')
provides=($_pkgname)
conflicts=($_pkgname "$_pkgname-git" 'noctalia-qs' 'noctalia-qs-git')
source=("${pkgname}::git+https://github.com/dim-ghub/caelestia-shell.git")
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
        -DVERSION="$(git describe --tags --abbrev=0 | sed 's/^v//')" \
        -DGIT_REVISION="$(git rev-parse --short HEAD)" \
        -DDISTRIBUTOR="AUR (package: $pkgname)"
    cmake --build build
}

package() {
    cd "${srcdir}/${pkgname}"

    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
