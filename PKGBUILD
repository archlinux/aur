# Maintainer: GreyXor <greyxor@protonmail.com>

pkgname=framework-system-git
pkgver=r249.7ebfe61
pkgrel=1
arch=('x86_64')
pkgdesc='Tool to interact with the framework system (git development version)'
url='https://frame.work'
license=('MIT')
depends=(
	"libusb"
	"gcc-libs"
	"glibc"
	"systemd-libs"
)
makedepends=(
	"git"
	"cargo"
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/FrameworkComputer/framework-system.git")
b2sums=('SKIP')

pkgver() {
	# Calculate the version dynamically using git information
	printf "r%s.%s" "$(git -C "$srcdir/${pkgname}" rev-list --count HEAD)" "$(git -C "$srcdir/${pkgname}" rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname}"
	cargo build --release -p framework_tool
}

check() {
	cd "$srcdir/${pkgname}"
	cargo test
}

package() {
	cd "$srcdir/${pkgname}"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/framework_tool"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/${pkgname}/" "LICENSE.md"
}
