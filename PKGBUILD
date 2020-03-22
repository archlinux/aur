# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

pkgname=xapps-git
pkgver=1.6.9.r9.gd6203cb
pkgrel=2
pkgdesc="Common library for X-Apps project"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/${pkgname%-git}"
license=('GPL')
depends=('libgnomekbd')
makedepends=('git' 'meson' 'samurai' 'gobject-introspection' 'python-gobject' 'python2-gobject' 'vala')
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
    for _python in python3 python2; do
        while read -rd '' _file; do
            _destdir="$(dirname "${_file#${pkgdir}}")"
            ${_python} -m compileall -d "${_destdir}" "${_file}"
            ${_python} -O -m compileall -d "${_destdir}" "${_file}"
        done < <(find "${pkgdir}"/usr/lib/${_python}* -name '*.py' -print0)
    done
}
