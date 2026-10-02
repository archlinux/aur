# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=shournal
pkgver=3.3
pkgrel=1
pkgdesc="Log shell-commands and used files, snapshot executed scripts; fully automatic"
arch=('x86_64' 'aarch64')
url="https://github.com/tycho-kirchner/shournal"
license=('GPL-3.0-only')
depends=('qt5-base' 'util-linux-libs' 'libcap' 'gcc-libs' 'glibc')
makedepends=('cmake' 'gcc')
optdepends=('util-linux: uuidd daemon for safe uuid generation (systemctl enable --now uuidd)')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz" 'shournal.sysusers')
sha256sums=('6f74079c680c9c1a9a2b98543b0273a264896796a6fe195e9088f5f1845da4a2'
            'f6cfce4e1ba17e7bb42dfc394cbeaf6bb79df7df45d7e06ab3743a2df4509365')

build() {
	cmake -S "$pkgname-$pkgver" -B build -DSHOURNAL_EDITION=fanotify -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -Wno-dev
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 "$srcdir/shournal.sysusers" "$pkgdir/usr/lib/sysusers.d/shournal.conf"
	install -Dm644 "$pkgname-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 "$pkgname-$pkgver/README-shell-integration.md" "$pkgdir/usr/share/doc/$pkgname/README-shell-integration.md"
	install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	rm -rf "$pkgdir/usr/share/doc/$pkgname/copyright"
}
