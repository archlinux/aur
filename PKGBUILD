# Maintainer: Yesterday17 <t@yesterday17.cn>
pkgname=go-drcom-jlu-git
_pkgname=go-drcom-jlu
pkgver=1.0.4
pkgrel=5
pkgdesc="JLU drcom client written in golang."
arch=('i686' 'x86_64')
url="https://github.com/Yesterday17/go-drcom-jlu"
license=('MIT')
makedepends=(
	'go'
	'git'
)
backup=('etc/go-drcom-jlu/config.json')

source=(
	"$_pkgname::git+https://github.com/Yesterday17/go-drcom-jlu.git"
)

md5sums=('SKIP')

build() {
    export GO111MODULE=on
	cd "$srcdir/$_pkgname"

	if [ -L "$srcdir/$_pkgname" ]; then
		rm "$srcdir/$_pkgname" -rf
		mv "$srcdir/go/src/$_pkgname/" "$srcdir/$_pkgname"
	fi

	rm -rf "$srcdir/go/src"

	mkdir -p "$srcdir/go/src"

	mv "$srcdir/$_pkgname" "$srcdir/go/src/"

	cd "$srcdir/go/src/$_pkgname/"
	ln -sf "$srcdir/go/src/$_pkgname/" "$srcdir/$_pkgname"

	echo ":: Building binary"
	go build
}

package() {
    install -m755 -d $pkgdir/usr/bin/
    install -m644 $srcdir/$_pkgname/$_pkgname $pkgdir/usr/bin/$_pkgname
	chmod +x $pkgdir/usr/bin/$_pkgname
    
    install -m755 -d ${pkgdir}/etc/go-drcom-jlu/
    install -m644  $srcdir/$_pkgname/release/config.json ${pkgdir}/etc/go-drcom-jlu/
    install -m755 -d ${pkgdir}/usr/lib/systemd/system
    install -m644  $srcdir/$_pkgname/release/go-drcom-jlu.service ${pkgdir}/usr/lib/systemd/system
}
