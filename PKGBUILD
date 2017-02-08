# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=xdx-git
pkgver=r461.6bf5ff3
#r461.6bf5ff3
pkgrel=1
pkgdesc="Ham Radio DX-cluster client"
arch=('i686' 'x86_64')
url="https://github.com/N0NB/xdx"
license=('GPL')
depends=('gtk2' 'cty')
makedepends=('automake' 'autoconf' 'pkg-config' 'expect' 'gettext')
optdepends=('hamradio-menus: XDG compliant menuing'
	    'hamlib: rig interfacing'
	    'gnuplot: graph output'
	    'sox: sound output')
provides=('xdx')
conflicts=('xdx')
source=("$pkgname::git+$url#branch=master"
	tada)

pkgver() {
	cd $srcdir/$pkgname

#	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
#		^^ tag represents a very old version !! 		
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
	cd $srcdir/$pkgname

	export XDX_CTY="/usr/share/cty"
	install -m755 ../tada tada

#	./bootstrap.sh --prefix=/usr
	./tada				# 'expect' re: gets past gettextize's user input
#	 ^ this is nec. as gettextize stops to get user input & autopoint doesn't work ! 
	autoreconf --install		# bootstrap.sh routine would continue here
	./configure --prefix=/usr	# "
	make || return 1
}

package() {
	cd $srcdir/$pkgname

	make DESTDIR="$pkgdir" install
  
#	rm -r $startdir/pkg/usr/share/xdx/wwv.gnuplot~
}
md5sums=('SKIP'
         'ce51fb9118471e19a67943eee7195b94')
sha256sums=('SKIP'
            '95d28ca2de48c90db85fdf9990e49786dc16dd5289e844e61de3444c19669c57')
