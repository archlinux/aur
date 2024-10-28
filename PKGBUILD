# Maintainer: Emily Maré (emileet) <emileet@plsnobully.me>

_newpkgname=DistroAV
pkgname=obs-ndi-git
_pkgname=obs-ndi
pkgver=6.0.0.r0.g9871ed6
pkgrel=1
pkgdesc="Network A/V in OBS Studio with NewTek's NDI technology"
arch=('x86_64')
license=('GPL2')
url="https://github.com/DistroAV/DistroAV"
provides=('obs-ndi')
conflicts=('obs-ndi-bin')
depends=('avahi' 'libndi' 'obs-studio' 'sndio')
makedepends=('git' 'cmake')
install="${_pkgname}.install"
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${_newpkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${_newpkgname}

    cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_FRONTEND_API=ON -DENABLE_QT=ON --compile-no-warning-as-error
    cmake --build build
}

package() {
    cd ${_newpkgname}

    install -Dm755 build/distroav.so ${pkgdir}/usr/lib/obs-plugins/distroav.so

    install -d ${pkgdir}/usr/share/obs/obs-plugins/distroav/locale
    cp -a data/locale/* ${pkgdir}/usr/share/obs/obs-plugins/distroav/locale

    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/distroav/LICENSE
}
