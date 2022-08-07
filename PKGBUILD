# Maintainer <yetanothermaintainer at danwin1210 dot de>
_pkgname=webbrowser
_pkgver=29.3.1
pkgname="$_pkgname"-git
pkgrel=1
pkgver=v29.3.1.r2.g29fbfac
pkgrel=1
pkgdesc="A Goanna/UXP based browser with no spyware."
arch=('i686' 'x86_64')
url="https://git.nuegia.net/webbrowser.git/"
license=('MPL' 'GPL')
depends=('gtk2' 'dbus-glib' 'libxt' 'alsa-lib')
makedepends=('git' 'python2' 'autoconf2.13' 'unzip' 'zip' 'yasm' 'ffmpeg' 'gcc10' 'libxt' 'libffi' 'dbus' 'dbus-glib' 'gtk2' 'alsa-lib' 'libvpx' 'fontconfig' 'jack2' 'libpng' 'freetype2')
optdepends=('hunspell: spell checker and morphological analyzer'
            'hyphen: library for hyphenation and justification')
conflicts=('palemoon' 'palemoon-git')
provides=('palemoon' 'firefox')
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
	git submodule update
	cp doc/mozconfig.example .mozconfig
	sed -i "4d" .mozconfig
	sed -i "4imk_add_options MOZ_OBJDIR=../wbbuild/" .mozconfig
}
build() {
	cd "$_pkgname"
	export CC=gcc-10
	export CXX=g++-10
	./mach build
	./mach package
}
package() {
	cd wbbuild/dist/
	tar xvf "$_pkgname"-"$_pkgver".linux-x86_64-gtk2.tar.xz
	mkdir -p "${pkgdir}"/opt
	mv -n "$_pkgname" "${pkgdir}"/opt/"$_pkgname"
	cd "${pkgdir}"
	mkdir -p "${pkgdir}"/usr/bin
	ln -s /opt/"$_pkgname"/"$_pkgname" "${pkgdir}"/usr/bin/"$_pkgname"
}
