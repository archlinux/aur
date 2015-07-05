# Maintainer: Lucki <Lucki at holarse-linuxgaming dot de>
# Contributor: Gerardo Marset <gammer1994@gmail.com>

pkgname=lci-git
_pkgurl=git://github.com/justinmeza/lci.git

# Set this to true for the 1.4 draft (fileio, sockets, bukkits, …):
_usedraft=false

if test "$_usedraft" == "true"; then
    # 1.4 draft:
    _pkgurl=$_pkgurl#branch=future
fi

pkgver=0.10.5.r10.g75b2b31
pkgrel=1
pkgdesc="A simple and fast 1.2 lolcode interpreter written in C."
arch=('i686' 'x86_64')
url="http://lolcode.org/"
license=('GPL3')
changelog=.CHANGELOG
depends=('glibc')
makedepends=('git' 'cmake')
optdepends=('gtksourceview3-lolcode: syntax highlight')
provides=('lci')
conflicts=('lci')
source=(${pkgname}::${_pkgurl})
sha512sums=('SKIP')

pkgver()
{
	cd "$srcdir/$pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
	# update .CHANGELOG
	if [ ${_usedraft} == "false" ]; then
		git -C ${srcdir}/${pkgname} log --graph -10 > ${startdir}/.CHANGELOG
	else
		git -C ${srcdir}/${pkgname} log --graph -10 --branches=future > ${startdir}/.CHANGELOG
	fi
}

build()
{
	cd "$srcdir/$pkgname"
	cmake -DCMAKE_INSTALL_PREFIX=/usr
	make
#	make docs	
}

#check()
#{
#	cd "$srcdir/$pkgname"
#	ctest
#}

package()
{
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir" install
}
