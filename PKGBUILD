# Maintainer: Giga300 <giga300@protonmail.com>

pkgname=bitwarden-git
_pkgname=desktop
pkgver=v1.0.5.r21.gf45f511
_pkgver=1.0.5
pkgrel=1
pkgdesc="A secure and free password manager for all of your devices."
arch=('x86_64')
url="https://bitwarden.com"
license=('GPL-3.0')
depends=('alsa-lib' 'atk' 'cairo' 'dbus' 'electron' 'expat' 'fontconfig' 'freetype2' 'gconf' 'gdk-pixbuf2' 'glib2' 'gtk2' 'libcups' 'libnotify' 'libsecret' 'libx11' 'libxcb' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxrandr' 'libxrender' 'libxss' 'libxtst' 'nspr' 'nss' 'pango')
makedepends=('nodejs' 'npm')
conflicts=('bitwarden')
options=('!strip' '!emptydirs')

source=(git+https://github.com/bitwarden/${_pkgname}.git package.json)
sha512sums=('SKIP' '0207e1612a684d602f6eea0fdce54fb6663ab2fcafaf180bd964355fdbb804b3f1946f6b9451d84512f746cc8345dc21f27a38c9d1e8ebf947f1372bd66779e4')

pkgver() {
	cd $_pkgname
	git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	#Copy package.json with only DEB compilation
	cp --force package.json $_pkgname/package.json

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
