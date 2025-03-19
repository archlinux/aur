pkgname="shig-git"
pkgver=1.1.1.r2.g02f0ad0
pkgrel=1
pkgdesc="CLI utility to sign files and verify signatures in OpenSSH compatible format (alternative to \`ssh-keygen -Y\`)"
url="https://github.com/SierraSoftworks/shig"
license=("MIT")
source=("git+https://github.com/SierraSoftworks/shig.git")
sha256sums=(SKIP)
arch=("x86_64" "i686" "aarch64")
makedepends=("go" "git")
conflicts=("${pkgname%-git}")

pkgver() {
	cd "${pkgname%-git}"
	git describe --long --tags --match="v*.*" --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
	cd "${pkgname%-git}"
	mkdir build/
}

build() {
	cd "${pkgname%-git}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o build .
}

package() {
	cd "${pkgname%-git}"
	install -Dm755 build/"${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
	install -Dm644 -t "$pkgdir/usr/share/doc/${pkgname%-git}" LICENSE README*
}
