# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=sway-systemd-git
pkgver=v0.1.1.r3.a57f982861b9d402
pkgrel=2
pkgdesc="Systemd integration for Sway session"
arch=(any)
url="https://github.com/alebastr/sway-systemd"
license=("custom:MIT")
depends=("python" "sway" "dbus" "python-dbus-next" "python-i3ipc" "python-psutil" "python-xlib")
makedepends=("git" "meson")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git} sway-services-git")
source=('sway-systemd::git+https://github.com/alebastr/sway-systemd.git')
sha512sums=('SKIP')


pkgver() {
	cd "$srcdir/${pkgname%-git}"

        printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {

        arch-meson -Dcgroups=enabled "$srcdir/${pkgname%-git}" build
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
