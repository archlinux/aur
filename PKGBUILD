# Maintainer: Emily Maré (emileet) <emileet@plsnobully.me>

pkgname=distroav-git
_pkgname=distroav
pkgver=6.0.0.r0.g9871ed6
pkgrel=1
pkgdesc="Network A/V in OBS Studio with NewTek's NDI technology"
arch=('x86_64')
license=('GPL2')
url="https://github.com/DistroAV/DistroAV"
provides=('obs-ndi' 'distroav')
conflicts=('obs-ndi-bin' 'distroav')
depends=('avahi' 'libndi' 'obs-studio' 'sndio')
makedepends=('git' 'cmake')
install="${_pkgname}.install"
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd DistroAV
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd DistroAV

    cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_FRONTEND_API=ON -DENABLE_QT=ON --compile-no-warning-as-error
    cmake --build build
}

package() {
    cd DistroAV

    install -Dm755 build/${_pkgname}.so ${pkgdir}/usr/lib/obs-plugins/${_pkgname}.so

    install -d ${pkgdir}/usr/share/obs/obs-plugins/${_pkgname}/locale
    cp -a data/locale/* ${pkgdir}/usr/share/obs/obs-plugins/${_pkgname}/locale

    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
}
