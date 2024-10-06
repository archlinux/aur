# Maintainer: SelfRef <arch@selfref.dev>

_basename=jan
pkgname=${_basename}-git
pkgver=0.5.4.r50.gbe8c4f8
pkgrel=1
pkgdesc="Jan is an open source alternative to ChatGPT that runs 100% offline on your computer (git version)"
url="https://jan.ai/"
arch=('x86_64')
license=('AGPL-3.0')
source=(
	"$_basename::git+https://github.com/janhq/jan.git"
	'jan.desktop'
)
sha256sums=('SKIP'
            '689c50321d61f2c40a275c004865e9956501038782867bbe73e9d42128f40048')
provides=("$_basename")
conflicts=("$_basename")
depends=(
	'nss'
	'atk'
	'libcups'
	'gtk3'
	'alsa-lib'
)
makedepends=(
	'git'
	'nodejs'
	'npm'
	'yarn'
	'libxcrypt-compat'
)

pkgver() {
	cd "$_basename"
	git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
	cd "$_basename"
	[ -f electron/package.json ] && sed -i '/"build:linux"/s/-l deb -l AppImage/-l --dir/' electron/package.json
}

build() {
	cd "$_basename"
	export YARN_CACHE_FOLDER="$srcdir"/yarn-cache
	make build
}

package() {
	# Desktop file
	install -Dm644 ../jan.desktop "$pkgdir"/usr/share/applications/jan.desktop

	# Application files
	cd "$_basename"/electron
	install -dm755 "$pkgdir"/opt/Jan
	cp -r dist/linux-unpacked/* "$pkgdir"/opt/Jan/

	# Icon files
	cd icons
	[ -f icon.png ] && install -Dm644 icon.png "$pkgdir"/usr/share/icons/hicolor/512x512/apps/jan.png
	[ -f icon-tray.png ] && install -Dm644 icon-tray.png "$pkgdir"/usr/share/icons/hicolor/16x16/apps/jan.png
	[ -f icon-tray@2x.png ] && install -Dm644 icon-tray@2x.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/jan.png
}
