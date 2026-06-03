# Maintainer: Capricornus007 <Capricornus007 at proton dot me>
# Co-Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueria <alexfilgueira@antergos.com>
# Contributor:  Jan de Groot <jan@archlinux.org>

pkgname=cinnamon-desktop-git
pkgver=6.7.1.unstable.r1.g8cc65c7
pkgrel=1
pkgdesc="Library with common API for various Cinnamon modules"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/${pkgname%-git}"
license=('GPL' 'LGPL')
depends=('accountsservice' 'gtk3' 'libxkbfile' 'libpulse')
makedepends=('git' 'meson' 'samurai' 'gobject-introspection' 'intltool')
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}"/${pkgname%-git}

    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}"/${pkgname%-git}
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
