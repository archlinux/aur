# Maintainer: Quey-Liang Kao <s101062801@m101.nthu.edu.tw>

pkgname=kpatch-git
pkgver=r1095.4e1a596
pkgrel=1
pkgdesc="dynamic kernel patching tool"

arch=('x86_64')
url="https://github.com/dynup/kpatch"
license=('GPL')

depends=('elfutils')
makedepends=('gcc' 'git')
source=("git+https://github.com/dynup/kpatch.git")
md5sums=('SKIP')

prepare() {
	sed -i 's/libexec/lib/g' "$srcdir/kpatch/kpatch-build/kpatch-build"
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
