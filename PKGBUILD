# Maintainer: Alexander Dunlap <alexander dot dunlap at gmail dot com>
pkgname=h4h5tools
pkgver=2.2.5
pkgrel=2
epoch=
pkgdesc="Tools for converting between HDF4 and HDF5 formats"
arch=('x86_64')
url="https://portal.hdfgroup.org/display/support/Download+h4h5tools"
license=('BSD')
groups=()
depends=('hdf4' 'hdf5' 'libaec' 'libtirpc' 'libjpeg' 'krb5' 'hdf-eos2' 'hdf-eos5')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://support.hdfgroup.org/ftp/HDF5/releases/h4toh5/h4toh5-$pkgver/src/$pkgname-$pkgver.tar.gz" "h4h5tools-configure-lm.patch" "h4h5tools-format-security-fix.patch")
noextract=()
sha256sums=("79f6505c1df3ad0c2cc1a19b9b433b5d955dfd7d2dffefc080d89fdde01fd6f2" "ac04b58e9d84a9ca158ad58c4c83fe43d2bddecf685061c9e78ad07bd4ac6a83"
"04d4e7a9458f887187de2e8816eea238d9e49eae6f9e2b70524a69a510a48aeb")
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
  patch -p0 -i "$srcdir/h4h5tools-configure-lm.patch"
  patch -p1 -i "$srcdir/h4h5tools-format-security-fix.patch"
  autoreconf -i
	CC="/opt/hdf4/bin/h4cc" ./configure --with-hdf5=/usr --with-hdfeos2=/usr --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	CC="/opt/hdf4/bin/h4cc" make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
