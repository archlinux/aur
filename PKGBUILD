# Maintainer: Silvio Fricke <silvio.fricke@gmail.com>
# Contributor: Tom Moore <tmoore01 (at) gmail (dot) com>

_pkgname=evolution-ews
pkgname=$_pkgname-git
pkgver=3.46.0.r039.g8f0f5c6c
pkgrel=1
pkgdesc="MS Exchange integration through Exchange Web Services"
arch=('i686' 'x86_64')
license=('LGPL2.1')
url="https://wiki.gnome.org/Apps/Evolution/EWS"
depends=('libmspack' 'evolution-git')
makedepends=('intltool')
options=('!emptydirs')
conflicts=('evolution-ews')
replaces=('evolution-ews')
provides=('evolution-ews')
source=(evolution-ews::git+https://gitlab.gnome.org/GNOME/evolution-ews.git)
sha256sums=('SKIP')

pkgver() {
        cd $srcdir/$_pkgname
        git describe --long | awk -F '-' '/-/{ printf "%s.r%3.3d.%s\n", $1, $2, $3 }'
}

build() {
        cd $srcdir/$_pkgname

        [ ! -d build ] && mkdir build
        cd build

        cmake .. -G Ninja \
                -DCMAKE_INSTALL_PREFIX=/usr \
                -DLIBEXEC_INSTALL_DIR=/usr/lib/evolution \
                -DSYSCONF_INSTALL_DIR=/etc
        ninja
}

package() {
        cd $srcdir/$_pkgname/build
        DESTDIR="$pkgdir" ninja install
}

