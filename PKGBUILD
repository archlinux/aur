# Maintainer: Carlos Eduardo <carana2099@gmail.com>
pkgbase=xchpst
pkgname=(xchpst xchpst-compat)
pkgver=0.8.5
pkgrel=3
pkgdesc="A backwards-compatible chpst implementation with new hardening options using namespaces and capabilities"
arch=(x86_64)
url="https://gitlab.com/init-tools/xchpst"
license=('MIT')
groups=()
depends=(glibc libcap)
makedepends=(make git)
source=("git+https://gitlab.com/init-tools/xchpst.git#tag=v$pkgver?signed")
sha256sums=('64303ff1e0ea477e092f491bb295099998d03c4b98260e2d9e719896663bc2e4')
validpgpkeys=('06AB786E936C6C73F6D8130C4510339430FC9F34')

build() {
	cd "$pkgbase"
	make
}

package_xchpst() {
	cd "$pkgbase"
	make prefix=/usr DESTDIR="$pkgdir/" install
	install -vDm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -vd "$pkgdir/usr/share/doc/$pkgname"
	install -vm644 README.md CHANGELOG "$_"
}

package_xchpst-compat() {
	pkgdesc+=" (compat symlinks)"
	depends=(xchpst)
	provides=(chpst)
	arch=(any)

	cd "$pkgbase"
	mkdir -p "$pkgdir/usr/bin"
	find "$srcdir/$pkgbase" -type l -printf '%f\n' | xargs -I {} -- ln -vs xchpst "$_/{}"
}
