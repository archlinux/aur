# Maintainer: Eric Schulte <eschulte@grammatech.com>
#
# Based off of the souffle-git pkgfile by
# Sam Linnfer <littlelightlittlefire@gmail.com>
pkgname=souffle
pkgver=1.5.1
pkgrel=1
pkgdesc="Soufflé is a translator of declarative Datalog programs into the C++ language"
arch=('any')
url="https://github.com/grammatech/ddisasm"
license=('UPL')
groups=()
depends=('sqlite' 'python' 'zlib')
makedepends=('autoconf' 'automake' 'bison' 'doxygen' 'flex' 'sqlite' 'libtool' 'jdk8-openjdk' 'pkg-config' 'python' 'zlib' 'mcpp')
provides=('souffle')
conflicts=('souffle-git')
backup=()
options=()
install=
noextract=()
source=('https://github.com/souffle-lang/souffle/archive/1.5.1.zip')
md5sums=('e8d9f1f1d0d69703940e9203d834108a')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    sed -i "s/git describe --tags --always/echo ${pkgver}/" configure.ac
    sh ./bootstrap
    ./configure --prefix=/usr
    # When necessary, fixup deprecated form in src/parser.yy and rebuild.
    make -j || (bison --update src/parser.yy && make)
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir/" install
}
