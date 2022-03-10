# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@cinnarch.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=cjs-git
pkgver=5.2.0.r2.g66962c83
pkgrel=1
pkgdesc="Javascript Bindings for Cinnamon"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/${pkgname%-git}"
license=('GPL')
depends=('dbus-glib' 'gtk3' 'gobject-introspection-runtime' 'js78')
makedepends=('git' 'meson' 'samurai' 'gobject-introspection')
checkdepends=('xorg-server-xvfb')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"

    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    mkdir -p "${srcdir}/${pkgname%-git}/builddir"
    cd "${srcdir}/${pkgname%-git}/builddir"

    meson --prefix=/usr \
          --libexecdir=/usr/lib \
          --buildtype=plain \
          -Dinstalled_tests=false \
          ..

    samu
}

check() {
    cd "${srcdir}/${pkgname%-git}/builddir"

    # Needs a display
    xvfb-run meson test --print-errorlogs
}

package() {
    cd "${srcdir}/${pkgname%-git}/builddir"

    DESTDIR="${pkgdir}" samu install
}
