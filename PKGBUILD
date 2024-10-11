# Maintainer: Matthew Tran <0e4ef622 at gmail.com>
# Contributor: piratecarrot <39475419+piratecarrot@users.noreply.github.com>
pkgname=mrgingham-git
pkgver=v1.24.r4.g3841c22
pkgrel=1
pkgdesc="Chessboard corner-finder for a camera calibration system "
arch=('i686' 'x86_64')
url="https://github.com/dkogan/mrgingham"
license=('LGPL-2.1-or-later')
depends=('bash'
         'gcc-libs'
         'glibc'
         'opencv'
         'python'
         'python-gnuplotlib'
         'python-numpy'
         'python-numpysane'
         'python-scipy'
         'vnlog'
        )
makedepends=('make' 'gcc' 'mawk' 'mrbuild' 'boost')
provides=('mrgingham')
conflicts=('mrgingham')
source=("${pkgname%-git}::git+https://github.com/dkogan/mrgingham.git#branch=master")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	CFLAGS=`python-config --includes | awk '{n=split($2,a,"|");for(i=1;i<=n;++i)if(!seen[a[i]]++)print a[i]}' | sed 's!/usr/include!/usr/lib!' | sed 's!$!/site-packages/numpy/_core/include!'`
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR=$pkgdir USRLIB=/usr/lib install
}
