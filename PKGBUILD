# Maintainer: AkitaOnRails <boss@akitaonrails.com>

pkgname=geary-email-autocomplete
pkgver=0.1.9
pkgrel=1
pkgdesc="GTK3 module that widens Geary recipient autocomplete and adds image copy"
arch=('x86_64' 'aarch64')
url="https://github.com/akitaonrails/geary-email-autocomplete"
license=('MIT')
# The module links only against GTK/WebKit/GLib/SQLite and can run with either stable
# `geary` or `geary-git`. Do not depend on either package directly: geary-git
# conflicts with geary but does not provide it, so a hard dependency would force
# the wrong variant on some systems.
depends=('gtk3' 'webkit2gtk-4.1' 'glib2' 'sqlite')
optdepends=('geary: stable Geary client'
            'geary-git: development Geary client')
makedepends=('pkgconf')
checkdepends=('xorg-server-xvfb')
provides=("$pkgname=$pkgver")
conflicts=('geary-email-autocomplete-bin')
options=('!debug')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7405b77fd01713962500e797138a11c3bd04275adda3a00478c75fb3bccebce8')

build() {
    cd "$pkgname-$pkgver"
    make
}

check() {
    cd "$pkgname-$pkgver"
    make test
    make smoke
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 "libgeary-email-autocomplete.so" \
        "$pkgdir/usr/lib/$pkgname/libgeary-email-autocomplete.so"
    install -Dm0755 "packaging/aur/inject.sh" \
        "$pkgdir/usr/lib/$pkgname/inject.sh"
    install -Dm0644 "packaging/aur/$pkgname.hook" \
        "$pkgdir/usr/share/libalpm/hooks/$pkgname.hook"
    install -Dm0644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm0644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
