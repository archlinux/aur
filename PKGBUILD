# Maintainer: Jat <chat@jat.email>

_pkgname='obs-multi-rtmp'
pkgname="${_pkgname}-git"
pkgver=r207.854c78e
pkgrel=1
pkgdesc='Multiple RTMP outputs plugin. Git version.'
arch=('x86_64')
url='https://github.com/sorayuki/obs-multi-rtmp'
license=('GPL')
depends=('obs-studio')
makedepends=('git' 'cmake' 'ninja')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${srcdir}/${_pkgname}
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"

    cmake -S . -B build -G Ninja -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/usr -DLINUX_PORTABLE=OFF

    cmake --build build --config RelWithDebInfo

    cmake --install build --config RelWithDebInfo --prefix release

    # generate .deb package, unnecessary
    # cmake --build build --config RelWithDebInfo -t package
}

package() {
    cp -aT "${srcdir}/${_pkgname}/release" "${pkgdir}/usr"
}
