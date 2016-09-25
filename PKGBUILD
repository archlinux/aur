# Maintainer: Ben Iofel <iofelben@gmail.com>
# Contributor: Patrick Griffis <tingping@tingping.se>

_gitname='vaccine'
pkgname=vaccine-git
pkgver=v0.0.1.r14.g1302293
pkgrel=1
pkgdesc="A GTK+3 4chan client for the linux desktop"
arch=('i686' 'x86_64')
url="https://github.com/VaccineApp/vaccine"
license=('GPL3')
depends=('gtk3' 'gtksourceview3' 'libsoup' 'json-glib' 'libgee' 'gst-plugins-bad')
makedepends=('git' 'meson' 'vala' 'appstream-glib')
install='vaccine.install'
provides=('vaccine')
conflicts=('vaccine')
source=('git://github.com/VaccineApp/vaccine.git'
        'git://github.com/VaccineApp/bayes-glib.git')
md5sums=('SKIP' 'SKIP')

pkgver() {
    cd "$_gitname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_gitname"
    git submodule init
    git config submodule.bayes-glib.url $srcdir/bayes-glib
    git submodule update
}

build() {
    cd "$_gitname"
    mkdir build
    meson --prefix=/usr build
    ninja -C build
}

package() {
    cd "$_gitname"
    DESTDIR="$pkgdir" ninja -C build install
}
