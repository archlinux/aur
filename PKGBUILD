# Maintainer: Prietus <prietus@live.com>
pkgname=mochawaita-gtk-theme-git
pkgver=r8.e872c59
pkgrel=1
pkgdesc="Catppuccin Mocha in the shape of Adwaita: GTK3/GTK4 theme (recolored adw-gtk3) and tinted icons"
arch=('any')
url="https://github.com/prietus/mochawaita-gtk-theme"
license=('LGPL-2.1-or-later')
depends=('python' 'python-pillow' 'librsvg' 'adwaita-icon-theme' 'glib2')
makedepends=('git')
optdepends=('gtk3: GTK3 applications'
            'gtk4: GTK4 applications'
            'libadwaita: libadwaita applications (recolored through the user gtk.css)'
            'gtk-update-icon-cache: icon theme cache'
            'fuzzel: mochawaita apply sets its icon theme')
provides=('mochawaita-gtk-theme')
conflicts=('mochawaita-gtk-theme')
backup=('etc/mochawaita.conf')
install=mochawaita.install
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    bin/mochawaita build "$srcdir/themes"
}

package() {
    cd "$pkgname"
    install -d "$pkgdir/usr/share/themes"
    cp -a "$srcdir/themes/." "$pkgdir/usr/share/themes/"

    install -Dm644 -t "$pkgdir/usr/lib/mochawaita/mochawaita" mochawaita/*.py
    python -m compileall -q -d /usr/lib/mochawaita/mochawaita \
        "$pkgdir/usr/lib/mochawaita/mochawaita"
    install -Dm755 bin/mochawaita "$pkgdir/usr/bin/mochawaita"

    install -Dm644 packaging/arch/mochawaita-icons.hook \
        "$pkgdir/usr/share/libalpm/hooks/mochawaita-icons.hook"
    install -Dm644 packaging/arch/mochawaita.conf "$pkgdir/etc/mochawaita.conf"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
