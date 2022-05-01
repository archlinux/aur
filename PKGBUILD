# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: lilac <lilac@build.archlinuxcn.org>
# Contributor: Jiachen YANG <farseerfc@gmail.com>

_pkgname=conoha-iso
pkgname=${_pkgname}-git
pkgver=0.4.4.r80.g0bf6cca
pkgrel=1
pkgdesc="ISO image management tool for ConoHa"
arch=(x86_64)
url="https://github.com/hironobu-s/conoha-iso"
license=('MIT')
makedepends=(go git)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/hironobu-s/conoha-iso.git")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed "s/current/$(grep -oP 'APP_VERSION.*"\K([.0-9]*)(?=")' app.go)/g"
}

prepare() {
	mkdir -p gopath/src/github.com/$_pkgname
	ln -rTsf $_pkgname gopath/src/github.com/$_pkgname/$_pkgname

	cd gopath/src/github.com/$_pkgname/$_pkgname
	go get "${url#https://}" # strip https:// from canonical URL
}

build() {
	export GOPATH="$srcdir"/gopath
	cd gopath/src/github.com/$_pkgname/$_pkgname
	make linux
}

package() {
	cd gopath/src/github.com/$_pkgname/$_pkgname
	install -Dm755 bin/linux/conoha-iso $pkgdir/usr/bin/conoha-iso
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
