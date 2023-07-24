# Maintainer: Alessio <alessio@linux.com>
# Contributor: Pritunl <contact@pritunl.com>

_pkgname=pritunl-dns
pkgname=${_pkgname}-git
pkgver=105.a8ef4ca
pkgrel=1
pkgdesc="Pritunl DNS mapping service"
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
license=("custom")
url="https://github.com/pritunl/${_pkgname}"
depends=(go)
makedepends=(git)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	echo "$(git rev-list --count master).$(git rev-parse --short master)"
}

prepare() {
	export GOPATH=$srcdir/go

	mkdir -p $GOPATH/src/github.com/pritunl
	ln -rTsf $_pkgname $GOPATH/src/github.com/pritunl/$_pkgname

	cd $GOPATH/src/github.com/pritunl/$_pkgname
	# https://github.com/sirupsen/logrus/issues/1041
	# https://github.com/pritunl/pritunl-web/pull/2
	find . -type f -exec sed 's/Sirupsen/sirupsen/g' -i {} \;

}

build() {
	export GOPATH=$srcdir/go

	cd $GOPATH/src/github.com/pritunl/$_pkgname
	go install \
		-gcflags "all=-trimpath=$GOPATH" \
		-asmflags "all=-trimpath=$GOPATH" \
		-ldflags "-extldflags $LDFLAGS" \
		-v ./...
}

package() {
	export GOPATH=$srcdir/go

	cd "$srcdir/$_pkgname"
	install -Dm755 $GOPATH/bin/${_pkgname} $pkgdir/usr/bin/${_pkgname}
}
