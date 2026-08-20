# Maintainer: Slavi Pantaleev <slavi@devture.com>
#
# Upstream location: https://github.com/etkecc/komai/blob/main/etc/packaging/archlinux/komai-bin/PKGBUILD
# Komai develops this PKGBUILD in-tree. The copy submitted to AUR
# (aur.archlinux.org:komai-bin.git) is kept in sync from the upstream file
# above. Patches are welcome at the upstream repository, not against the AUR
# copy.
#
# komai-bin installs the prebuilt AppImage from the matching GitHub release
# instead of compiling from source (see the sibling komai package for that),
# so slow machines can install and update without the multi-minute build.
pkgname=komai-bin
_pkgname=komai
pkgver=2026.08.20.0
pkgrel=1
pkgdesc="A fine Matrix chat app you can get to love (prebuilt AppImage)"
arch=('x86_64' 'aarch64')
url="https://komai.chat"
license=('GPL-3.0-or-later')
# The AppImage bundles Qt6, QtWebEngine, GStreamer and ffmpeg, so the only
# runtime dependency is the icon theme for menu integration. fuse2 is
# deliberately absent: the AppImage is extracted at install time rather than
# FUSE-mounted on every launch.
depends=('hicolor-icon-theme')
conflicts=('komai')
provides=("komai=${pkgver}")
# The payload is an already-built, stripped binary tree; let it through as-is.
options=(!strip !debug)
_url_base="https://github.com/etkecc/komai/releases/download/v${pkgver}"
source_x86_64=("komai-${pkgver}-x86_64.AppImage::${_url_base}/komai-${pkgver}-x86_64.AppImage")
source_aarch64=("komai-${pkgver}-aarch64.AppImage::${_url_base}/komai-${pkgver}-aarch64.AppImage")
# In-tree development keeps SKIP, matching the source komai PKGBUILD. The AUR
# release process downloads the published AppImages and replaces these with
# real sha256sums before pushing (see ../komai/README.md for the AUR workflow).
sha256sums_x86_64=('cb0570662be361f2182fa190a391b51077b7a826ad490880b6f5ddb3573783f7')
sha256sums_aarch64=('2d0e4dcbef54aea62b615793276241e48e031e52c5d653ba946bdf77cb2b4c6c')
noextract=(
	"komai-${pkgver}-x86_64.AppImage"
	"komai-${pkgver}-aarch64.AppImage"
)

package() {
	cd "$srcdir"
	local img="komai-${pkgver}-${CARCH}.AppImage"
	chmod +x "$img"
	"./$img" --appimage-extract >/dev/null

	# Ship the whole AppDir under /opt and launch through AppRun, which reads
	# AppRun.env (incl. the QTWEBENGINE_* wiring Element Call needs) and execs
	# usr/bin/komai. AppRun resolves $APPDIR from /proc/self/exe, so invoking
	# it via the /usr/bin/komai symlink yields APPDIR=/opt/komai. The inner
	# binary is not independently executable (relative ELF interpreter), so it
	# must always be reached through AppRun.
	install -d "$pkgdir/opt/$_pkgname"
	cp -a squashfs-root/. "$pkgdir/opt/$_pkgname/"

	# Route komai's self-relaunches (the profile switcher's detached re-exec
	# and generated per-profile .desktop entries) through /usr/bin/komai rather
	# than the inner binary, which a menu click or fresh shell cannot run.
	# AppRun exports this; app_paths::executablePathForRelaunch() honours it.
	# Harmless no-op on releases that predate that helper.
	printf '%s\n' 'KOMAI_EXECUTABLE_PATH=/usr/bin/komai' \
		>> "$pkgdir/opt/$_pkgname/AppRun.env"

	install -d "$pkgdir/usr/bin"
	ln -s "/opt/$_pkgname/AppRun" "$pkgdir/usr/bin/komai"

	# Desktop entry (Exec=komai already resolves via PATH to our symlink).
	install -Dm644 squashfs-root/cc.etke.komai.desktop \
		"$pkgdir/usr/share/applications/cc.etke.komai.desktop"

	# Icons into the system hicolor theme for menu integration.
	local f rel
	for f in squashfs-root/usr/share/icons/hicolor/*/apps/cc.etke.komai.*; do
		rel="${f#squashfs-root/usr/share/icons/}"
		install -Dm644 "$f" "$pkgdir/usr/share/icons/$rel"
	done
}
