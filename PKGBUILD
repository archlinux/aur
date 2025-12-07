# Maintainer: tippfehlr <tippfehlr@tippfehlr.dev>

pkgname=horcrux
pkgver=0.3
pkgrel=2
pkgdesc="Split your file into encrypted fragments so that you don't need to remember a passcode"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/jesseduffield/horcrux"
license=('MIT')
makedepends=('git' 'go')
conflicts=('horcrux')
source=("git+$url#tag=v$pkgver")
sha512sums=('197db754c15acdbbde48e760a633ad4997a5f49613f6236c167f51cb27b596dab6d7fbf1fbe3ecea1434c763feee49f5720da6f1df91f5fd5fcae3eae849e6c5')

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
	go build -o horcrux .
}

package() {
	cd $pkgname
	install -Dm755 horcrux -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
