# Maintainer: revel <revelΘmuub·net>
# Contributor: Jeremy Cowgar <jeremy@cowgar.com>

pkgname=falcon
pkgver=0.9.6.8
pkgrel=5
pkgdesc='An Open Source, simple, fast and powerful programming language, easy to learn and to feel comfortable with, and a scripting engine ready to empower mission-critical multithreaded applications.'
arch=('i686' 'x86_64')
url='http://falconpl.org'
license=('GPL2'
         'custom:FPLLv1.1')
depends=('bison' 'gtk2' 'gd' 'curl' 'dbus' 'sdl_image' 'sdl_ttf' 'sdl_mixer' 'sqlite' 'mariadb-libs' 'postgresql-libs')
makedepends=('cmake')
source=("http://falconpl.org/project_dl/_official_rel/Falcon-$pkgver.tgz"
#        'mongodb-module.patch'
        )
md5sums=('8435f6f2fe95097ac2fbe000da97c242')
sha256sums=('f4b00983e7f91a806675d906afd2d51dcee048f12ad3af4b1dadd92059fa44b9')

prepare() {
    cd "Falcon-$pkgver"
#    patch -p1 -i ../mongodb-module.patch
    sed '20 i #include <server/mysql.h>' -i modules/native/dbi/mysql/mysql_mod.cpp
}

build() {
    cd "Falcon-$pkgver"
    [ -d build ] || mkdir build
    cd build

    # mongodb module disabled due to compilation problems
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DFALCON_BUILD_MONGODB=Off

    make
}

package() {
    cd "Falcon-$pkgver/build"
    make install DESTDIR="$pkgdir/"
    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/falcon/LICENSE"
}
