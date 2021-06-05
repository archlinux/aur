# Maintainer: Mario Oenning <mo-son[at]mailbox[dot]org>
# Author: Mario Oenning <mo-son[at]mailbox[dot]org>

_pkgbase=matray
pkgname=matray-git
pkgver=16.585b68a
pkgrel=1
pkgdesc="A Manjaro Linux announcements notification app"
arch=('x86_64' 'aarch64')
url="https://github.com/moson-mo/$_pkgbase"
license=('BSD')
depends=('gtk3' 'libsoup' 'libgee' 'libappindicator-gtk3' 'glib2' 'json-glib')
makedepends=('git' 'vala' 'meson' 'ninja')
provides=('matray')
conflicts=('mntray' 'matray')
source=("$_pkgbase::git+$url.git")

sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgbase"
  meson build --prefix=/usr
  ninja -C build
}

package() {
    cd "$srcdir/$_pkgbase"

    # binary and translations
    DESTDIR="$pkgdir" ninja -C build install

    # license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
    install -Dm644 "resources/LICENSE_ICONS" "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE_ICONS"

    # application file
    install -Dm644 "resources/misc/$_pkgbase.desktop" "$pkgdir/usr/share/applications/org.moson.$_pkgbase.desktop"

    # autostart
    install -Dm644 "resources/misc/autostart.desktop" "$pkgdir/etc/xdg/autostart/org.moson.$_pkgbase.desktop"
    
    # icons
    icons="resources/icons/"
    for file in $(find $icons -type f); do
        install -Dm644 ${file} "$pkgdir/usr/share/icons/hicolor/${file#$icons}"
    done
}
