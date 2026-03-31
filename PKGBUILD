# Maintainer: Jonah Barkley-Griggs <jbarkleygriggs@gmail.com>
_pkgname=wayvy
pkgname="${_pkgname}-git"
pkgver=r34.0000000
pkgrel=1
pkgdesc="Wayvy is a wallpaper switcher and theming manager for wayland written in rust."
url="https://codeberg.org/J_S_Barkely-Griggs/Wayvy"
license=('MPL-2.0')
arch=('x86_64')
depends=('mpvpaper')
makedepends=('rust' 'cargo' 'make' 'git')
optdepends=('python-pywal16: re-theming support'
            'walrs-extended: re-theming support with remote files'
            'walrs: re-theming support'
            'wallust: re-theming support')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
replaces=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	make FEATURES="dbus theming"
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir/" install install-config
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 "packaging/wayvy.service" -t "$pkgdir/usr/lib/systemd/user/"
}
