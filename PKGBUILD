# Maintainer: Emilio Reggi <nag@mailbox.org>
pkgname=bombadillo-git
_pkgname=bombadillo
_source=https://tildegit.org/sloum/bombadillo.git
pkgver=r462.757305d
pkgrel=4
pkgdesc="A non-web client for the terminal, supporting Gopher, Gemini and much more."
arch=('x86_64')
url="https://tildegit.org/sloum/bombadillo.git"
license=('GPL')
makedepends=('go' 'git')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}"::"git+${_source}" "remove-update-desktop-database.patch")
md5sums=('SKIP'
         '181db34d11c1986d541ed8a134402f5a')

prepare() {
  cd "$_pkgname"
  patch --forward --strip=1 --input="${srcdir}/remove-update-desktop-database.patch"
}

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	make PREFIX=/usr
}

package() {
	cd "$_pkgname"
	make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX=/usr install
}
