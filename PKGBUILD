# Maintainer: Andrea Berlingieri <andrea.berlingieri42 at gmail dot com>
pkgname=matita
pkgver=0.99.3
pkgrel=1
pkgdesc="An experimental, interactive theorem prover"
arch=('x86_64')
url="http://matita.cs.unibo.it/index.shtml"
license=('GPL2')
depends=('libglade' 'gtksourceview2')
optdepends=('yelp: for the online helper')
makedepends=('ocaml' 'ocaml-findlib' 'ocaml-expat' 'lablgtk2' 'gtksourceview2' 'ocamlnet'
'ocaml-http-git' 'ulex08' 'ocaml-camlzip' 'camlp5' 'autoconf' 'make' 'help2man' 'gmetadom'
'ocaml-mysql')
#install="$pkgname.install"
changelog=ChangeLog
source=("http://matita.cs.unibo.it/sources/matita-0.99.3.tar.gz" "matita.desktop"
"matita-0.99.3.patch")
md5sums=('aed44d9f10570f672de0224175b2b28b'
         '2470d80aa45b6bc50dabf9cd7a2625ca'
         '0cb6cb42d76c75a79b519f0287488a7f')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "../../$pkgname-$pkgver.patch"
}

build() {
	cd "${srcdir}/$pkgname-$pkgver"
    ./configure --with-runtime-dir=/usr/share/matita --bindir=/usr/bin --prefix=/usr
    env OCAMLPARAM="safe-string=0,_" make world
}

package() {
    _OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
    mkdir -p "$_OCAMLFIND_DESTDIR"
	cd "${srcdir}/$pkgname-$pkgver"
    env DESTDIR="${pkgdir}" \
        OCAMLFIND_DESTDIR="$_OCAMLFIND_DESTDIR" \
        OCAMLFIND_LDCONF="ignore" \
    	make install
    mkdir -p ${pkgdir}/usr/bin
    mv ${pkgdir}/usr/share/matita/matita.opt ${pkgdir}/usr/bin/matita
    mv ${pkgdir}/usr/share/matita/matitac.opt ${pkgdir}/usr/bin/matitac
    ln -s /usr/bin/matitac ${pkgdir}/usr/bin/matitaclean
    rm ${pkgdir}/usr/share/matita/matita ${pkgdir}/usr/share/matita/matitac \
    ${pkgdir}/usr/share/matita/matitaclean
    install -Dm 644 ../../matita.desktop ${pkgdir}/usr/share/applications/matita.desktop
    mkdir -p ${pkgdir}/usr/share/man/man1/
	help2man --name="Matita interative theorem prover - batch compiler" -N \
 		${pkgdir}/usr/bin/matitac \
 		| gzip -9 > ${pkgdir}/usr/share/man/man1/matitac.1.gz
 	help2man --name="Matita interative theorem prover - cleanup tool" -N \
 		${pkgdir}/usr/bin/matitaclean \
 		| gzip -9 > ${pkgdir}/usr/share/man/man1/matitaclean.1.gz
}
