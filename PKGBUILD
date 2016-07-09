# Maintainer: Nate Simon <aurpkg (at natesimon.net)>

pkgname=xplayer-git
_pkgbasename=xplayer
pkgver=1.0.7.r0.gcd31180
pkgrel=1
pkgdesc="Simple media player. X-Apps Project (git version)."
arch=('i686' 'x86_64')
license=('GPL')
depends=('clutter-gtk' 'clutter-gst' 'xplayer-plparser-git'
    'desktop-file-utils' 'iso-codes' 'yelp-xsl'
    'libpeas' 'gsettings-desktop-schemas'
    'python2-gobject' 'gst-plugins-base' 'gst-plugins-good')
makedepends=('git' 'gnome-common' 'gtk-doc' 'gobject-introspection')
optdepends=('gst-libav: Extra media codec support')
provides=($_pkgname)
conflicts=(${_pkgbasename})
url='https://github.com/linuxmint/xplayer'
install=xplayer.install

source=("${pkgname}::git+https://github.com/linuxmint/${_pkgbasename}.git")
md5sums=('SKIP')

pkgver() {
    cd ${srcdir}/${pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${srcdir}/${pkgname}
    sed -i 's/PYTHON=python/PYTHON=python2/g' py-compile

    # https://github.com/linuxmint/xplayer/issues/22
    # I don't think there is a switch to disable grilo, so just bump the required
    # version to something that obviously won't be satisfied.
    sed -i 's/GRILO_REQS=0.2.0/GRILO_REQS=0.9.0/g' configure.ac

    ./autogen.sh --prefix="/usr" \
        --localstatedir="/var" \
        --libexecdir="/usr/lib/${_pkgbasename}"
    make
}

package(){
    cd ${srcdir}/${pkgname}
    make DESTDIR="$pkgdir/" install
}

