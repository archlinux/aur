# Maintainer: mmaher88 <mina.maher88@hotmail.com>

_pkgbase=ab-download-manager
pkgname=${_pkgbase}-wayland-git
pkgver=1.8.7.r3.g48a6951
pkgrel=1
pkgdesc="A Download Manager that speeds up your downloads (with Wayland fractional scaling fix + YouTube download support)"
arch=('any')
url="https://abdownloadmanager.com"
license=('Apache-2.0')
depends=(
	'libxrender'
	'libxtst'
	'harfbuzz'
	'fontconfig'
)
makedepends=(
	'git'
	'java-environment>=21'
	'gradle'
)
optdepends=(
	'libappindicator-gtk3: tray icon support'
	'yt-dlp: YouTube format discovery and URL extraction'
	'ffmpeg: merging YouTube video and audio streams'
)
provides=("$_pkgbase")
conflicts=("$_pkgbase" "$_pkgbase-bin" "$_pkgbase-git" 'abdownloadmanager-bin')
source=(
	"$_pkgbase::git+https://github.com/mmaher88/ab-download-manager.git#branch=fix/wayland-fractional-scaling"
	'abdownloadmanager.desktop'
)
sha256sums=('SKIP'
            'SKIP')

pkgver() {
	cd "$_pkgbase"
	git describe --long --tags --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' || \
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$_pkgbase"
	export JAVA_HOME=$(find /usr/lib/jvm -maxdepth 1 -name 'java-*-openjdk' | sort -V | tail -1)
	gradle createReleaseDistributable
}

package() {
	cd "$_pkgbase"
	mkdir -p "$pkgdir/opt/abdownloadmanager/"
	cp -r desktop/app/build/compose/binaries/main-release/app/ABDownloadManager/* "$pkgdir/opt/abdownloadmanager/"

	install -Dm755 /dev/stdin "$pkgdir/usr/bin/ABDownloadManager" <<-'WRAPPER'
	#!/bin/sh
	exec /opt/abdownloadmanager/bin/ABDownloadManager "$@"
	WRAPPER

	install -Dm644 desktop/app/icons/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/abdownloadmanager.png"
	install -Dm644 "$srcdir/../abdownloadmanager.desktop" "$pkgdir/usr/share/applications/abdownloadmanager.desktop"
}
