# Maintainer: Torben <torben.letorbi at gmail dot com>
# Contributor: emersion <contact at emersion dot fr>
# Contributor: Techlive Zheng <techlivezheng at gmail dot com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo at gmail dot com>

pkgname=geary-git
pkgver=r3568.4ac7c10f
pkgrel=1
pkgdesc="A lightweight email client for the GNOME desktop"
arch=(i686 x86_64)
url="https://wiki.gnome.org/Apps/Geary"
license=('GPL3')
depends=('cairo' 'enchant' 'gcr' 'gdk-pixbuf2' 'glib2' 'glibc' 'gmime'
         'gnome-keyring' 'gtk3' 'iso-codes' 'libcanberra' 'libgee' 'libnotify'
         'libsecret' 'libsoup' 'libxml2' 'pango' 'sqlite' 'webkit2gtk')
makedepends=('cmake' 'gnome-doc-utils' 'gobject-introspection' 'intltool'
             'vala')
provides=('geary')
conflicts=('geary')
source=('git://git.gnome.org/geary'
        'geary-enchant2.patch')
sha256sums=('SKIP'
            '87a0adc3d07a6bd6405c8170eea5be700ef89b70d15c8912b428c9326a746078')

pkgver() {
	cd "$srcdir/geary"
	printf "r%s.%s" "$(git rev-list --count master)" "$(git rev-parse --short master)"
}

prepare() {
  cd "$srcdir/geary"

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build

  patch -Np1 -i ../geary-enchant2.patch
}

build() {
	cd "$srcdir/geary"

	cd build

	cmake .. \
	    -DCMAKE_INSTALL_PREFIX='/usr' \
	    -DDESKTOP_UPDATE='FALSE' \
	    -DICON_UPDATE='FALSE' \
	    -DGSETTINGS_COMPILE='FALSE' \
	    -DGSETTINGS_COMPILE_IN_PLACE='FALSE'
	make
}

package() {
	cd "$srcdir/geary"
	cd build
	make DESTDIR="${pkgdir}" install
}
