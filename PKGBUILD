# Maintainer: Lev Levitsky <levlev@mail.ru>
pkgbase='percolator-bin'
pkgname='percolator'
pkgver=4.00.01
pkgrel=1
pkgdesc="Software for postprocessing of shotgun proteomics data"
arch=('x86_64')
url="https://github.com/percolator/percolator"
license=('Apache-2.0')
depends=('gcc-libs' 'unzip')
makedepends=()
conflicts=('percolator-git')
source=("ubuntu-packages.zip::https://github.com/percolator/percolator/releases/download/rel-${pkgver//./-}/ubuntu-packages.zip"
        "license.txt::https://raw.githubusercontent.com/percolator/percolator/rel-${pkgver//./-}/license.txt")
sha256sums=('83a19401babb08eff65eaeaa223539949fd627a02bb2e542dddc95be21e65c47'
            '47af14373dcd046971a95e3c1d5cf9a9612aae9efa9545b66311f942c7902d1a')

# The release ships the deb inside ubuntu-packages.zip; note the deb
# filename inside is derived from the upstream version without the
# trailing patch release (e.g. percolator-v4-00-linux-amd64.deb for
# release rel-4-00-01 / pkgver 4.00.01).
_debver="${pkgver%.*}"
_debname="percolator-v${_debver//./-}-linux-amd64.deb"

package() {
	unzip -j -o "ubuntu-packages.zip" "$_debname" -d "$srcdir"
	ar p "${srcdir}/$_debname" data.tar.gz \
		| tar -xzf - -C "$pkgdir" \
			--exclude=usr/bin/gtest_unit \
			--exclude=usr/include/eigen3 \
			--exclude=usr/share/eigen3
	rmdir "$pkgdir/usr/include" "$pkgdir/usr/share" 2>/dev/null || true

	install -Dm644 "${srcdir}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
