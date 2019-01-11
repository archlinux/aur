# Maintainer: Torben <torben.letorbi at gmail dot com>
# Contributor: emersion <contact at emersion dot fr>
# Contributor: Techlive Zheng <techlivezheng at gmail dot com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo at gmail dot com>

pkgname=geary-git
pkgver=r4025.668e4b46
pkgrel=1
pkgdesc="A lightweight email client for the GNOME desktop"
arch=(i686 x86_64)
url="https://wiki.gnome.org/Apps/Geary"
license=('GPL3')
depends=('enchant' 'gcr' 'gmime' 'gtk3' 'libgee' 'libnotify' 'libsoup'
         'libunwind' 'libxml2' 'sqlite' 'webkit2gtk')
makedepends=('gobject-introspection' 'itstool' 'meson' 'vala')
provides=('geary')
conflicts=('geary')
source=('git+https://gitlab.gnome.org/GNOME/geary.git'
        'geary-enchant2.patch')
sha256sums=('SKIP'
            'c4978c3885085e5e35f94cbf6a33f227c5a7a6cab753c738186b5b72a62e636c')

pkgver() {
	cd "$srcdir/geary"
	printf "r%s.%s" "$(git rev-list --count master)" "$(git rev-parse --short master)"
}

prepare() {
  cd "$srcdir/geary"
  if [[ -d build ]]; then
    rm -rf build
  fi
  patch -Np1 -i ../geary-enchant2.patch
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
