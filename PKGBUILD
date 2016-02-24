pkgname=('i3ipc-glib-git')
srcname='i3ipc-glib'
pkgver='r1'
pkgrel='1'
pkgdesc='A C interface library to i3wm'
arch=('i686' 'x86_64')
url='https://github.com/acrisci/i3ipc-glib'
license=('GPL3')

depends=('glib2' 'json-glib')
optdepends=(
    'i3ipc-lua: Lua language bindings'
    'i3ipc-python: Python language bindings'
    'i3ipc-gjs: JavaScript language bindings'
)
makedepends=('libxcb' 'xcb-proto' 'gobject-introspection' 'gtk-doc')
provides=('i3ipc-glib')
conflicts=('i3ipc-glib')

source=("${srcname}::git+https://github.com/acrisci/i3ipc-glib.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${srcname}"

    printf 'r%s.%s.%s\n' \
        "$( git rev-list --count 'HEAD' )" \
        "$( git log --max-count='1' --pretty='format:%ct' )" \
        "$( git rev-parse --short 'HEAD' )"
}

build() {
    cd "${srcdir}/${srcname}"

    gtkdocize
    autoreconf --install --force --warnings='all'
    ./configure --prefix='/usr'

    make
}

package() {
    cd "${srcdir}/${srcname}"

    make DESTDIR="${pkgdir}" install
}
