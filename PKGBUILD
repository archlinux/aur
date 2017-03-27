# Maintainer: Markus Hovorka <m.hovorka@live.de>
pkgname=netgen-nogui-occ7
pkgver=5.3.1
pkgrel=1
pkgdesc="NETGEN is an automatic 3d tetrahedral mesh generator"
arch=("i686" "x86_64")
url="https://sourceforge.net/projects/netgen-mesher"
license=("LGPL")
depends=("opencascade7" "openmpi" "metis")
makedepends=("patch")
provides=("netgen")
conflicts=("netgen")
options=("!libtool")
source=("https://sourceforge.net/projects/netgen-mesher/files/netgen-mesher/5.3/netgen-$pkgver.tar.gz/download"
        "nglib-occt7.patch")
md5sums=('afd5a9b0b1296c242a9c554f06af6510'
         'eae8f8454e07814669f4d698f0f8035f')

# out-of-source build directory
_builddir="build"

prepare() {
	cd "$srcdir/netgen-$pkgver"
	patch -p1 -i "$srcdir/nglib-occt7.patch"
}

build() {
	cd "$srcdir/netgen-$pkgver"

	# create dir for out-of-source build
	mkdir -p "$_builddir" && cd "$_builddir"

	CPPFLAGS="-I/usr/include/openmpi/ompi/mpi/cxx -I/opt/opencascade7/include/opencascade"
	../configure --prefix=/usr \
	             --with-occ=/opt/opencascade7/ \
	             --enable-occ \
	             --disable-gui \
	             --enable-nglib \
	             --datadir=/usr/share
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
