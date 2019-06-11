# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Patryk Kowalczyk < patryk at kowalczyk dot ws>

pkgname=hivex
pkgver=1.3.18
pkgrel=2
pkgdesc="System for extracting the contents of Windows Registry."
arch=("i686" "x86_64")
url="http://libguestfs.org"
license=("LGPL2.1")
depends=("libxml2" "perl")
makedepends=("python2" "ruby" "ruby-rake" "ruby-rdoc" "perl-io-stringy" "perl-test-simple" "ocaml-findlib" "ocaml")
optdepends=("python2: for python bindings"
	    "ruby: for ruby bindings"
	    "ocaml: for ocaml bindings")
options=("!emptydirs" "!libtool")
source=("http://libguestfs.org/download/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('8468074cdc6e870e8f6a2c831ce22a0d')

build() {
    cd $pkgname-$pkgver
    unset PREFIX
    unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
    ./configure \
	--bindir=/usr/bin \
	--libdir=/usr/lib \
	--prefix=/usr \
	--disable-rpath \
	--disable-static PYTHON=python2
    make
}

_perl_depends() {
# template start; name=perl-binary-module-dependency; version=1;
if [[ $(find "$pkgdir/usr/lib/perl5/" -name "*.so") ]]; then
	_perlver_min=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]);')
	_perlver_max=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]+1);')
	depends+=("perl>=$_perlver_min" "perl<$_perlver_max")
fi
# template end;
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
    _perl_depends
}
