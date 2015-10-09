# Maintainer: Franco Masotti <franco dot masotti at student dot unife dot it>
pkgname=gnupot
pkgver=0.2.r0.gb1f3a5b
pkgrel=1
pkgdesc="Yet another libre Dropbox clone written in bash and based on git."
arch=('any')
url="https://github.com/frnmst/gnupot"
license=('GPL3')
depends=('coreutils'
	'bash' 
	'openssh'
	'inotify-tools'
	'util-linux'
	'libnotify'
	'git>=2.4' 
	'dialog'
	'glibc'
	'trickle'
	'gawk')
makedepends=('coreutils' 'sed' 'git>=2.4')
install=.INSTALL
source=(git://github.com/frnmst/gnupot.git)
md5sums=('SKIP')

build() {
	# Changes local to global paths.
	cd "$srcdir"/"$pkgname"/src
	sed -i 's/"${0%\/gnupot}"/\/opt\/gnupot/' gnupot.sh functions.sh
	sed -i "s/git describe --long/printf \""$pkgver\\\\n"\"/" functions.sh
	sed -i 's/src\/configVariables.conf/\/opt\/gnupot\/src\/configVariables.conf/' config.sh
}

pkgver () {
	cd "$srcdir"/"$pkgname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir"/"$pkgname"
	install -Dm755 src/gnupot.sh "$pkgdir"/opt/gnupot/src/gnupot.sh
	install -Dm766 src/functions.sh "$pkgdir"/opt/gnupot/src/functions.sh
	install -Dm755 src/config.sh "$pkgdir"/opt/gnupot/src/config.sh
	install -Dm766 src/configVariables.conf "$pkgdir"/opt/gnupot/src/configVariables.conf
	install -Dm755 man/gnupot.man "$pkgdir"/usr/share/man/man1/gnupot.1
	install -Dm755 man/gnupot.config.man "$pkgdir"/usr/share/man/man5/gnupot.config.5
	mkdir -p "$pkgdir"/usr/bin
	ln -s /opt/gnupot/src/gnupot.sh "$pkgdir"/usr/bin/gnupot
}
