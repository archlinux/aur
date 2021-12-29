# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=libliftoff-git
pkgver=0.1.0.r31.g2e1dd93
pkgrel=1
pkgdesc="Lightweight KMS plane library"
arch=(x86_64)
url="https://gitlab.freedesktop.org/emersion/libliftoff"
license=("custom:MIT")
depends=("libdrm")
makedepends=("git" "meson" "ninja")
provides=("libliftoff")
conflicts=("libliftoff")
source=("$pkgname::git+https://gitlab.freedesktop.org/emersion/libliftoff.git")
sha512sums=('SKIP')


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
