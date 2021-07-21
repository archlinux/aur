pkgname=kaniko-git
pkgver=v1.6.0.r12.g682191f52
pkgrel=1
pkgdesc='Build Container Images without Docker'
arch=('x86_64')
url="https://github.com/GoogleContainerTools/kaniko"
license=('Apache')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::git+https://github.com/GoogleContainerTools/kaniko.git")
sha256sums=('SKIP')
install=kaniko-git.install

pkgver(){
	cd $srcdir/kaniko
	git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare(){
	cd $srcdir/kaniko
	mkdir -p ./bin
}

build() {
	cd $srcdir/kaniko
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o ./bin ./cmd/...
}

package() {
	cd $srcdir/kaniko
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 bin/executor "$pkgdir"/usr/bin/kaniko
	install -Dm755 bin/warmer "$pkgdir"/usr/bin/kaniko-warmer
}

