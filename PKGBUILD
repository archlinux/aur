# Maintainer: Bjarne Øverli <bjarne.oeverli@gmail.com>
pkgname=tema-git
pkgver=1.0.0.r75.g373ce55
pkgrel=1
pkgdesc="GTK4/Adwaita Omarchy theming application with pywal integration"
arch=('any')
url="https://github.com/bjarneo/tema"
license=('MIT')
depends=('gjs>=1.66'
         'gtk4>=4.6'
         'libadwaita>=1.0'
         'gdk-pixbuf2'
         'python-pywal')
makedepends=('git'
             'meson>=0.59'
             'ninja')
optdepends=('omarchy: theme integration support'
            'imagemagick: enhanced thumbnail generation')
provides=('tema')
conflicts=('tema')
install=tema.install
source=("git+https://github.com/bjarneo/tema.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "1.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    arch-meson . build
    meson compile -C build
}

package() {
    cd "$srcdir/${pkgname%-git}"

    # Install using meson
    meson install -C build --destdir="$pkgdir"

    # Install documentation
    install -dm755 "$pkgdir/usr/share/doc/tema"
    install -m644 README.md "$pkgdir/usr/share/doc/tema/"

    # Create Wallpapers directory in skel for new users
    install -dm755 "$pkgdir/etc/skel/Wallpapers"

    # Install license if it exists
    if [[ -f LICENSE ]]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
