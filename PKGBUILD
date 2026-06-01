# Maintainer: Andy <this.is.apb@gmail.com>
pkgname=idrive-bin
pkgver=3.12.0
pkgrel=1
pkgdesc="IDrive cloud backup for Linux - official interactive menu (idrive) and idevsutil engines"
arch=('x86_64')
url="https://www.idrive.com/online-backup-linux-scripts"
license=('LicenseRef-IDrive')
# popt: required by the idevsutil/idevsutil_dedup transfer engines (not part of
# base). curl/cronie/which: used by idrive at runtime for transfers and scheduling.
depends=('popt' 'curl' 'cronie' 'which')
provides=('idrive')
conflicts=('idrive')
# Vendored prebuilt binaries: don't strip/relink, and skip the static-lib check.
options=('!strip' '!emptydirs' 'staticlibs')
install="$pkgname.install"
# Upstream serves a single, unversioned "latest" installer, so the checksum
# cannot be pinned; pkgver() below reads the real version out of it after download.
source=("idriveforlinux.bin::https://www.idrivedownloads.com/downloads/linux/download-for-linux/linux-bin/idriveforlinux.bin")
sha256sums=('SKIP')

pkgver() {
	grep -m1 -aoP '^APPVERSION="\K[^"]+' "$srcdir/idriveforlinux.bin"
}

package() {
	cd "$srcdir"

	# The .bin is a shell self-extractor with a gzipped tar appended after a
	# line matching __idrive__; unpack that payload into /opt (DESTPARENT).
	local marker
	marker=$(awk '/^__idrive__/ {print NR + 1; exit}' idriveforlinux.bin)
	# --no-same-owner: ignore the uids baked into the vendor tar so everything
	# ends up root-owned under fakeroot.
	install -d "$pkgdir/opt"
	tail -n +"$marker" idriveforlinux.bin | tar xz --no-same-owner -C "$pkgdir/opt"

	local dest="$pkgdir/opt/IDriveForLinux"
	local deps="$dest/bin/Idrivelib/dependencies"

	# Place the main menu binary for this architecture (k3 = modern kernels),
	# mirroring what the upstream installer does, then drop the other arches.
	tar xzf "$deps/linuxbin/k3/$CARCH/idrive.tar.gz" --no-same-owner -C "$dest/bin/"
	chmod 0755 "$dest/bin/idrive"
	rm -rf "$deps/linuxbin"

	# Keep only the generic Linux transfer engines; the NAS-appliance variants
	# (QNAP/Synology/Netgear/Vault) are useless on a desktop/server install.
	find "$deps/evsbin" -type f -name '*.tar.gz' ! -name 'IDrive_linux_*' -delete

	# Bundled python is per-arch; keep only this architecture's copy.
	find "$deps/pythonbin" -mindepth 1 -maxdepth 1 ! -name k3 -exec rm -rf {} +
	find "$deps/pythonbin/k3" -mindepth 1 -maxdepth 1 ! -name "$CARCH" -exec rm -rf {} +

	# CLI entry point. idrive resolves some paths relative to the working
	# directory, so the wrapper enters its bin dir before launching (matching
	# the upstream "run ./idrive from /opt/IDriveForLinux/bin" instructions).
	install -d "$pkgdir/usr/bin"
	printf '#!/bin/sh\ncd /opt/IDriveForLinux/bin && exec ./idrive "$@"\n' \
		> "$pkgdir/usr/bin/idrive"
	chmod 0755 "$pkgdir/usr/bin/idrive"

	# Proprietary license: ship a pointer to the canonical Terms of Service plus
	# the bundled readme. The full terms are not redistributed as text.
	install -d "$pkgdir/usr/share/licenses/$pkgname"
	cat > "$pkgdir/usr/share/licenses/$pkgname/LICENSE" <<-'EOF'
		IDrive for Linux is proprietary software, Copyright IDrive Inc.

		Use is governed by the IDrive Terms of Service:
		    https://www.idrive.com/terms-and-conditions

		This package redistributes the unmodified official installer payload
		from https://www.idrive.com/online-backup-linux-scripts for convenience.
	EOF
	install -m644 "$dest/bin/readme.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/readme.txt"
}
