# Maintainer: Rémi BERTHO <remi.bertho@dalan.fr>
# Contributor: Rémi BERTHO <remi.bertho@dalan.fr>
pkgname=csuper-gtk
pkgver=4.4.3
pkgbuild=1
pkgrel=2
pkgdesc="Universal points counter allowing reflexion exemption - GTK version"
arch=(any)
url="https://www.dalan.fr"
license=('GPL')
depends=('libxml++' 'glibmm' 'muparser' 'podofo-0.9' 'cairo' 'ncurses' 'libcsuper' 'gtkmm3')
makedepends=('cmake')
install="INSTALL"
source=(
	https://www.binaries.dalan.fr/Csuper/$pkgver/csuper-$pkgver-$pkgbuild-sources.tar.xz
	podofo0.9.patch
)
sha512sums=(
	'5fbf3eb8f18a26543dfc3a9beffc7b79bd150daec4b73d9a0b4cc16b0b2f8826b9dc6f6dfc548ed0262ce0bb5badf2ab94b95f00be0abfd3911307df429c3d80'
	'87dd5bc39a2a3fe1e23ae688f9afe342fca14ae5836154ad8215a86d7d89fd93398e0f501c4e0c48bc809f0e1e5cc7778bde912b061bec7b7a4d5a7b6ba5704d'
)

prepare() {
  patch -d "$srcdir/csuper-$pkgver-$pkgbuild-sources" -p1 -i "../podofo0.9.patch"
}
 
build()
{
    cd "$srcdir/csuper-$pkgver-$pkgbuild-sources"
    cmake -G"Unix Makefiles" \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    	-DALL_UPDATES=FALSE \
    	-DCMAKE_BUILD_TYPE=Release \
   		-DCMAKE_INSTALL_PREFIX=/usr \
    	-DCMAKE_SKIP_RPATH=True \
    	-DLIB=FALSE \
    	-DCLI=FALSE \
    	-DLIBXMLPP=3.0 || return 1
    make || return 1
    sh utility.sh -c
}

package()
{
	cd "$srcdir/csuper-$pkgver-$pkgbuild-sources"
 	make install DESTDIR="${pkgdir}"
}
