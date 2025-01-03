# Maintainer: SelfRef <arch@selfref.dev>

_basename=ab-download-manager
pkgname=${_basename}
pkgver=1.5.0
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
	'java-environment=17'
	'gradle'
)
optdepends=(
	'libappindicator-gtk3: Tray icon support'
)
conflicts=('abdownloadmanager-bin')
source=(
	"$_basename::git+https://github.com/amir1376/ab-download-manager.git#tag=v$pkgver"
	'abdownloadmanager.desktop'
)
sha256sums=('8e462c1d01eab950ca946dce5ad6f50e401c90ba07274717aa87093095162621'
            'd194cf142921d78c8a2a8c6c2b3a8b41bf2545eb2c7147a8f866946528227031')

build() {
	cd "$_basename"
	export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
	gradle createReleaseDistributable
}

package() {
	cd "$_basename"
	mkdir -p "$pkgdir/opt/abdownloadmanager/"
	cp -r desktop/app/build/compose/binaries/main-release/app/ABDownloadManager/* "$pkgdir/opt/abdownloadmanager/"

	install -Dm644 desktop/app/icons/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/abdownloadmanager.png"
	install -Dm644 "$srcdir/../abdownloadmanager.desktop" "$pkgdir/usr/share/applications/abdownloadmanager.desktop"
}

