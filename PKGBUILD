# Maintainer: Torben <torben.letorbi at gmail dot com>
# Contributor: emersion <contact at emersion dot fr>
# Contributor: Techlive Zheng <techlivezheng at gmail dot com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo at gmail dot com>

pkgname=geary-git
pkgver=r5394.b08cee78
pkgrel=1
pkgdesc="An email application built around conversations, for the GNOME 3 desktop."
arch=(i686 x86_64)
url="https://gitlab.gnome.org/GNOME/geary"
license=('GPL3')
depends=('appstream-glib' 'enchant' 'folks' 'gcr' 'gmime3' 'gtk3'
         'gnome-online-accounts' 'gspell' 'libgee' 'libhandy' 'libnotify'
         'libpeas' 'libsoup' 'libunwind' 'libxml2' 'libytnef' 'sqlite'
         'webkit2gtk')
makedepends=('git' 'gobject-introspection' 'itstool' 'meson' 'vala')
provides=('geary')
conflicts=('geary')
source=('git+https://gitlab.gnome.org/GNOME/geary.git'
        'force-system-libhandy.patch')
sha256sums=('SKIP'
            'e55e842557f68c3630a2ad1fa19b09bbaf0d1bdeb556650dd9065794cdc80de9')

pkgver() {
	cd "$srcdir/geary"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/geary"
	rm -rf build
	patch -Np1 -i ../force-system-libhandy.patch
}

build() {
	cd "$srcdir/geary"
	meson --prefix=/usr --buildtype=release build
	ninja -v -C build
}

package() {
	cd "$srcdir/geary"
	DESTDIR="$pkgdir" ninja -v -C build install
}
