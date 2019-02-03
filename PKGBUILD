# Maintainer: Daniel Schopf <schopf.dan at gmail dot com>
pkgname=kim-api
pkgver=2.0.0_beta.3
pkgrel=2
pkgdesc="Online framework for reliable, reproducible and portable molecular simulations"
arch=("i686" "x86_64")
url="https://openkim.org"
license=('CDDL')
depends=(bash)
makedepends=(gcc-libs)
install=$pkgname.install
source=(https://s3.openkim.org/kim-api/kim-api-v2-2.0.0-beta.3.txz
        Fix-major-version-variable-name-in-CM.patch
	Fix-Doxygen-command-error.patch)
sha512sums=('22ec9661a48753676de3a20990ad712feab9c0ca0519e3c45f98d3a5ad49d3f0b33496968ac3cfe9f2c0d5bf52ea6dbd47c0283f61b35222f5fa7d1e1ccf3ed5'
            'a525539af26238560e310aa7ad23eec75fd87b1f2f82280ace8d61630c41b7780cabfdfa561d6d235101126e74e9d50ee4b767f992dd37948defa3ec589df318'
            'e2771561f05b49b7ed46b265af6a2c81ad8fbde9e6ab9f2632822764de5802ac0e91973e66d5240136ea7e9a8b82befc312dbbb3bccdb84d8875744851fcb146')

prepare() {
  cd  "kim-api-v2-2.0.0-beta.3"
  patch -p1 -i ../Fix-major-version-variable-name-in-CM.patch
  patch -p1 -i ../Fix-Doxygen-command-error.patch
  cd ..
  mkdir -p build
}

build() {
  cd build
  cmake ../kim-api-v2-2.0.0-beta.3 \
  	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_PREFIX="/usr" \
	-DCMAKE_INSTALL_LIBDIR="lib" \
	-DCMAKE_INSTALL_LIBEXECDIR="/usr/lib" \
	-DKIM_API_BUILD_EXAMPLES=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  # remove empty directories
  cd "$pkgdir"
  rm -rf usr/share
}
