# Maintainer: Ainola
# Contributor: bzt

pkgname=gnome-xcf-thumbnailer
pkgver=1.0
pkgrel=10
pkgdesc="GNOME thumbnailer for GIMP XCF files."
arch=('x86_64')
url="https://download.gnome.org/sources/gnome-xcf-thumbnailer/"
license=('GPL2')
depends=('glib2' 'libpng')
makedepends=('gconf')
source=("https://download.gnome.org/sources/gnome-xcf-thumbnailer/${pkgver}/gnome-xcf-thumbnailer-${pkgver}.tar.bz2"
        "gnome-xcf-thumbnailer.thumbnailer"
        "no-popt.patch"
        "CVE-2009-0217.patch"
        "NULL-updates.patch")
sha256sums=('d0489a00a493242f65db22e2861d37f59c540055dd1aa573bb09886180ab4bd0'
            '401c9d7eb3a47a223110599c54af0b9feddc8026a1fc812df866ff19e7e33ac0'
            '9f3e31804362a7c6d3224e9fd61dd3c4cddc872eafa9b754ddab7aaa30bad8aa'
            '8a56cf5cd9fdb1aa677f93236c110572450c5f702cd3cb8fa5517ecbe6b0f1a8'
            '1637e7b2d2904729b20174fb55ef554d4b70a56b55897e7393088591d862cf8e')

prepare(){
    # Patches used by Debian to build
    patch -d gnome-xcf-thumbnailer-$pkgver -p1 < no-popt.patch
    patch -d gnome-xcf-thumbnailer-$pkgver -p1 < CVE-2009-0217.patch

    # libpng12 does not distribute headers any more. We must adjust to be
    # buildable with recent versions of libpng.
    patch -d gnome-xcf-thumbnailer-$pkgver -p1 < NULL-updates.patch
}

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
    cd "$pkgname-$pkgver"

    make DESTDIR="$pkgdir" install

    install -Dm644 ../gnome-xcf-thumbnailer.thumbnailer -t "$pkgdir/usr/share/thumbnailers/"
    install -m755 -d "$pkgdir/usr/share/gconf/schemas"
    gconf-merge-schema "$pkgdir/usr/share/gconf/schemas/${pkgname}.schemas" \
        --domain gnome-xcf-thumbnailer "$pkgdir/usr/share/$pkgname/${pkgname}.sc"
}
