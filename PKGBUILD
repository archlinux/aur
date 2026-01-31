# Maintainer: tippfehlr <tippfehlr@tippfehlr.dev>
pkgname=cpx
pkgver=1.3.6
pkgrel=1
pkgdesc="Cargo-like CLI for C++, compatible with CMake (vcpkg), Bazel and Meson"
arch=(x86_64 aarch64)
url="https://github.com/ozacod/cpx"
license=(MIT)
depends=(cmake vcpkg bazel meson)
makedepends=(git go)
source=("git+$url#tag=v$pkgver")
sha512sums=('a814ab938885936f4d2526f3a0d3c30f9fb88851da6798529f17f50a288a1f4d001aeb92d744c684b48e9caf039976fb15ed44d2fdb4b51983a4298acd473cf1')

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
