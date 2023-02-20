# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=sway-systemd-git
pkgver=0.3.0.r0.g226aefb
pkgrel=1
pkgdesc="Systemd integration for Sway session"
arch=(any)
url="https://github.com/alebastr/sway-systemd"
license=("custom:MIT")
depends=("python" "sway" "dbus" "python-dbus-next" "python-i3ipc" "python-psutil" "python-xlib" "python-tenacity")
makedepends=("git" "meson")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "sway-services-git")
source=('sway-systemd::git+https://github.com/alebastr/sway-systemd.git')
sha512sums=('SKIP')


pkgver() {
    cd "$srcdir/${pkgname%-git}"

    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {

    arch-meson \
        -Dautostart=true \
        -Dcgroups=enabled \
        -Dlocale1=true \
        "$srcdir/${pkgname%-git}" build
    ninja -C build
}

check() {

    ninja -C build test
}

package() {

    DESTDIR="$pkgdir" ninja -C build install

    cd "$srcdir/${pkgname%-git}"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname%-git}/README.md"
}
