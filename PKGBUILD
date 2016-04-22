# Maintainer: Franco Masotti <franco dot masotti at student dot unife dot it>
pkgname=gnupot
pkgver=0.5.r0.g79956a9
pkgrel=1
pkgdesc="A fully free, highly customizable and very efficient shell wrapper for git and SSH, which imitates Dropbox."
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
source=('git://github.com/frnmst/gnupot.git#branch=master')
md5sums=('SKIP')

build() {
	# Changes local to global paths.
	cd "$srcdir"/"$pkgname"/src
	sed -i 's/"${0%\/gnupot}"/\/opt\/gnupot/' gnupot.sh
	sed -i 's/"${prgPath%\/gnupot}"/\/opt\/gnupot/' functions.sh
	sed -i "s/git describe --long/printf \""$pkgver\\\\n"\"/" functions.sh
	sed -i 's/src\/form.sh/\/opt\/gnupot\/src\/form.sh/' config.sh
	sed -i 's/src\/configVariables.conf/\/opt\/gnupot\/src\/configVariables.conf/' config.sh
	sed -i 's/\$(pwd)/\/opt\/gnupot/' configVariables.conf
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
	install -Dm766 src/form.sh "$pkgdir"/opt/gnupot/src/form.sh
	install -Dm766 src/configVariables.conf "$pkgdir"/opt/gnupot/src/configVariables.conf
	install -Dm766 icons/gnupotIcon.png "$pkgdir"/opt/gnupot/icons/gnupotIcon.png
	install -Dm766 icons/gnupotSyncLocal.png "$pkgdir"/opt/gnupot/icons/gnupotSyncLocal.png
	install -Dm766 icons/gnupotSyncRemote.png "$pkgdir"/opt/gnupot/icons/gnupotSyncRemote.png
	install -Dm766 icons/gnupotWarning.png "$pkgdir"/opt/gnupot/icons/gnupotWarning.png
	install -Dm755 man/gnupot.man "$pkgdir"/usr/share/man/man1/gnupot.1
	install -Dm755 man/gnupot.config.man "$pkgdir"/usr/share/man/man5/gnupot.config.5
	mkdir -p "$pkgdir"/usr/bin
	ln -s /opt/gnupot/src/gnupot.sh "$pkgdir"/usr/bin/gnupot
}
