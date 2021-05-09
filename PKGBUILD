# Maintainer: aksr <aksr at t-com dot me>
pkgname=troff-git
pkgver=r86.e91fb98
pkgrel=1
pkgdesc='A port of Plan9 troff tools to Linux, contains troff, tr2ps (dpost), eqn, tbl, pic, and grap.'
arch=('i686' 'x86_64')
url='http://repo.or.cz/w/troff.git'
license=('MIT' 'custom')
makedepends=('git')
provides=("${pkgname%-*}")
source=("$pkgname::git://repo.or.cz/troff.git#branch=all")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

## Choose prefix:
#prefix="/usr"
prefix="/usr/troff"
#prefix="/opt/$pkgname"

libdir="lib/troff"
docdir="share/doc/$pkgname"
licensedir="/usr/share/licenses/$pkgname/"
tbase="$prefix/$libdir"

if [ "$prefix" == "/usr" ]; then
	conflicts=('groff' 'grap')
elif [ "$prefix" == "/opt/$pkgname" ]; then
	libdir="lib"
	docdir="doc"
	tbase="$prefix/$libdir"
fi

prepare() {
	cd "$srcdir/$pkgname"
	sed -i "s@/root/troff/home@$tbase@" conf.mk
}

build() {
	cd "$srcdir/$pkgname"
	for i in troff tr2ps eqn tbl pic grap refer; do cd $i; make; cd ..; done
	cd "$srcdir/$pkgname/mkdev"
	./mkdev.sh
}

package() {
	cd "$srcdir/$pkgname"
	prefix="$pkgdir/$prefix"
	install -D -m755 eqn/eqn $prefix/bin/eqn
	install -D -m755 grap/grap $prefix/bin/grap
	install -D -m755 pic/pic $prefix/bin/pic
	install -D -m755 refer/refer $prefix/bin/refer
	install -D -m755 tbl/tbl $prefix/bin/tbl
	install -D -m755 troff/troff $prefix/bin/troff
	install -D -m755 tr2ps/tr2ps $prefix/bin/tr2ps
	install -D -m644 README $prefix/$docdir/README

	mkdir -p $prefix/$libdir
	cd "$srcdir/$pkgname/home"
	cp -a font hyphen ps term tmac $prefix/$libdir/
}
