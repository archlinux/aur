# Maintainer <veryangry at snopyta dot org>
_pkgname=webbrowser
_pkgver=29.3.0
pkgname="$_pkgname"-git
pkgver=v29.3.0.r0.g81f63a8
pkgrel=1
pkgdesc="A Goanna/UXP based browser with no spyware."
arch=('i686' 'x86_64')
url="https://git.nuegia.net/webbrowser.git/"
license=('MPL' 'GPL')
depends=('gtk2' 'dbus-glib' 'libxt' 'alsa-lib')
makedepends=('git' 'python2' 'autoconf2.13' 'unzip' 'zip' 'yasm' 'ffmpeg' 'libxt' 'libffi' 'dbus' 'dbus-glib' 'gtk2' 'alsa-lib' 'libvpx' 'fontconfig' 'jack2' 'libpng' 'freetype2')
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
	cd "$_pkgname"
	git submodule init
	git config submodule.platform.url ${srcdir}/UXP
	git submodule update --recursive
	cp doc/mozconfig.example .mozconfig
	sed -i "4d" .mozconfig
	sed -i "4imk_add_options MOZ_OBJDIR=../wbbuild/" .mozconfig
}
build() {
	cd "$_pkgname"
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
