# Maintainer: Yesterday17 <t@yesterday17.cn>
pkgname=jlu-http-proxy-git
_pkgname=jlu-http-proxy
pkgver=1.0.1
pkgrel=2
pkgdesc="HTTP Forward proxy for vpns.jlu.edu.cn"
arch=('i686' 'x86_64')
url="https://github.com/Yesterday17/jlu-http-proxy"
license=('MIT')
makedepends=(
	'go'
	'git'
)
backup=('etc/jlu-http-config/config.json')

source=(
	"$_pkgname::git+https://github.com/Yesterday17/jlu-http-proxy.git"
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
    install -Dm644 release/config.json -t "${pkgdir}/etc/jlu-http-proxy/"
    install -Dm644 release/jlu-http-proxy.service -t "${pkgdir}/usr/lib/systemd/system"
}