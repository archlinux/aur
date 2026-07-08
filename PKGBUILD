# Maintainer: mescon <5875228+mescon@users.noreply.github.com>
pkgname=logitech-trueforce-dkms
_dkmsname=logitech-trueforce
pkgver=0.12.0
pkgrel=1
pkgdesc="DKMS kernel driver for Logitech TrueForce direct-drive wheels (RS50, G PRO): force feedback, TrueForce texture routing, and wheel settings via sysfs"
arch=('x86_64')
url="https://github.com/mescon/logitech-trueforce-linux-driver"
license=('GPL-2.0-only')
depends=('dkms')
optdepends=('oversteer: GUI to configure wheel settings'
            'wine: run Logitech SDK DLLs for TrueForce in Proton sims'
            'python: required by the TrueForce Proton shim installer')
provides=("$_dkmsname")
conflicts=("$_dkmsname")
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1efa005c4f6e6e77889e698cb8045b6526d63002c34cb4b21906cadb4d3a4ea6')

package() {
	local _src="$srcdir/logitech-trueforce-linux-driver-$pkgver"
	local _dst="$pkgdir/usr/src/$_dkmsname-$pkgver"

	# DKMS module source. The .c keeps its historical name; Kbuild builds
	# it as hid-logitech-dd.ko (scoped to the direct-drive wheels).
	install -Dm644 -t "$_dst" \
		"$_src/mainline/hid-logitech-hidpp.c" \
		"$_src/mainline/hid-ids.h" \
		"$_src/mainline/hidpp_dd_tf_init.h" \
		"$_src/mainline/Kbuild" \
		"$_src/mainline/Makefile"

	# Versioned dkms.conf (PACKAGE_VERSION must match the /usr/src dir).
	sed "s/@PKGVER@/$pkgver/" \
		"$_src/packaging/aur/$pkgname/dkms.conf" > "$_dst/dkms.conf"

	# Build-time identifier the loaded module reports (Kbuild reads it).
	echo "v$pkgver" > "$_dst/.git_hash"

	# udev rule: hand the wheel's sysfs + hidraw nodes to the input group.
	install -Dm644 "$_src/udev/70-logitech-trueforce.rules" \
		"$pkgdir/usr/lib/udev/rules.d/70-logitech-trueforce.rules"

	# TrueForce-in-Proton helper (resolves the SDK DLL dir via --sdk-dir /
	# $LOGITECH_TRUEFORCE_SDK_DIR / ~/.local/share/logitech-trueforce/sdk).
	install -Dm755 "$_src/tools/install-tf-shim.sh" \
		"$pkgdir/usr/bin/logitech-trueforce-install-shim"

	# Docs + license.
	install -Dm644 "$_src/README.md" \
		"$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 "$_src/docs/GETTING_STARTED.md" \
		"$pkgdir/usr/share/doc/$pkgname/GETTING_STARTED.md"
	install -Dm644 "$_src/COPYING" \
		"$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
