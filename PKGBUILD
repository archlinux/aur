# Maintainer: Fredrick Brennan <copypaste [at] kitten [dot] ph>

pkgbase=glextrusion
pkgname=('glextrusion' 'glextrusion-doc')
pkgver=3.1.2
pkgrel=1
pkgdesc="Library for extruding shapes in 3D space"
arch=('x86_64')
url="http://www.linas.org/gle/"
license=('Custom')
depends=('libgl' 'glu' 'libx11' 'libxext' 'libxmu' 'libxt')
makedepends=('gcc' 'make' 'patch' 'autoconf' 'automake' 'libtool')
_username="linas"
_pkgname="gle"
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/linas/glextrusion/archive/refs/tags/${_pkgname}-${pkgver}.tar.gz")
b2sums=('5236e002318f47a353ab12a9ec74d49d86e052f27780757122a986c7fb5752e93ded5d8d0d98242a12242dcb0ed678e9846a8c464d18b1bd5d1cac362748c109')

prepare() {
    cd "$pkgname-$_pkgname-$pkgver"
    autoreconf -fi
    mkdir -vp shared
}

build() {
	cd "$pkgname-$_pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$_pkgname-$pkgver"
	make -k check
}

package_glextrusion() {
    license=('Custom' 'GPL')
	cd "$pkgname-$_pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install

    ln -vsf "$pkgdir/usr/lib/lib${_pkgname}.so" "$pkgdir/usr/lib/lib${pkgname}.so"

    mkdir -v -p "$pkgdir/usr/share/licenses/$pkgname"
    mv -v "$pkgdir/usr/share/doc/$_pkgname" "$pkgdir/usr/share/doc/$pkgname"
    mv -v "$pkgdir/usr/share/doc/$pkgname/COPYING"* "$pkgdir/usr/share/licenses/$pkgname/"
    rm -rf shared
    mkdir -v shared
    mv -v "$pkgdir/usr/share/doc/$pkgname" shared/doc
    mv -v "$pkgdir/usr/share/man" shared/man
}

package_glextrusion-doc() {
    pkgdesc="$pkgdesc (documentation)"
    depends=()
    license=('Artistic')
    cd "${pkgname%%-doc}-$_pkgname-$pkgver"

    rm -rf "$pkgdir/usr/share"
    mkdir -v -p "$pkgdir/usr/share/"
    mv -v shared/man "$pkgdir/usr/share/"
    mkdir -v -p "$pkgdir/usr/share/doc/"
    mv -v shared/doc "$pkgdir/usr/share/doc/${pkgname%%-doc}"
    ln -vsf "$pkgdir/usr/share/doc/${pkgname%%-doc}" "$pkgdir/usr/share/doc/$_pkgname"
}
