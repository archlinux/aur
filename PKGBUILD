# Maintainer: oakszyjrnrdy <oakszyjrnrdy at outlook dot com>
_pkgname="gvtg_vgpu"
pkgname="$_pkgname-git"
pkgver=r2.d0db17f
pkgrel=1
pkgdesc="Systemd files to automatically create and remove gvtg vgpu"
arch=("x86_64")
url="https://github.com/oakszyjrnrdy/$_pkgname"
license=('GPL')
makedepends=("git")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+$url")
sha256sums=("SKIP")

prepare() {
	cd "$srcdir/$pkgname"
	# change these local variables before installation
	# see https://wiki.archlinux.org/index.php/Intel_GVT-g for more infomation
	local gvt_dom="0000:00"
	local gvt_pci="0000:00:02.0"
	local gvt_guid="82b30fb4-4093-4b1d-9045-f32c4285e894"
	local gvt_type="i915-GVTg_V5_2"
	sed -i "s/gvt_dom/$gvt_dom/" "$_pkgname.service"
	sed -i "s/gvt_pci/$gvt_pci/" "$_pkgname.service"
	sed -i "s/gvt_guid/$gvt_guid/" "$_pkgname.service"
	sed -i "s/gvt_type/$gvt_type/" "$_pkgname.service"
}

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m 644 "$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
	install -D -m 755 "$_pkgname.sh" "$pkgdir/usr/lib/systemd/system-sleep/$_pkgname.sh"
}
