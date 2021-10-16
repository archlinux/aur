# Maintainer: Keogami <keogami666@gmail.com>
pkgname=crypt-git
pkgver=0.29.2d24bab
pkgrel=1
pkgdesc="a simple utility to encrypt & decrypt files with AES-256 with passphrases"
arch=('any')
url="https://github.com/keogami/crypt.git"
license=('Apache')
makedepends=('git' 'go')
provides=("crypt")
conflicts=("crypt")
source=("git+$url")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "0.%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p build
}

build() {
	cd "$srcdir/${pkgname%-git}"
	# taken from the sample in (https://wiki.archlinux.org/title/Go_package_guidelines)
	export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./cmd/...
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 build/${pkgname%-git} "$pkgdir"/usr/bin/${pkgname%-git}
}
