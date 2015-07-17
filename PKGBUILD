pkgname=terminator-gtk3-bzr
pkgver=r1561
pkgrel=1
pkgdesc='GTK3 porting branch for terminal emulator that supports tabs and grids GTK3'
arch=('any')
url='https://code.launchpad.net/~gnome-terminator/terminator/gtk3'
license=('GPL2')
depends=('vte3' 'pygtk' 'xdg-utils' 'python2-notify' 'python2-gobject' 'libkeybinder3')
makedepends=('bzr' 'desktop-file-utils' 'gettext' 'intltool')
conflicts=('terminator')
install='terminator.install'
source=("${pkgname}::bzr+lp:terminator/gtk3")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s" "$(bzr revno)"
}

build() {
    cd "${srcdir}/${pkgname}"

    # python2 fix
    for file in terminatorlib/{,plugins/}*.py; do
        sed -i 's_#!/usr/bin/python_#!/usr/bin/python2_' ${file}
        sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' ${file}
    done

    python2 setup.py build
}

package() {
    cd "${srcdir}/${pkgname}"

    python2 setup.py install --skip-build --root="${pkgdir}"

    rm -f "${pkgdir}/usr/share/icons/hicolor/icon-theme.cache"
}

