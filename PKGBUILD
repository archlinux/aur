# Maintainer: tippfehlr <tippfehlr@tippfehlr.dev>
pkgname=cpx
pkgver=1.3.5
pkgrel=2
pkgdesc="Cargo-like CLI for C++, compatible with CMake (vcpkg), Bazel and Meson"
arch=(x86_64 aarch64)
url="https://github.com/ozacod/cpx"
license=(MIT)
depends=(cmake vcpkg bazel meson)
makedepends=(git go)
source=("git+$url#tag=v$pkgver")
sha512sums=('a347c6e6e1e1f125faade3b13e2b63e49324d8fa7533323115053398f469918f9d8306ca1383e93dafe8e69a5506022ecfd26d588f5ad31a4cc4eee25fa5aa2f')

prepare() {
	cd $pkgname
	export GOPATH="${srcdir}"
	go mod download -modcacherw
}
build() {
	cd $pkgname
	export GOPATH="${srcdir}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o cpx cmd/cpx/main.go
}

package() {
	cd $pkgname
	install -Dm755 cpx -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
