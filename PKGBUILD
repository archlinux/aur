#-*-shell-script-*-
# Maintainer: Andrew Dabrowski <dabrowsa@indiana.edu>

pkgname=python2-auale
pkgver=1.0.0
pkgrel=1
pkgdesc="Plays the African board game Oware."
arch=('any')
url="https://github.com/joansalasoler/auale"
license=('GPL')
groups=()
depends=('python2' 'python' 'python2-gobject' 'java-runtime' 'dconf'  )
makedepends=('git' 'python2-setuptools' )
source=("git+https://github.com/joansalasoler/auale.git")
md5sums=('SKIP')
pydir="/usr/share/$pkgname"
install="updateSchemas"


pkgver() {
    ver=`git describe --tags`
    pkgver=`echo $ver | sed "s/-/_/g"`
}

build() {
    cd "$srcdir/auale/src/auale"
    python2 setup.py build || return 1
    echo "#\!/bin/sh" > script
    echo "python2 $pydir" >> script
}

package() {
    cd "$srcdir/auale"
    mkdir -p ${pkgdir}/usr/share/glib-2.0/schemas/
    cp res/share/glib-2.0/schemas/com.joansala.auale.gschema.xml "${pkgdir}/usr/share/glib-2.0/schemas/"

    cd "src/auale"
    python2 setup.py install --optimize=1 --install-lib="$pydir" --root="${pkgdir}" || return 1
    install -Dm755 script "${pkgdir}/usr/bin/${pkgname}"
}

