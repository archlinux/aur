# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: iboyperson <tjquillan at gmail dot com>
pkgname=tldr++
pkgver=0.6.1
pkgrel=4
pkgdesc="Community driven man pages improved with smart user interaction"
arch=('any')
url="https://isacikgoz.me/tldr"
license=('MIT')
makedepends=('go-pie' 'dep' 'git')
provides=("${pkgname%++}")
conflicts=("${pkgname%++}" 'tldr-bash' 'nodejs-tldr' 'tldr-python-client')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/isacikgoz/tldr/archive/v$pkgver.tar.gz")
sha256sums=('e377942c6dd9cbe3f9f55b7614e17b7c5f0694b326ad3993d0cde59aca8dc8fa')

prepare() {
	mkdir -p gopath/src/github.com/isacikgoz
	ln -rTsf "${pkgname%++}-$pkgver" "gopath/src/github.com/isacikgoz/${pkgname%++}"
	export GOPATH="$srcdir"/gopath

	cd "gopath/src/github.com/isacikgoz/${pkgname%++}"
	dep init
	dep ensure
}

build() {
	export GOPATH="$srcdir"/gopath
	cd "gopath/src/github.com/isacikgoz/${pkgname%++}"

	go build \
		-gcflags "all=-trimpath=${PWD}" \
		-asmflags "all=-trimpath=${PWD}" \
		-ldflags "-extldflags ${LDFLAGS}" \
		-o $pkgname .
}

package() {
	cd "gopath/src/github.com/isacikgoz/${pkgname%++}"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/${pkgname%++}"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
