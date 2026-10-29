# Maintainer: spartanz51 <a.m@tuta.com>
#
# Prebuilt TutaBridge desktop app (the Tauri GUI, bridge included): installs
# the files of the .deb published with the GitHub release, no build. The
# headless daemon is tutabridge-bin / tutabridge-git: it can be installed
# next to this one (different binaries, same configuration), just not run
# at the same time. For a build-from-source VCS package, see
# tutabridge-desktop-git.
pkgname=tutabridge-desktop-bin
pkgver=0.1.0rc15
pkgrel=1
pkgdesc="Local IMAP/SMTP bridge for Tuta encrypted email (prebuilt desktop app)"
arch=('x86_64')
url="https://github.com/spartanz51/tutabridge"
license=('GPL-3.0-or-later')
depends=('webkit2gtk-4.1' 'gtk3' 'dbus' 'libayatana-appindicator')
optdepends=('gnome-keyring: persist the Tuta session across reboots (Secret Service)'
            'kwallet: alternative Secret Service provider')
provides=('tutabridge-desktop')
conflicts=('tutabridge-desktop')
# No tutabridge-desktop-bin-debug split: makepkg would carve the prebuilt
# binary's symbols into one, and it would hold the same /usr/lib/debug file
# as tutabridge-desktop-git-debug, so switching between -bin and -git would
# fail.
options=(!debug)
_tag=v0.1.0-rc.15
source=("TutaBridge-$pkgver.deb::$url/releases/download/$_tag/TutaBridge-Linux.deb"
        "LICENSE::https://raw.githubusercontent.com/spartanz51/tutabridge/$_tag/LICENSE")
noextract=("TutaBridge-$pkgver.deb")
sha256sums=('f540d121fe96e5605321c89c3eb060a643ce31530b422e6be607b41fe4c3c5b9'
            '947215ddc328843b76022d5b77e1ca3b1152301778d33e24491e5064e92fc6cf')

package() {
	# The .deb carries /usr/bin/tutabridge-gui, the desktop file and the icons.
	bsdtar -xOf "TutaBridge-$pkgver.deb" data.tar.gz | bsdtar -xf - -C "$pkgdir"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
