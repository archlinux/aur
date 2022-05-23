# Maintainer: piratecarrot <39475419+piratecarrot@users.noreply.github.com>
pkgname=mrcal-git
pkgver=mrbuild_2.1.1.r63.g4d19882
pkgrel=3
pkgdesc="mrcal is a generic toolkit built to solve the calibration and SFM-like problems we encounter at NASA/JPL."
arch=('i686' 'x86_64')
url="http://mrcal.secretsauce.net/"
license=('Apache')
groups=('')
depends=('libdogleg' 'python' 'python-numpy' 'python-numpysane')
makedepends=('make' 'gcc' 'perl-list-moreutils' 're2c' 'chrpath')
optdepends=('')
provides=('mrcal')
conflicts=('mrcal')
source=("${pkgname%-git}::git+https://github.com/dkogan/mrcal.git#branch=master"
	"build-fix.patch")
md5sums=('SKIP'
         '4b7905b9799e4d8e0779d5a4b952e29c')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
        patch --directory="${pkgname%-git}" --forward --strip=1 --input="$srcdir/build-fix.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	CFLAGS=`python-config --includes | awk '{n=split($2,a,"|");for(i=1;i<=n;++i)if(!seen[a[i]]++)print a[i]}' | sed 's!/usr/include!/usr/lib!' | sed 's!$!/site-packages/numpy/core/include!'`
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR=$pkgdir install
}
