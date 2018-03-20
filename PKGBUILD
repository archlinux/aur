# Maintainer: Giga300 <giga300@protonmail.com>
# Contributor: Giga300 <giga300@protonmail.com>

pkgname=bitwarden-git
_pkgname=desktop
pkgver=v1.1.0.r1.g2590812
_pkgver=1.1.0
pkgrel=4
pkgdesc="A secure and free password manager for all of your devices."
arch=('x86_64')
url="https://bitwarden.com"
license=('GPL-3.0')
depends=('alsa-lib' 'atk' 'cairo' 'dbus' 'electron' 'expat' 'fontconfig' 'freetype2' 'gconf' 'gdk-pixbuf2' 'glib2' 'gtk2' 'libcups' 'libnotify' 'libsecret' 'libx11' 'libxcb' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxrandr' 'libxrender' 'libxss' 'libxtst' 'nspr' 'nss' 'pango')
makedepends=('nodejs' 'npm')
conflicts=('bitwarden')
options=('!strip' '!emptydirs')

source=(git+https://github.com/bitwarden/${_pkgname}.git)
sha512sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgname"	
	sed -i '109,112d' package.json
	sed -i 's/"deb",/"deb"/g' package.json
}

build() {
	cd "$_pkgname"

	# Install Dependencies
	npm install

	# Build
	npm run dist:lin

	#Extract from deb file
	ar xv ./dist/Bitwarden-${_pkgver}-amd64.deb
	cp data.tar.xz $srcdir
}

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
	
	# Symlink
	install -d "${pkgdir}/usr/bin"
	ln -sf "/opt/Bitwarden/bitwarden" "${pkgdir}/usr/bin/${pkgname}"
}