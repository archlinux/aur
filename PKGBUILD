# Maintainer: Juma7C9 <juri # dividebyzero # it>

pkgname=setpl-git
_pkgname=setPL
pkgver=r15.516baf2
pkgrel=4
pkgdesc="Linux script for setting the PL1/PL2 power limits on modern Intel processors"
arch=('x86_64')
url="https://github.com/horshack-dpreview/setPL"
license=('GPL3')
depends=(msr-tools turbostat)
provides=(${pkgname%-git} devmem2)
source=('git+https://github.com/horshack-dpreview/setPL'
	'https://git.launchpad.net/ubuntu/+source/devmem2/plain/devmem2.c')
sha256sums=('SKIP'
            'ec382c90af3ef2f49695ff14a4d6521e58ac482c4e29d6c9ebca8768f699c191')

pkgver() {
	cd $srcdir/$_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	# Build devmem2
	cd $srcdir/
	gcc -fPIC devmem2.c -o devmem2
}

package() {
	# Rename setpl script
	mv $srcdir/$_pkgname/{$_pkgname.sh,${pkgname%-git}}

	# Copy executable files
	install -m 755 -D $srcdir/$_pkgname/${pkgname%-git} $srcdir/devmem2 -t $pkgdir/usr/bin

	# Copy readme file
	install -m 644 -D $srcdir/$_pkgname/readme.md -t $pkgdir/usr/share/doc/${pkgname%-git}
}
