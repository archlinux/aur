# Maintainer: vermin <vermin.gov@proton.me>
pkgname=polycarbon
pkgver=1.0.1
pkgrel=1
pkgdesc="Double-click Windows programs: self-installing Wine runtime, crash recovery and per-app sandboxing"
arch=('any')
url="https://aur.archlinux.org/packages/polycarbon"
license=('GPL-3.0-or-later')
# Programs polycarbon calls unconditionally that base does not already pull in.
# binutils is the strings that reads a .lnk's target out of the binary; zstd is
# what `tar --zstd` shells out to for VKD3D-Proton's archive; shared-mime-info
# owns both the Windows MIME types the handler claims and the globs table that
# decides whether a Windows file type is already spoken for on the Linux side;
# python parses the prefix registry, hyprctl's JSON and Windows command lines;
# gtk3 + python-gobject are `polycarbon config`, and between them they also cover
# the tray bridge without adding anything: it binds libX11/libXcomposite/
# libXdamage through ctypes, all three already direct gtk3 dependencies, and
# reaches D-Bus through the GLib bindings python-gobject provides. That is why
# there is no python-xlib or dbus-python here.
#
# Not listed, on purpose: base members (coreutils, findutils, gawk, grep, sed,
# procps-ng, tar, util-linux, xz) are guaranteed present and only add noise;
# gtk-update-icon-cache already arrives with gtk3; and everything the runner
# reaches for behind a `command -v` test is an optdepend below, not a hard one.
#
# Wine itself is deliberately NOT a dependency: polycarbon downloads Kron4ek's
# wine-staging build into the user's home directory and keeps it on the latest
# release, so a system wine would never be the runtime that actually runs.
depends=('bash'
         'binutils'
         'curl'
         'gtk3'
         'python'
         'python-gobject'
         'shared-mime-info'
         'xdg-utils'
         'zstd')
optdepends=('bubblewrap: enforce per-app restrictions — without it, Restricted programs run with full access'
            'libnotify: progress and failure notifications on the desktop'
            'zenity: first-run dialog asking how much access a program gets'
            'vulkan-driver: Direct3D 8-12 over Vulkan via DXVK and VKD3D-Proton'
            'gamemode: performance governor for programs that turn out to be games'
            'hyprland: display-scale sync and hang detection from live window state'
            'desktop-file-utils: refresh the launcher list the moment a Windows installer creates one'
            'google-breakpad: decode a minidump left by a program that crashed internally')
# desktop-file-validate, for the check() below only. The runtime use of this
# package is the guarded update-desktop-database call, which is an optdepend:
# pacman's own hook covers the entries polycarbon *ships*, but not the ones it
# writes into the user's applications dir while an installer is running.
checkdepends=('desktop-file-utils')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz")
sha256sums=('c59f595431734d9ed45ec88bc8daf0a365353d0daa47c5fb347ee198799c7c1a')

check() {
	cd "$pkgname-$pkgver"
	bash -n polycarbon
	python -m py_compile polycarbon-config.py
	python -m py_compile polycarbon-tray.py
	desktop-file-validate polycarbon.desktop polycarbon-config.desktop
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 polycarbon "$pkgdir/usr/bin/polycarbon"
	# Not $PATH commands — `polycarbon config` execs the settings GUI by path and
	# the runner starts the tray bridge by path, both looking here whenever they
	# are not running out of a source checkout.
	install -Dm755 polycarbon-config.py "$pkgdir/usr/lib/$pkgname/polycarbon-config.py"
	install -Dm755 polycarbon-tray.py "$pkgdir/usr/lib/$pkgname/polycarbon-tray.py"

	# The MIME handler entry is NoDisplay; the settings entry is the visible one.
	# Neither is followed by an update-desktop-database or update-mime-database
	# call: desktop-file-utils and shared-mime-info ship pacman hooks that do
	# exactly that, and repeating the work in an install script is redundant.
	install -Dm644 polycarbon.desktop "$pkgdir/usr/share/applications/polycarbon.desktop"
	install -Dm644 polycarbon-config.desktop "$pkgdir/usr/share/applications/polycarbon-config.desktop"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
