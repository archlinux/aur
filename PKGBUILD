# Maintainer: Mark Collins <tera_1225 hat hotmail ðot com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Stephan Conrad <stephan@conrad.pics>

# Also based on libmodsecurity Extra PKGBUILD by
#   Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=libmodsecurity-git
_name=modsecurity
pkgver=v3.0.14.r191.gc3e31de
pkgrel=1
pkgdesc='A cross platform web application firewall engine for Apache, IIS and Nginx, git HEAD'
arch=('x86_64')
url='https://github.com/SpiderLabs/ModSecurity'
license=('Apache-2.0')
depends=(
    'curl'
    'gcc-libs'
    'geoip'
    'glibc'
    'libgcc'
    'libmaxminddb'
    'libstdc++'
    'libxml2'
    'lmdb'
    'luajit'
    'pcre2'
    'ssdeep'
    'yajl'
)
makedepends=('git')
provides=("libmodsecurity")
source=(
    "${_name}::git+$url"
    'libxml-includes.patch'
)
sha256sums=('SKIP'
            '9fb9129d2013e17c5b64890957d2e4c7ed5e43ecea4fb2ce3f9dfe9752c81319')
install="${pkgname}.install"

pkgver() {
    cd "${srcdir}/${_name}"
    git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_name}"
    git submodule init
    git submodule update
    sed -e 's/luajit-2.0/luajit-2.1/g' \
        -e 's/LUA_POSSIBLE_LIB_NAMES="/LUA_POSSIBLE_LIB_NAMES="luajit /g' \
        -i build/lua.m4
    patch -p1 -i ../libxml-includes.patch
}


build() {
    cd "${srcdir}/${_name}"
    ./build.sh
    ./configure \
        --prefix=/usr \
        --with-lmdb \
        --with-libxml \
        --with-lua \
        --with-pcre2 \
        --with-ssdeep \
        --disable-examples
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make
}

package() {
    cd "${srcdir}/${_name}"
    make DESTDIR="$pkgdir" install
}
