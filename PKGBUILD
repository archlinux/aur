# Maintainer: GreyXor <greyxor@protonmail.com>

pkgname=libliftoff-git
pkgver=0.4.0.r7.g58b8494
pkgrel=1
pkgdesc="Lightweight KMS plane library (git development version)"
arch=('x86_64')
url="https://gitlab.freedesktop.org/emersion/libliftoff"
license=("custom:MIT")
depends=("libdrm"
"glibc"
)
makedepends=("git"
"meson"
"ninja"
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://gitlab.freedesktop.org/emersion/libliftoff.git")
b2sums=('SKIP')

pkgver() {
	cd "$pkgname"

	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	meson --prefix /usr --buildtype=release "$pkgname" build
	ninja -C build
}

check() {
	ninja -C build test
}

package() {
	DESTDIR="$pkgdir" ninja -C build install

	cd "$srcdir/$pkgname"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
