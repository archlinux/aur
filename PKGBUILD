# Maintainer <veryangry at snopyta dot org>
_pkgname=webbrowser
pkgname=webbrowser-git
pkgver=v29.1.2.r5.gdad9160
pkgrel=1
pkgdesc="A Goanna/UXP based browser with no spyware."
arch=('i686' 'x86_64')
url="https://git.nuegia.net/webbrowser.git/"
license=('MPL' 'GPL')
depends=('gtk2' 'dbus-glib' 'libxt' 'alsa-lib')
makedepends=('git' 'python2' 'autoconf2.13' 'unzip' 'zip' 'yasm' 'ffmpeg' 'gconf' 'libxt' 'libffi' 'dbus' 'dbus-glib' 'gtk2' 'alsa-lib' 'libvpx' 'fontconfig' 'jack2' 'libpng' 'freetype2')
optdepends=('hunspell: spell checker and morphological analyzer'
            'hyphen: library for hyphenation and justification')
provides=('palemoon')
source=(git+"https://git.nuegia.net/webbrowser.git"
	git+"https://git.nuegia.net/UXP")
md5sums=('SKIP'
	'SKIP')
pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare() {
	cd webbrowser
	git submodule init
	git config submodule.platform.url ${srcdir}/UXP
	git submodule update
	cp doc/mozconfig.example .mozconfig
	sed -i "4d" .mozconfig
	sed -i "4imk_add_options MOZ_OBJDIR=../wbbuild/" .mozconfig
}
build() {
	cd webbrowser
	./mach build
	./mach package
}
package() {
	cd wbbuild/dist/
	tar xvf webbrowser-29.2.0.linux-x86_64-gtk2.tar.xz
	mkdir -p "${pkgdir}"/opt
	mv -n webbrowser "${pkgdir}"/opt/webbrowser
	cd "${pkgdir}"
	mkdir -p "${pkgdir}"/usr/bin
	ln -s /opt/webbrowser/webbrowser "${pkgdir}"/usr/bin/webbrowser
}
