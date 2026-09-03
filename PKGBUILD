# Maintainer: Andy <this.is.apb@gmail.com>
pkgname=idrive-desktop-bin
pkgver=1.11.0
pkgrel=1
pkgdesc="IDrive for Linux - official Electron desktop GUI for cloud backup, restore and sync"
arch=('x86_64')
url="https://www.idrive.com/online-backup-download"
license=('LicenseRef-IDrive')
# Translated from the .deb Depends. popt is needed by the idevsutil backup engine
# the app fetches on first run. gtk3/libnotify/etc. are pulled via the GUI libs.
# valkey is NOT here: redis is used only by the Cloud Sync daemon (sync-daemon,
# pkg "clouddrive"), so backup/restore and the GUI work without it -> optdepend.
depends=('nss' 'curl' 'sqlite' 'cronie' 'glib2' 'gtk3' 'xdotool' 'rsync' 'attr'
         'popt' 'python' 'python-gobject' 'python-watchdog' 'python-psutil')
optdepends=('valkey: Cloud Sync / Cloud Drive real-time folder sync (redis-compatible server)'
            'libappindicator-gtk3: system tray icon'
            'nautilus: file manager integration'
            'nautilus-python: cloud-sync overlay icons in Nautilus'
            'nemo-python: cloud-sync overlay icons in Nemo'
            'python-caja: cloud-sync overlay icons in Caja')
# Bundles the same /opt/IDriveForLinux backup engine as idrive-bin; only one of
# the two can manage that tree.
provides=('idrive')
conflicts=('idrive' 'idrive-bin')
options=('!strip')
install="$pkgname.install"
# Upstream serves a single, unversioned "latest" .deb, so the checksum cannot be
# pinned; pkgver() reads the real version from the deb's control file.
source=("IDriveForLinux.deb::https://www.idrivedownloads.com/downloads/linux/linux-desktop/IDriveForLinux.deb")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir"
	# deb is an ar archive; pull the control member and read its Version field.
	bsdtar -xOf IDriveForLinux.deb control.tar.gz | bsdtar -xOf - \
		| grep -m1 '^Version:' | awk '{print $2}'
}

package() {
	cd "$srcdir"

	# Unpack the deb (ar: debian-binary, control.tar.gz, data.tar.xz), then lay
	# its payload (opt/ + usr/share) straight into the package.
	bsdtar -xf IDriveForLinux.deb
	bsdtar -xf data.tar.xz -C "$pkgdir"

	# The Electron sandbox helper must be setuid root.
	chmod 4755 "$pkgdir/opt/IDriveForLinux/chrome-sandbox"

	# Launcher on PATH (the .desktop already points at the absolute path).
	install -d "$pkgdir/usr/bin"
	ln -s /opt/IDriveForLinux/idriveforlinux "$pkgdir/usr/bin/idriveforlinux"

	# License: pointer to the canonical terms plus the bundled Electron license.
	install -d "$pkgdir/usr/share/licenses/$pkgname"
	cat > "$pkgdir/usr/share/licenses/$pkgname/LICENSE" <<-'EOF'
		IDrive for Linux is proprietary software, Copyright IDrive Inc.

		Use is governed by the IDrive Terms of Service:
		    https://www.idrive.com/terms-and-conditions

		This package redistributes the unmodified official .deb payload from
		https://www.idrive.com/online-backup-download for convenience.
	EOF
	install -m644 "$pkgdir/opt/IDriveForLinux/LICENSE.electron.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
}
