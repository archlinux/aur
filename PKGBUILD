# Maintainer: alba4k <blaskoazzolaaaron[at]gmail.com>
pkgname=albafetch-git
pkgver=4.2.1.r121.gef119272
pkgrel=1
pkgdesc="Neofetch, but written in C; both faster and worse than the original (latest commit)"
arch=(x86_64 aarch64)
url="https://github.com/alba4k/albafetch"
license=('MIT')
depends=(pciutils sqlite glib2)
makedepends=(git make gcc meson ninja pkgconf)
conflicts=(albafetch albafetch-bin)
provides=(albafetch)
source=("git+$url")
md5sums=('SKIP')

backup=("etc/xdg/albafetch.conf")

pkgver() {
    cd albafetch
    git describe --long --tags --abbrev=8 --exclude='*[a-zA-Z][a-zA-Z]*' \
      | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd albafetch
    meson setup build
    meson compile -C build
}

check() {
    echo -e "\e[33m\e[1mTesting every module.\e[0m Feel free to report anything not working on https://github.com/alba4k/albafetch/issues"
    albafetch/build/albafetch --debug --no-pip
}

package() {
    cd albafetch
    install -Dm755 build/albafetch $pkgdir/usr/bin/albafetch

    install -Dm644 albafetch.conf $pkgdir/etc/xdg/albafetch.conf
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
	install -Dm644 README.md $pkgdir/usr/share/doc/$pkgname/README.md
}

