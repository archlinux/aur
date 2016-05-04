# Contributors: Jonathan Squirawski <sky@sky-co.de>, Andrew Dunai <andrew@dun.ai>
pkgname=lib32-eatmydata
pkgver=105
pkgrel=3
pkgdesc='library and utilities designed to disable fsync and friends'
arch=('i686' 'x86_64')
url='https://launchpad.net/libeatmydata'
license=('GPL3')
depends=('gcc-multilib')
conflicts=('eatmydata')
source=("https://launchpad.net/libeatmydata/trunk/release-${pkgver}/+download/libeatmydata-${pkgver}.tar.gz"
        'eatmydata.patch')
md5sums=('6681166466e589eb0d71177709361256'
         'c6715ae1204201921af34a374886eea0')

prepare() {
    cd libeatmydata-${pkgver}
    patch -Np1 -i ${srcdir}/eatmydata.patch
}

build() {
    cd libeatmydata-${pkgver}
    ./configure --prefix=/usr --libexecdir=/usr/lib/libeatmydata --build=i686-pc-linux-gnu "CFLAGS=-m32" "CXXFLAGS=-m32" "LDFLAGS=-m32" --libdir=/usr/lib32/ --libexecdir=/usr/lib32/libeatmydata/
    make
}

package(){
    cd libeatmydata-${pkgver}
    sed -i eatmydata -e 's/\/usr\/lib/\/usr\/lib32/g'
    make DESTDIR="${pkgdir}" install
    mv ${pkgdir}/usr/bin/eatmydata ${pkgdir}/usr/bin/eatmydata32
}
