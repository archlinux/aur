# Maintainer: Torben <torben.letorbi at gmail dot com>
# Contributor: emersion <contact at emersion dot fr>
# Contributor: Techlive Zheng <techlivezheng at gmail dot com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo at gmail dot com>

pkgname=geary-git
pkgver=r5013.b153755d
pkgrel=1
pkgdesc="An email application built around conversations, for the GNOME 3 desktop."
arch=(i686 x86_64)
url="https://gitlab.gnome.org/GNOME/geary"
license=('GPL3')
depends=('appstream-glib' 'enchant' 'folks' 'gcr' 'gmime' 'gtk3'
         'gnome-online-accounts' 'gspell' 'libgee' 'libhandy' 'libnotify'
         'libsoup' 'libunwind' 'libxml2' 'libytnef' 'sqlite' 'webkit2gtk')
makedepends=('git' 'itstool' 'meson' 'vala')
provides=('geary')
conflicts=('geary')
source=('git+https://gitlab.gnome.org/GNOME/geary.git'
        'force-system-libhandy.patch')
sha256sums=('SKIP'
            '3817bad616f8187c45d47101b62f2dcc5172717dfbf91892e81d88905e2406cf')

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
