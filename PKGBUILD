# Maintainer: Quey-Liang Kao <s101062801@m101.nthu.edu.tw>

pkgname=openscap
pkgver=1.2.8
pkgrel=4
pkgdesc="Open Source Security Compliance Solution"

# i686 is theoretically bulitable, if anyone needs it
arch=('x86_64')
url="www.open-scap.org"
license=('GPL')

# The official site suggested the dependencies in terms of Fedora's rpm.
# Some of the corresponding packages in Arch remain unclear, which are listed 
# here for now.
# packege missing: libselinux-devel
depends=('swig' 'python' 'acl' 'libcap' 'curl' 'libgcrypt' 'libxml2' 'libxslt'
         'libldap' 'pcre' 'bzip2' 'procps-ng' 'gconf' 'perl' 'perl-xml-parser' 'perl-xml-xpath')

optdepends=()
source=("https://github.com/OpenSCAP/openscap/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
        "fails_and_fix.patch"
        "xpath.patch")
md5sums=('d26a148d834635363ac8cdd707828302'
         '7882c8b0010db0920d1cabbd2aabcc07'
         '6dc765fcfba0e5c4ee277635d58584e2')

prepare() {
	cd "$pkgname-$pkgver"

	# This is for Red Hat/Fedora family, we don't need it.
	sed -e "s/^.*default_cpe.*$/\\\/" -i $srcdir/$pkgname-$pkgver/tests/API/XCCDF/Makefile.am
	patch -f -p1 -i "$srcdir/fails_and_fix.patch"
	patch -f -p2 -i "$srcdir/xpath.patch"
}

build() {
	cd "$pkgname-$pkgver"
	CPPFLAGS="-I/usr/include/python3.5m" ./configure --disable-valgrind --disable-python --enable-python3 --prefix=/usr 
	make # -j4
}

check() {
	# Notice: It may take a long time to complete the check.
	cd "$pkgname-$pkgver"
	make check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install

	# That's what the guideline says.
	mv $pkgdir/usr/libexec/* $pkgdir/usr/lib/$pkgname/
	rm -fr $pkgdir/usr/libexec/
}
