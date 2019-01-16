# Maintainer: int <int [ate] arcor [dot] de>
#
# NOTE: idzebra-config-2.0 contains the path of $srcdir, where the package is build.
#       So makepkg warns: "WARNING: Package contains reference to $srcdir" during package-build,
#       see https://wiki.archlinux.org/index.php/makepkg#WARNING:_Package_contains_reference_to_.24srcdir.
#       But this values are only used in a dead if-branch in idzebra-config-2.0,
#       so just ignore the warning.
#       (The values are only used if $echo_source in idzebra-config-2.0 is set to "yes".
#       But this variable is set to "no" in the script, so this if-branch is dead.)
#
#       Two possibilities: ignore the warning or patch this dead if-branch out of the script.
#       I decided to ignore it for now.
#
pkgname=zebra
_dlname=idzebra
pkgver=2.1.4
pkgrel=1
pkgdesc="A high-performance, general-purpose structured text indexing and retrieval engine."
arch=('i686' 'x86_64')
url="http://www.indexdata.com/zebra/"
license=('GPL')
depends=('bzip2' 'expat' 'perl' 'yaz>=3.0.47' 'zlib')
source=("http://ftp.indexdata.dk/pub/zebra/${_dlname}-${pkgver}.tar.gz")
sha512sums=('da5d473e504acb8dc90c02e36560b48477e331fb9480cff5dc322a7f27344a933d80f2559978bb860cb8225559ad5eed5597beaa4f3b5deb6b4a7672ab607a99')

prepare() {
    cd "$_dlname-$pkgver"
}

build() {
    cd "$_dlname-$pkgver"

    # --with-yaz wants the path to yaz-config
    ./configure --prefix=/usr \
        --with-yaz=/usr/bin \
        --without-docbook-dtd --without-docbook-dsssl --without-docbook-xsl \
        --without-tclconfig \
        --with-iconv --with-expat
    make
}

check() {
    cd "$_dlname-$pkgver"
    make -k check
}

package() {
    cd "$_dlname-$pkgver"
    make DESTDIR="$pkgdir/" install

    # libtool warning in the last "make install" step
    # says to do the following:
    libtool --finish "$pkgdir/usr/lib"
}
