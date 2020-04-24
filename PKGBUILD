# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

pkgname=xapps-git
pkgver=1.8.0.r3.g5b59768
pkgrel=1
pkgdesc="Common library for X-Apps project"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/${pkgname%-git}"
license=('GPL')
depends=('libdbusmenu-gtk3' 'libgnomekbd')
makedepends=('git' 'meson' 'samurai' 'gobject-introspection' 'python-gobject' 'vala')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}"/${pkgname%-git}

    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    mkdir -p "${srcdir}"/${pkgname%-git}/build
    cd "${srcdir}"/${pkgname%-git}/build

    meson --prefix=/usr \
          --libexecdir=lib \
          --buildtype=plain \
          ..
    samu
}

package(){
    cd "${srcdir}"/${pkgname%-git}/build

    DESTDIR="${pkgdir}" samu install
    # rm useless scripts
    rm -r "${pkgdir}"/usr/bin

    # byte-compile python modules since meson does not implement autotools'
    # py-compile.
    # This is kind of ugly but removes traces of the build root.
    while read -rd '' _file; do
        _destdir="$(dirname "${_file#${pkgdir}}")"
        python -m compileall -d "${_destdir}" "${_file}"
        python -O -m compileall -d "${_destdir}" "${_file}"
    done < <(find "${pkgdir}"/usr/lib/python3* -name '*.py' -print0)
}
