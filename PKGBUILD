# Contributor: Andrew Querol <andrew@querol.me>
# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

_name=chrome-gnome-shell
pkgname=$_name-git
pkgver=7.2.r56.gaa9d96b
pkgrel=1
pkgdesc="Native connector for integration with extensions.gnome.org"
arch=('any')
url="https://wiki.gnome.org/Projects/GnomeShellIntegrationForChrome"
license=('GPL')
depends=('gnome-shell' 'python-requests')
makedepends=('git' 'cmake' 'jq')
provides=("$_name")
replaces=('gs-chrome-connector') # Old name
conflicts=('gs-chrome-connector' "$_name")
source=("git+https://git.gnome.org/browse/chrome-gnome-shell")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_name"
    
    # git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
    _tag=$(git describe --abbrev=0)
    v=$(grep 'set(PROJECT_VERSION' CMakeLists.txt | cut -d'"' -f2)
    r="$(git rev-list --count $_tag..HEAD)"
    h="$(git rev-parse --short HEAD)"
    printf $v.r$r.g$h
}

prepare() {
    cd "$srcdir/$_name"
    mkdir -p 'build'
}

build() {
    cd "$srcdir/$_name/build"
    cmake                                \
        -DCMAKE_INSTALL_PREFIX=/usr      \
        -DCMAKE_INSTALL_LIBDIR=lib       \
        -DBUILD_EXTENSION=OFF ../
}

package() {
    cd "$srcdir/$_name/build"
    make DESTDIR="$pkgdir" install
}
