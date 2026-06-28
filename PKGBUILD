# Maintainer: ldr <ldr at alpsmail dot de>

pkgname=soundcloudqt-git
_pkgname=soundcloudqt
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc='Touch-friendly Qt SoundCloud client'
arch=('x86_64' 'aarch64')
url='https://git.getholo.today/ldr/soundcloudqt'
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-multimedia')
makedepends=('cmake' 'git' 'ninja')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags --match 'v[0-9]*' 2>/dev/null \
        | sed 's/^v//;s/-/.r/;s/-/./' \
        || printf '0.1.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -S "${srcdir}/${_pkgname}" -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
