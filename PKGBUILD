# Maintainer: Carlos Eduardo <carana2099@gmail.com>
pkgbase=xchpst
pkgname=(xchpst xchpst-compat)
pkgver=0.8.5
pkgrel=2
pkgdesc="A backwards-compatible chpst implementation with new hardening options using namespaces and capabilities"
arch=(x86_64)
url="https://gitlab.com/init-tools/xchpst"
license=('MIT')
groups=()
depends=(libcap)
makedepends=('make')
source=("https://gitlab.com/init-tools/xchpst/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
sha256sums=('bc8aa05a3a20c04d48cc2ac4f49b663bfef5e0ae7d02d9980f219fe909127029')
validpgpkeys=()

build() {
	cd "$pkgbase-v$pkgver"
	make
}

package_xchpst() {
	cd "$pkgbase-v$pkgver"
	make prefix=/usr DESTDIR="$pkgdir/" install
	install -vDm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -vd "$pkgdir/usr/share/doc/$pkgname"
	install -vm644 README.md CHANGELOG "$_"
	find "$pkgdir" -type l -delete
}

package_xchpst-compat() {
	pkgdesc+=" (compat symlinks)"
	depends=(xchpst)
	provides=(chpst)
	mkdir -p "$pkgdir/usr/bin"
	find "$srcdir/$pkgbase-v$pkgver" -type l -exec install -Dm755 -t "$_" {} \;
}
