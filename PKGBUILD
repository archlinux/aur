# Maintainer: Mario Oenning <mo-son[at]mailbox[dot]org>
# Author: Mario Oenning <mo-son[at]mailbox[dot]org>

pkgname=matray
pkgver=1.0.0
pkgrel=1
pkgdesc="A Manjaro Linux announcements notification app"
arch=('x86_64' 'aarch64')
url="https://github.com/moson-mo/$pkgname"
license=('BSD')
depends=('gtk3' 'libsoup' 'libgee' 'libappindicator-gtk3' 'glib2' 'json-glib')
makedepends=('vala' 'meson' 'ninja')
conflicts=('mntray')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('4587716a1fe48ee4d73c165c61bac1647560b8e6b2a64f64c00513c0bfd4bc40')

build() {
  cd $pkgname-$pkgver
  meson build --prefix=/usr
  ninja -C build
}

package() {
    cd $pkgname-$pkgver

    # binary and translations
    DESTDIR="$pkgdir" ninja -C build install

    # license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "resources/LICENSE_ICONS" "$pkgdir/usr/share/licenses/$pkgname/LICENSE_ICONS"

    # application file
    install -Dm644 "resources/misc/$pkgname.desktop" "$pkgdir/usr/share/applications/org.moson.$pkgname.desktop"

    # autostart
    install -Dm644 "resources/misc/autostart.desktop" "$pkgdir/etc/xdg/autostart/org.moson.$pkgname.desktop"
    
    # icons
    icons="resources/icons/"
    for file in $(find $icons -type f); do
        install -Dm644 ${file} "$pkgdir/usr/share/icons/hicolor/${file#$icons}"
    done
}
