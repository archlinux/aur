# Maintainer: Quey-Liang Kao <s101062801@m101.nthu.edu.tw>

pkgname=kpatch-git
pkgver=r1076.03ef5a2
pkgrel=1
pkgdesc="dynamic kernel patching tool"

arch=('x86_64')
url="https://github.com/dynup/kpatch"
license=('GPL')

depends=('elfutils')
makedepends=('gcc' 'git')
source=("git+https://github.com/dynup/kpatch.git"
	"no-libexec.patch")
md5sums=('SKIP'
'c6182ee2867efdea9ff144a9f8ebdb06')

prepare() {
	patch -p0 < $srcdir/no-libexec.patch
}

build() {
	cd "kpatch"
	make 
}

package() {
	cd "kpatch"
	make DESTDIR="$pkgdir/" install

	# That's what the guideline says.
	mv $pkgdir/usr/local/* $pkgdir/usr
	mv $pkgdir/usr/sbin/* $pkgdir/usr/bin/
	mv $pkgdir/usr/libexec/kpatch/* $pkgdir/usr/lib/kpatch/
	
	rm -fr $pkgdir/usr/libexec $pkgdir/usr/local $pkgdir/usr/sbin $pkgdir/usr/libexec
}

pkgver() {
    cd $srcdir/kpatch
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}
