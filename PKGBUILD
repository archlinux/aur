# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=biopass
pkgname="$_pkgbase-git"
pkgver=1.4.1.r20.gd691129
pkgrel=1
pkgdesc='An alternative to Windows Hello/Howdy'
arch=('x86_64')
url='https://github.com/TickLabVN/biopass'
license=('MIT')
depends=('libwebkit2gtk-4.1.so' 'librsvg-2.so' 'libssl.so' 'libxdo.so' 'libturbojpeg.so')
optdepends=('libayatana-appindicator: for tray icon support')
makedepends=('git' 'bun' 'cmake' 'rust' 'cli11' 'meson' 'ninja'
             'python-jinja' 'python-yaml' 'python-ply')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
options=(!lto !debug)
install='setup.install'
source=("$_pkgbase::git+https://github.com/TickLabVN/biopass.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgbase"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
	cd "$_pkgbase"
	sed -i 's/--buildtype=release/--buildtype=release -Dwerror=false/' \
		auth/BundleLibcamera.cmake
}

build() {
	cd "$_pkgbase"
	rm -rf app/src-tauri/target/release/bundle/deb/*
	make build
}

package() {
	cd "$_pkgbase"
	cp -r app/src-tauri/target/release/bundle/deb/biopass_*_amd64/data/* "$pkgdir"
	mv "$pkgdir/lib/security" "$pkgdir/usr/lib/security"
	rm -rf "$pkgdir/lib"
}
