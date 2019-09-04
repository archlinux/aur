# Maintainer: Yesterday17 <t@yesterday17.cn>
pkgname=go-drcom-jlu-git
_pkgname=go-drcom-jlu
pkgver=1.0.7
pkgrel=8
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

	if [ -L "$srcdir/$_pkgname" ]; then
		rm "$srcdir/$_pkgname" -rf
		mv "$srcdir/go/src/$_pkgname/" "$srcdir/$_pkgname"
	fi

	rm -rf "go/src"

	mkdir -p "go/src"

	mv "$_pkgname" "go/src/"

	ln -sf "go/src/$_pkgname/" "$_pkgname"
	cd "go/src/${_pkgname}/"

	echo ":: Building binary"
	go build
}

package() {
    cd "${_pkgname}"
    install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 release/config.json -t "${pkgdir}/etc/go-drcom-jlu/"
    install -Dm644 release/go-drcom-jlu.service -t "${pkgdir}/usr/lib/systemd/system"
}
