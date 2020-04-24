# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueria <alexfilgueira@antergos.com>
# Contributor:  Jan de Groot <jan@archlinux.org>

pkgname=cinnamon-desktop-git
pkgver=4.4.1.r7.gf2c6cb7
pkgrel=1
pkgdesc="Library with common API for various Cinnamon modules"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/${pkgname%-git}"
license=('GPL' 'LGPL')
depends=('accountsservice' 'gtk3' 'libxkbfile' 'libpulse')
makedepends=('git' 'meson' 'samurai' 'gobject-introspection' 'intltool')
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git"
        "config.diff")
sha512sums=('SKIP'
            '556e5d3781d985a031f0b08dd4e972ebc37058e0862fec5935df7dfbf7dfecebeccd10e78136e75d9fa5f184b8201cb0bc90154fca419861d9d33ac9645cf983')

pkgver() {
    cd "${srcdir}"/${pkgname%-git}

    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}"/${pkgname%-git}

    # Adjust configuration
    patch -Np1 -i ../config.diff
}

build() {
    mkdir -p "${srcdir}"/${pkgname%-git}/build
    cd "${srcdir}"/${pkgname%-git}/build

    meson --prefix=/usr --buildtype=plain ..
    samu
}

package() {
    cd "${srcdir}"/${pkgname%-git}/build

    DESTDIR="${pkgdir}" samu install
    # rm legacy migration script (cinnamon 2.4) and its package dependency on python
    rm -rf "${pkgdir}"/usr/bin
}
