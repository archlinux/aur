# Maintainer: thorou <thorou@chirality.de>

_pkgname=pat-dealloc
pkgname=$_pkgname-dkms
pkgver=1.1.0
pkgrel=1
pkgdesc="Kernel module to allow removal of x86 PAT entries from userspace"
url="https://github.com/thorio/$_pkgname"
license=("GPL3")
arch=("x86_64")
depends=("dkms")
makedepends=("cargo")
_archive="$_pkgname-$pkgver"
source=("$_archive.tar.gz::https://github.com/thorio/pat-dealloc/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("76d83fac6e3ba27dd4a0ba4616a5261c2de7dbecb3d3bd48e4f846df6beed3bd")

build() {
	cd $_archive

	export RUSTUP_TOOLCHAIN=stable
	cargo build --release --package pat-dealloc-bin
}

package() {
	install -Dm755 "$_archive/target/release/pat-dealloc" "$pkgdir/usr/bin/pat-dealloc"
	dkms_dest="${pkgdir}/usr/src/${_pkgname}-${pkgver}"

	cat > dkms.conf <<EOF
PACKAGE_NAME="$_pkgname"
PACKAGE_VERSION="$pkgver"
MAKE[0]="make"
CLEAN="make clean"
BUILT_MODULE_NAME[0]="${_pkgname/-/_}"
DEST_MODULE_LOCATION[0]="/kernel/drivers/misc"
AUTOINSTALL="yes"
EOF

	install -Dm664 dkms.conf "$dkms_dest/dkms.conf"
	install -Dm664 "$_archive/module/Makefile" "$dkms_dest/Makefile"
	install -Dm664 "$_archive/module/pat_dealloc.c" "$dkms_dest/pat_dealloc.c"
}
