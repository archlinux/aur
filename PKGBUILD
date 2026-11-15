# Maintainer: Lev Levitsky <levlev@mail.ru>
pkgbase='percolator-bin'
pkgname='percolator'
pkgver=3.09
pkgrel=1
pkgdesc="Software for postprocessing of shotgun proteomics data"
arch=('x86_64')
url="http://percolator.ms/"
license=('Apache-2.0')
depends=('gcc-libs' 'boost-libs')
makedepends=('patchelf')
conflicts=('percolator-git')
source=("percolator-v${pkgver}-linux-amd64.deb::https://github.com/percolator/percolator/releases/download/rel-${pkgver//./-}/percolator-v${pkgver//./-}-linux-amd64.deb"
        "license.txt::https://raw.githubusercontent.com/percolator/percolator/rel-${pkgver//./-}/license.txt")
sha256sums=('3488743548d607d468f5b1bdbc06e7d99d03af4f0bf00264a0a086e32d662cf1'
            '47af14373dcd046971a95e3c1d5cf9a9612aae9efa9545b66311f942c7902d1a')

package() {
	ar p "${srcdir}/percolator-v${pkgver}-linux-amd64.deb" data.tar.gz \
		| tar -xzf - -C "$pkgdir" \
			--exclude=usr/bin/gtest_unit \
			--exclude=usr/include/eigen3 \
			--exclude=usr/share/eigen3
	rmdir "$pkgdir/usr/include" "$pkgdir/usr/share" 2>/dev/null || true

	# The deb is linked against the versioned boost soname of its build
	# platform (e.g. libboost_filesystem.so.1.83.0), which does not exist in
	# the boost-libs package; point the binaries at the unversioned libraries
	# instead so they survive boost soname bumps.
	local _bin _lib
	for _bin in "$pkgdir"/usr/bin/*; do
		for _lib in $(patchelf --print-needed "$_bin" | grep '^libboost_' || true); do
			patchelf --replace-needed "$_lib" "${_lib%%.so.*}.so" "$_bin"
		done
	done

	install -Dm644 "${srcdir}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
