# Maintainer: aksr <aksr at t-com dot me>
pkgname=typo-git
pkgver=r24.2b34eb0
pkgrel=1
pkgdesc='A modern version of the original Unix typo command.'
arch=('i686' 'x86_64')
url='https://github.com/robpike/typo'
license=('BSD')
makedepends=('git' 'go>=1.19')
conflicts=("${pkgname%-*}")
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd typo
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	
	cd $srcdir/${pkgname%-*}
	[[ -d build ]] || mkdir build
	go build -o build ./...
}

package() {
	cd $srcdir/${pkgname%-*}
	install -D -m755 build/typo "$pkgdir/usr/bin/typo"
	sed '385,465!d' typo.go > README
	install -D -m644 README "$pkgdir"/usr/share/doc/${pkgname%-*}/README
	install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
