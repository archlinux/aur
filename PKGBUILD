# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=ab-download-manager
pkgname=${_pkgbase}-git
pkgver=1.6.14.r1.g5a6ba7e
pkgrel=1
pkgdesc="A Download Manager that speeds up your downloads"
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
	'java-environment=21'
	'gradle'
)
optdepends=(
	'libappindicator-gtk3: tray icon support'
)
provides=("$_pkgbase")
conflicts=("$_pkgbase" abdownloadmanager-bin)
source=(
	"$_pkgbase::git+https://github.com/amir1376/ab-download-manager.git"
	'abdownloadmanager.desktop'
)
sha256sums=('SKIP'
            '5a4bf7f33c90e750d1755da005cfd81a80913620ab0abe256d9b91ec6dd01ccf')

pkgver() {
	cd "$_pkgbase"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
	cd "$_pkgbase"
	export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
	gradle createReleaseDistributable
}

package() {
	cd "$_pkgbase"
	mkdir -p "$pkgdir/opt/abdownloadmanager/"
	cp -r desktop/app/build/compose/binaries/main-release/app/ABDownloadManager/* "$pkgdir/opt/abdownloadmanager/"

	install -Dm644 desktop/app/icons/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/abdownloadmanager.png"
	install -Dm644 "$srcdir/../abdownloadmanager.desktop" "$pkgdir/usr/share/applications/abdownloadmanager.desktop"
}

