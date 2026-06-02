# Maintainer: AkitaOnRails <boss@akitaonrails.com>

pkgname=geary-hide-sidebar
pkgver=0.1.1
pkgrel=1
pkgdesc="GTK3 module that hides/collapses Geary's left Mail sidebar (Ctrl+Shift+M toggle + auto by window size)"
arch=('x86_64' 'aarch64')
url="https://github.com/akitaonrails/geary-hide-sidebar-module"
license=('MIT')
# geary is the whole point; gtk3/glib2 are what the module links against (and
# are pulled in by geary anyway, but listed for correctness).
depends=('geary' 'gtk3' 'glib2')
makedepends=('pkgconf')
checkdepends=('xorg-server-xvfb')
# Pacman should auto-swap when moving between the source and binary variants.
provides=("$pkgname=$pkgver")
conflicts=('geary-hide-sidebar-bin')
# The Makefile builds -O2 without -g, so the auto debug split would be empty.
options=('!debug')
install="$pkgname.install"
# GitHub names the tag archive's top dir <repo>-<pkgver>; the repo is
# geary-hide-sidebar-module while the package is geary-hide-sidebar.
_archive="geary-hide-sidebar-module-$pkgver"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8095b061bcf5684a56351eee2479e8147c2034c3e5c3fcb336de7f02318c46f7')

build() {
    cd "$_archive"
    make
}

check() {
    cd "$_archive"
    # `make test` runs the GLib suite headless via xvfb-run.
    make test
}

package() {
    cd "$_archive"
    install -Dm0755 "libgeary-hide-sidebar.so" \
        "$pkgdir/usr/lib/$pkgname/libgeary-hide-sidebar.so"
    # The launcher-patching helper, invoked by the install scriptlet and the
    # pacman hook below.
    install -Dm0755 "packaging/aur/inject.sh" \
        "$pkgdir/usr/lib/$pkgname/inject.sh"
    # Re-patches Geary's launchers after any future `geary` install/upgrade,
    # which would otherwise restore the pristine (unpatched) files.
    install -Dm0644 "packaging/aur/$pkgname.hook" \
        "$pkgdir/usr/share/libalpm/hooks/$pkgname.hook"

    install -Dm0644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm0644 "LICENSE"   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
