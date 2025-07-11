# Maintainer: Alex Potapenko <opotapenko@gmail.com>

pkgname=calibre-bin
pkgver=8.6.0
pkgrel=1
pkgdesc="Official desktop version Calibre"
arch=(x86_64)
url="https://github.com/kovidgoyal/calibre"
license=(GPL3)
depends=()
makedepends=()
optdepends=()
conflicts=(calibre calibre-git)
provides=()

# Sources
#   Since there doesn't seem to be a simple way to generate desktop
#   integration files without building calibre from source,
#   we'll provide them here
source=(
	share.tar.xz
	$url/releases/download/v${pkgver}/calibre-${pkgver}-x86_64.txz
)

prepare() {
    # don't want the sources symlinks in the final tarball
    for src in "${source[@]##*/}"; do
        if [[ -L "$srcdir/$src" ]]; then
            rm "$srcdir/$src"
        fi
    done
}

# Checksums
sha256sums=('c7aae61afba19c9cceed8bbafd2b39b5c4d6d683de0ccfc9c1fe2651857f757a'
            'f9c69d40ece16e0011b58ec85c7dc3e62ae980b54afa46c21306ae941d2ef95f')

package() {
	# Creating needed directories
	install -dm755 "$pkgdir/usr/bin"
	install -dm755 "$pkgdir/opt/calibre"

	# Package calibre
	cp -af "$srcdir/"* "$pkgdir/opt/calibre"
	mv -f "$pkgdir/opt/calibre/share" "$pkgdir/usr"

	# Create symlinks in /usr/bin
	for f in `find "$pkgdir/opt/calibre" -maxdepth 1 -type f -printf "%f\n"`; do
		ln -s "/opt/calibre/$f" "$pkgdir/usr/bin/$f"
	done
}
