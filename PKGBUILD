# Maintainer: Sulthan A. Karimov <sulthankarimov@gmail.com>
pkgname='blender-launcher-git'
_pkgname='blenderlauncher'
_pkgname1='Blender-Launcher-V2'
pkgver=v2.7.4.r4.g28dcc2e
pkgrel=1
pkgdesc='Blender Launcher is a standalone software client that provides management for stable, daily and experimental builds of Blender 3D. It is a free open source project available for 64-bit Windows and Linux (GLIBC 2.31 and higher) operating systems.'
arch=('x86_64')
url='https://github.com/Victor-IX/Blender-Launcher-V2.git'
license=('GPL-3.0')
depends=('glibc')
makedepends=('python>=3.11' 'git')
conflicts=('blender-launcher-bin')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname1/"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_pkgname1/"
	python -m venv lib
	source lib/bin/activate
	pip install --upgrade pip
	pip install -e .
	python build_style.py
	cd scripts
	sh build_linux.sh
}

package() {
	install -Dm644 "$srcdir/$_pkgname1/extras/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	install -Dm755 "$srcdir/$_pkgname1/dist/release/Blender Launcher" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "$srcdir/$_pkgname1/source/resources/icons/bl/bl_128.png" "$pkgdir/usr/share/pixmaps/blenderlauncher.png"
}
