# Maintainer: Christian Schendel <doppelhelix@gmail.com>
# shellcheck disable=2034,2154,2164

pkgname=fortune-mod-de-git
pkgdesc="Fortune Cookies in German, from the Debian project"
pkgver=0.36.1.r0.gdf2bbca
pkgrel=4
url="https://salsa.debian.org/debian/fortunes-de"
arch=('any')
groups=('fortune-mods')
license=('GPL-2.0-or-later')
makedepends=(
        recode
        git
)
depends=(
        fortune-mod
)
options=('!strip')
source=("${pkgname%-git}::git+https://salsa.debian.org/debian/fortunes-de.git")
md5sums=('SKIP')

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
pkgver() {
        cd "$srcdir/${pkgname%-git}"
        git describe --long | sed 's/^debian\///;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
        cd "$srcdir/${pkgname%-git}"
        PREFIX=$(pwd)/build \
        DOCDIR=usr/share/doc/${pkgname%-git} \
        BINDIR=usr/bin \
        FORTUNESDIR=usr/share/fortune \
                ./install.sh -utf8
}

package() {
        cd "${srcdir}/${pkgname%-git}/build"
        rm -r {man,usr/bin}
        cp -r ./* "${pkgdir}"
        cd "$pkgdir/usr/share/fortune/de"
        mv debian debian-de
        mv debian.dat debian-de.dat
        rm ./*.u8
        mv ./* ..
        cd "$pkgdir/usr/share/fortune"
        rm -r de
}

# vim: set ts=4 sw=4 et:
