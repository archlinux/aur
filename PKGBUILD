# Maintainer: Alex Potapenko <opotapenko@gmail.com>

pkgname=calibre-bin
pkgver=9.2.0
pkgrel=1
pkgdesc="Official binary version Calibre"
arch=(x86_64)
url="https://download.calibre-ebook.com"
license=(GPL3)
depends=()
makedepends=()
optdepends=()
conflicts=(calibre calibre-git)
provides=()
options=('!strip')

# Sources
#   Since there doesn't seem to be a simple way to generate desktop
#   integration files without building calibre from source,
#   we'll provide them here
source=(
	share.tar.xz
	$url/${pkgver}/calibre-${pkgver}-x86_64.txz
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
            '754ba5cfc039c8502d3669773df8b59de7aa2f0e4275925103c6d22f5b081225')

package() {
	# Creating needed directories
	install -dm755 "$pkgdir/usr/bin"
	install -dm755 "$pkgdir/opt/calibre"

	# Package calibre
	cp -af "$srcdir/"* "$pkgdir/opt/calibre"
	mv -f "$pkgdir/opt/calibre/share" "$pkgdir/usr"
	# espeak-ng-data used by calibre
	install -dm755 "$pkgdir/opt/calibre/share"
	mv -f "$pkgdir/usr/share/espeak-ng-data" "$pkgdir/opt/calibre/share"

	# Create symlinks in /usr/bin
	for f in `find "$pkgdir/opt/calibre" -maxdepth 1 -type f -printf "%f\n"`; do
		ln -s "/opt/calibre/$f" "$pkgdir/usr/bin/$f"
	done
}
