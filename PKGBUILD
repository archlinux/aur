# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Emilio Reggi <nag@mailbox.org>

pkgname=bombadillo
pkgver=2.3.3
pkgrel=1
pkgdesc="A non-web client for the terminal, supporting Gopher, Gemini and much more."
arch=('x86_64' 'i686' 'arm')
url="https://bombadillo.colorfield.space"
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://tildegit.org/sloum/bombadillo/archive/$pkgver.tar.gz"
        001-Makefile.patch)
sha256sums=('2d4ec15cac6d3324f13a4039cca86fecf3141503f556a6fa48bdbafb86325f1c'
            'a379b36f6ba85a689942f90f9f4f4d416678f34c1e99bdbb8eaeadaaf6f0b788')

prepare() {
  cd "$pkgname"
  patch --forward --strip=1 --input="${srcdir}/001-Makefile.patch"
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname"
	make PREFIX=/usr
}

package() {
	cd "$pkgname"
	make VERSION="$pkgver" DESTDIR="$pkgdir/" PREFIX=/usr install
}
