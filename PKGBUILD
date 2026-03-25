# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=ab-download-manager
pkgname="$_pkgbase"
pkgver=1.8.7
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
	'gtk3'
)
makedepends=(
	'git'
	'java-environment=21'
	'gradle'
)
optdepends=(
	'libappindicator-gtk3: tray icon support'
)
conflicts=('abdownloadmanager-bin')
source=(
	"$_pkgbase::git+https://github.com/amir1376/ab-download-manager.git#tag=v$pkgver"
	'abdownloadmanager.desktop'
)
sha256sums=('fffe14ecd72e0d7137c5e5eb72406605f93ec44b15e92de9ecd419ea43c2eb35'
            'd194cf142921d78c8a2a8c6c2b3a8b41bf2545eb2c7147a8f866946528227031')

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

