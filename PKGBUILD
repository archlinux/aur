# Maintainer: Yesterday17 <t@yesterday17.cn>
pkgname=go-drcom-jlu-git
_pkgname=go-drcom-jlu
pkgver=1.0.0
pkgrel=1
pkgdesc="JLU drcom client written in golang."
arch=('i686' 'x86_64')
url="https://github.com/Yesterday17/go-drcom-jlu"
license=('MIT')
depends=()
makedepends=(
	'go'
	'git'
)

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

	export GOPATH="$srcdir/go"

	mv "$srcdir/$_pkgname" "$srcdir/go/src/"

	cd "$srcdir/go/src/$_pkgname/"
	ln -sf "$srcdir/go/src/$_pkgname/" "$srcdir/$_pkgname"

	echo ":: Building binary"
	go get -v \
		-gcflags "-trimpath $GOPATH/src"
}

package() {
	find "$srcdir/go/bin/" -type f -executable | while read filename; do
		install -DT "$filename" "$pkgdir/usr/bin/$(basename $filename)"
    
    install -m755 -d ${pkgdir}/etc/go-drcom-jlu/ || return 1
    install -m644  $srcdir/$_pkgname/release/config.json ${pkgdir}/etc/go-drcom-jlu/ || return 1
    install -m755 -d ${pkgdir}/usr/lib/systemd/system || return 1
    install -m644  $srcdir/$_pkgname/release/go-drcom-jlu.service ${pkgdir}/usr/lib/systemd/system || return 1
	done
}
