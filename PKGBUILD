# Maintainer: Ben Iofel <iofelben@gmail.com>
# Contributor: Patrick Griffis <tingping@tingping.se>

_gitname='vaccine'
pkgname=vaccine-git
pkgver=0.0.1.r388.gf122027
pkgrel=1
pkgdesc="A GTK+3 4chan client for the linux desktop"
arch=('i686' 'x86_64')
url="https://github.com/VaccineApp/vaccine"
license=('GPL3')
depends=('gtk3' 'libsoup' 'json-glib' 'libgee' 'gst-plugins-bad')
makedepends=('git' 'automake' 'autoconf-archive' 'vala')
install='vaccine.install'
provides=('vaccine')
conflicts=('vaccine')
source=('git://github.com/VaccineApp/vaccine.git'
        'git://github.com/VaccineApp/bayes-glib.git')
md5sums=('SKIP' 'SKIP')

pkgver() {
    cd "$_gitname"

    # No tags yet..
    _ver=`autoconf -t 'AC_INIT:$2'`
    _rev=`git rev-list --count HEAD`
    _hash=`git rev-parse --short HEAD`
    echo "$_ver.r$_rev.g$_hash"
}

prepare() {
    cd "$_gitname"
    git submodule init
    git config submodule.bayes-glib.url $srcdir/bayes-glib
    git submodule update
}

build() {
    cd "$_gitname"
    ./autogen.sh --prefix=/usr --disable-debug
    make -s
}

package() {
    cd "$_gitname"
    DESTDIR="$pkgdir" make install
}
