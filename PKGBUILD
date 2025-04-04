# Maintainer: pappy <pa314159@users.noreply.github.com>

_pkgname=simavr
pkgbase=$_pkgname-git
pkgname=($pkgbase $pkgbase-examples)
pkgver=1.7.x
pkgrel=1
pkgdesc='A lean, mean and hackable AVR simulator'
arch=('x86_64')
url="https://github.com/buserror/simavr"
license=('GPL3')
depends=('elfutils')
makedepends=('avr-libc' 'git' 'freeglut' 'glu')
source=("$pkgbase::git+https://github.com/buserror/simavr.git")
md5sums=('SKIP')

pkgver()
{
	cd $srcdir/$pkgbase

	xtag=$(git log -1 --tags --simplify-by-decoration --pretty="format:%d"|sed 's/[\(\) ]//g; s/.*tag:v//')

	echo $xtag.0.$(git rev-list v${xtag}.. --count )
}

prepare()
{
	cd $srcdir/$pkgbase

	cat <<-EOF > .make.options
	V=1
	RELEASE=1
	CPPFLAGS=-DCONFIG_SIMAVR_TRACE=1
	EOF
}

build() {
	cd $srcdir/$pkgbase

	make AVR_ROOT=/usr/avr RELEASE=1 \
		CFLAGS="-Wall -Wextra -fPIC -O2 -std=gnu99 -Wno-sign-compare -Wno-unused-parameter" \
		build-simavr build-parts
}

eval 'package_'$pkgbase'() {
	cd $srcdir/$pkgbase
	provides=($_pkgname)
	conflicts=($_pkgname)
	options=(strip)

	install -dm755 $pkgdir/usr/{bin,lib/pkgconfig}

	make PREFIX="/usr" DESTDIR="$pkgdir/usr" RELEASE=1 install
}
'

eval 'package_'$pkgbase'-examples() {
	depends=($pkgbase=$pkgver freeglut glu)
	provides=($pkgbase-examples)
	options=(!strip)

	cd $srcdir/$pkgbase

	install -d $pkgdir/usr/share/doc/$pkgbase
	cp -r examples $pkgdir/usr/share/doc/$pkgbase
	pushd $pkgdir/usr/share/doc/$pkgbase
	find . -name \*.elf |
	while read elf; do
		mv $elf $(dirname $(dirname $elf))
	done
	rm -r */*/obj-x86_64-pc-linux-gnu
	popd
}
'

