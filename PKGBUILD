# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>
# Maintainer: Quey-Liang Kao <s101062801@m101.nthu.edu.tw>

pkgname=openscap
pkgver=1.2.17
pkgrel=1
pkgdesc="Open Source Security Compliance Solution"

# i686 is theoretically bulitable, if anyone needs it
arch=('x86_64')
url="https://www.open-scap.org/"
license=('GPL')

# The official site suggested the dependencies in terms of Fedora's rpm.
# Some of the corresponding packages in Arch remain unclear, which are listed 
# here for now.
# packege missing: libselinux-devel
depends=('swig' 'python' 'acl' 'libcap' 'curl' 'libgcrypt' 'libxml2' 'libxslt'
         'libldap' 'pcre' 'bzip2' 'procps-ng' 'gconf' 'perl' 'perl-xml-parser' 'perl-xml-xpath')

optdepends=()
source=("https://github.com/OpenSCAP/openscap/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('e9a6c329d97dd687c1ec52070aabb4d0')

prepare() {
	cd "$pkgname-$pkgver"

	# This is for Red Hat/Fedora family, we don't need it.
	sed -e "s/^.*default_cpe.*$/\\\/" -i $srcdir/$pkgname-$pkgver/tests/API/XCCDF/Makefile.am

	# The upstream has fixed some of the issues, but more check needed
	# patch -f -p1 -i "$srcdir/fails_and_fix.patch"
	# patch -f -p2 -i "$srcdir/xpath.patch"
}

build() {
	cd "$pkgname-$pkgver"
	CPPFLAGS="-I/usr/include/python3.5m" ./configure --disable-valgrind --disable-python --enable-python3 --prefix=/usr 
	make # -j4
}

# Notice: It may take a long time to complete the check.
# check() {
#	cd "$pkgname-$pkgver"
#	make check
#}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install

	# That's what the guideline says.
	mv $pkgdir/usr/libexec/* $pkgdir/usr/lib/$pkgname/
	rm -fr $pkgdir/usr/libexec/
}
