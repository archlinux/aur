# Maintainer: Martin Kröning <m dot kroening at hotmail dot de>
# Contributor: Jan-Erik Rediger <badboy at archlinux dot us>
_realname=Sync-my-L2P
pkgname=sync-my-l2p
pkgver=2.4.1
pkgrel=3
pkgdesc='Sync the L2P and moodle instance of RWTH Aachen University'
arch=('x86_64')
url='https://syncmyl2p.de/'
license=('LGPL3')
depends=('hicolor-icon-theme' 'qt5-base')
makedepends=('git')
_commit=b35e60690f68c376bed925dfe0fa605a3c9e9f17 # tags/v2.4.1^0
source=("git+https://github.com/RobertKrajewski/$_realname.git#commit=$_commit"
        "https://github.com/RobertKrajewski/$_realname/releases/download/v$pkgver/SyncMyL2P-$pkgver-linux.AppImage")
sha256sums=('SKIP'
            'a84527eadedea94144452f300883eef87880ee0608957dc44094cbd66e6d02c1')

prepare() {
	# Setup client_id
	chmod +x SyncMyL2P-$pkgver-linux.AppImage
	./SyncMyL2P-$pkgver-linux.AppImage --appimage-extract usr/bin/$_realname
	client_id=$(strings squashfs-root/usr/bin/$_realname | grep .apps.rwth-aachen.de)
	sed --in-place "s/\(#define CLIENTID\) .*/\1 \"$client_id\"/g; /#error ERROR: NO CLIENTID IN CLIENTID.H DEFINED/d" "$srcdir"/$_realname/include/clientId.h

	mkdir -p build
}

build() {
	cd build

	qmake ../${_realname}
	make
}

package() {
	cd build

	# Binary
	install -D -m0755 bin/$_realname "$pkgdir"/usr/bin/$_realname

    cd ../${_realname}

	# Desktop entry
	install -D -m0644 linux/$_realname.desktop "$pkgdir"/usr/share/applications/$_realname.desktop

	# Icons
	mkdir --parents "$pkgdir"/usr/share/icons && cp --recursive linux/hicolor "$pkgdir"/usr/share/icons/
	chmod --recursive 755 "$pkgdir"/usr/share/icons/hicolor
}
