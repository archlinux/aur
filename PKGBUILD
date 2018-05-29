# Maintainer: Torben <torben.letorbi at gmail dot com>
# Contributor: emersion <contact at emersion dot fr>
# Contributor: Techlive Zheng <techlivezheng at gmail dot com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo at gmail dot com>

pkgname=geary-git
pkgver=r3615.17551d17
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
source=('git://git.gnome.org/geary'
        'geary-enchant2.patch')
sha256sums=('SKIP'
            '23261cd5ff7b3a602d6e6e5bbf8cfce05d975026be476cfd120a98000d0aa5c6')

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
