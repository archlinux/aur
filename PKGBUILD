# Maintainer: Markus Hovorka <m.hovorka@live.de>
pkgname=netgen-nogui
pkgver=5.3.1
pkgrel=3
pkgdesc="NETGEN is an automatic 3d tetrahedral mesh generator"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/netgen-mesher"
license=('LGPL')
depends=('oce' 'openmpi' 'metis')
provides=('netgen')
options=('!libtool')
source=("https://sourceforge.net/projects/netgen-mesher/files/netgen-mesher/5.3/netgen-$pkgver.tar.gz/download"
        'occ-pi-constant.patch'
	'occ-relativemode.patch')
md5sums=('afd5a9b0b1296c242a9c554f06af6510'
         '0595a7f4d99d0662e44323932122b335'
         '5d40b3e7fd70bde4d9eef8cf89ac347b')

# out-of-source build directory
_builddir="build"

prepare() {
	cd "$srcdir/netgen-$pkgver"
	patch -Np1 < ../occ-pi-constant.patch
	patch -Np1 < ../occ-relativemode.patch
}

build() {
	cd "$srcdir/netgen-$pkgver"

	# create dir for out-of-source build
	mkdir "$_builddir" && cd "$_builddir"

	CPPFLAGS="-I/usr/include/openmpi/ompi/mpi/cxx -I/opt/oce/include/oce"
	../configure --prefix=/usr --with-occ=/opt/oce/ --enable-occ \
		--disable-gui --enable-nglib --datadir=/usr/share
	make
}

package() {
	cd "$srcdir/netgen-$pkgver"

	# -C: change dir before install
	make -C "$_builddir" DESTDIR="$pkgdir/" install

	install -D -m644 "$srcdir/netgen-$pkgver/doc/ng4.pdf" \
		"$pkgdir/usr/share/doc/netgen/ng4.pdf"

	# install libsrc/ needed by some packages (e.g. FreeCAD)
	cp -R "libsrc/" "$pkgdir/usr/share/netgen"
}
