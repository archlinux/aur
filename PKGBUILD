# Maintainer: Eric Schulte <eschulte@grammatech.com>
#
# Based off of the souffle-git pkgfile by
# Sam Linnfer <littlelightlittlefire@gmail.com>
pkgname=souffle
pkgver=1.7.1
pkgrel=1
pkgdesc="Soufflé is a translator of declarative Datalog programs into the C++ language"
arch=('any')
url="https://github.com/souffle-lang/souffle"
license=('UPL')
groups=()
depends=('sqlite' 'python' 'zlib' 'mcpp')
makedepends=('autoconf' 'automake' 'bison' 'doxygen' 'flex' 'sqlite' 'libtool' 'jdk8-openjdk' 'pkg-config' 'python' 'zlib')
provides=('souffle')
conflicts=('souffle-git')
backup=()
options=()
install=
noextract=()
source=("https://github.com/souffle-lang/souffle/archive/${pkgver}.zip")
md5sums=('30f6420e5ce9aafca32b5c2099a89237')

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
