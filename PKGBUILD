# Maintainer: bar0metr <admin@os-admin.ru>
pkgname=ecap-adapter-sample
_pkgname=ecap_adapter_sample
pkgver=1.0.0
pkgrel=1
pkgdesc='The sample contains three basic adapters (minimal,passthru,modifying,async). Include patches for successful compile and use `modifying` adapter to modify the contents of the whole file'
arch=('x86_64')
url='http://www.e-cap.org/archive/ecap_adapter_sample-1.0.0.tar.gz'
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname::$url")
depends=('libecap')
license=('GPL')

sha256sums=('SKIP')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver"
	msg "Preparing eCAP adapters src..."
	msg2 "Getting the replacement patch..."
	wget https://raw.githubusercontent.com/bar0metr/ecap_adapter_sample/master/replacement.patch
	msg2 "Patching..."
	patch -p0 -i replacement.patch
	msg2 "Getting the adapter_async patch..."
	wget https://raw.githubusercontent.com/bar0metr/ecap_adapter_sample/master/adapter_async.patch
	msg2 "Patching..."
	patch -p0 -i adapter_async.patch
	msg2 "Done!"
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  chmod +x ./configure
  ./configure
  make -j$(nproc)
}

package() {
  cd "$srcdir"
  make -C "$_pkgname-$pkgver" DESTDIR="$pkgdir" install
}

