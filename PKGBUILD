# Maintainer:  Maddie Mewmews <maddie at mewmews dot gay>
# Contributor: Josh Baron (xriitox) <joshbaron48 at outlook dot com>
# Contributor: PopeRigby <poperigby at mailbox dot org>
# Contributor: Cassidy Wilson <cassidywilson at mailbox dot org>

pkgname=doomrunner-git
pkgver=1.8.2+32+g75965db
pkgrel=1
pkgdesc="Modern preset-oriented graphical launcher of ZDoom and derivatives"
arch=('x86_64')
url="https://github.com/Youda008/DoomRunner"
license=('GPL3')
depends=('qt6-base')
makedepends=('git' 'gcc' 'imagemagick')
backup=('opt/DoomRunner')
source=("git+https://github.com/Youda008/DoomRunner")
provides=('doomrunner')
conflicts=('doomrunner')

md5sums=('SKIP')

pkgver() {
    cd DoomRunner
    git describe --tags --abbrev=7 --match '[Vv]*' | sed -r 's/^[Vv]//;s/-/+/g'
}

build() {
	mkdir -p "${srcdir}/DoomRunner/build-dynamic"
	cd "${srcdir}/DoomRunner/build-dynamic"
	qmake6 ../DoomRunner.pro -spec linux-g++ "CONFIG+=release"
	make
}

package() {
    # Copy desktop file
	mkdir -p "${pkgdir}/usr/share/applications"
	mkdir -p "${pkgdir}/usr/share/metainfo"
	cp "${srcdir}/DoomRunner/Install/XDG/DoomRunner.desktop" "${pkgdir}/usr/share/applications/DoomRunner.desktop"
	cp "${srcdir}/DoomRunner/Install/XDG/io.github.Youda008.DoomRunner.appdata.xml" "${pkgdir}/usr/share/metainfo/io.github.Youda008.DoomRunner.appdata.xml"
    # Copy icon file
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/128x128/apps/"
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/64x64/apps/"
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/48x48/apps/"
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/32x32/apps/s"
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/24x24/apps/"
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/16x16/apps/"
	#cp "${srcdir}/DoomRunner/Resources/DoomRunner.ico" "${pkgdir}/usr/share/icons/DoomRunner.ico"
	magick "${srcdir}/DoomRunner/Install/XDG/DoomRunner.128x128.png" -strip -quality 100 "${pkgdir}/usr/share/icons/hicolor/128x128/apps/DoomRunner.png"
	magick "${srcdir}/DoomRunner/Install/XDG/DoomRunner.64x64.png" -strip -quality 100 "${pkgdir}/usr/share/icons/hicolor/64x64/apps/DoomRunner.png"
	magick "${srcdir}/DoomRunner/Install/XDG/DoomRunner.48x48.png" -strip -quality 100 "${pkgdir}/usr/share/icons/hicolor/48x48/apps/DoomRunner.png"
	magick "${srcdir}/DoomRunner/Install/XDG/DoomRunner.32x32.png" -strip -quality 100 "${pkgdir}/usr/share/icons/hicolor/32x32/apps/DoomRunner.png"
	magick "${srcdir}/DoomRunner/Install/XDG/DoomRunner.24x24.png" -strip -quality 100 "${pkgdir}/usr/share/icons/hicolor/24x24/apps/DoomRunner.png"
	magick "${srcdir}/DoomRunner/Install/XDG/DoomRunner.16x16.png" -strip -quality 100 "${pkgdir}/usr/share/icons/hicolor/16x16/apps/DoomRunner.png"

    # Install DoomRunner
	cd "${srcdir}/DoomRunner/build-dynamic"
	make install INSTALL_ROOT="${pkgdir}/"
	mkdir -p "${pkgdir}/usr/bin"
	ln -sT "/opt/DoomRunner/bin/DoomRunner" "${pkgdir}/usr/bin/doomrunner"
}

