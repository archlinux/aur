# Maintainer: Stephanie Wilde-Hobbs <git@stephanie.is>
# Maintainer: Rolf van Kleef <aur@rolfvankleef.nl>
# Contributor: Gregory Goijaerts <crecketgaming@gmail.com>
# Contributor: Dennis Snijder <dennissnijder97@gmail.com>
# Contributor: Nick Duijvelshoff <nick@duijvelshoff.com>
# Contributor: basst85 <bastiaan85@gmail.com>
# Contributor: Kees Kluskens
# Contributor: TimZ99
# Contributor: Emile Bons

pkgname="bunq-desktop-src"
pkgver="0.9.10"
pkgrel=1
pkgdesc="A desktop implementation for the bunq API"
url="https://github.com/bunqCommunity/bunqDesktop"
provides=('bunq-desktop')
conflicts=('bunq-desktop-git' 'bunq-desktop-bin')
arch=('x86_64')
license=('MIT')
depends=('nodejs')
makedepends=('yarn' 'python2' 'npm' 'desktop-file-utils')
source=("${url}/archive/${pkgver}.tar.gz"
		"bunq-desktop-src.desktop")
sha256sums=('98560c229d52b6696f14e31dcf62c70d2ebada9c85a76e65e26cc0dcc8ffb22f'
            '97183aab64799aec2462ba81cbb9cdbdf8617e1e6a843270a0ca07ca14fe2a49')

build() {
	cd bunqDesktop-${pkgver}

	sed -i '/plugin-syntax-dynamic-import/d' package.json
	sed -i '/@babel/ s/7.7.[0-9]/7.8.4/' package.json

	yarn
	yarn release
}

package() {
	cd bunqDesktop-${pkgver}

	mkdir ${pkgdir}/usr
	mkdir ${pkgdir}/usr/bin
	mkdir ${pkgdir}/usr/share
	mkdir ${pkgdir}/usr/share/pixmaps
	mkdir ${pkgdir}/opt

	cp -R dist/linux-unpacked ${pkgdir}/opt/${pkgname}
	ln -s /opt/${pkgname}/bunqdesktop ${pkgdir}/usr/bin/bunq-desktop

	cp build/icons/512x512.png ${pkgdir}/usr/share/pixmaps/bunq.png
	desktop-file-install ${srcdir}/${pkgname}.desktop --dir ${pkgdir}/usr/share/applications/
}

