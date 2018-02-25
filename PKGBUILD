# Maintainer: Giga300 <giga300@protonmail.com>

pkgname=bitwarden-git
_pkgname=desktop
pkgver=v0.0.16
_pkgver=0.0.16
pkgrel=1
pkgdesc="A secure and free password manager for all of your devices."
arch=('x86_64')
url="https://bitwarden.com"
license=('GPL3')
groups=('')
depends=('alsa-lib' 'atk' 'cairo' 'dbus' 'electron' 'expat' 'fontconfig' 'freetype2' 'gconf' 'gdk-pixbuf2' 'glib2' 'gtk2' 'libcups' 'libnotify' 'libsecret' 'libx11' 'libxcb' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxrandr' 'libxrender' 'libxss' 'libxtst' 'nspr' 'nss' 'pango')
makedepends=('nodejs' 'npm')
conflicts=('bitwarden')
install=${pkgname}.install

source=(git+https://github.com/bitwarden/${_pkgname}.git package.json)
sha256sums=('SKIP' '3226882ac6086bd0caee8368203344c1b44e94e86fe73b1b14b5b7c8d7309682')

pkgver() {
    cd $_pkgname
    git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {

    cp --force package.json $_pkgname/package.json

    cd "$_pkgname"

    #Install Dependencies
    npm install

    # Build
    npm run dist:lin

    #Copy DOTDEB in SRC Directory
    cp ./dist/Bitwarden-${_pkgver}-amd64.deb $srcdir/bitwarden.deb
}

package(){

    # Extract DOTDEB Package
    ar xv bitwarden.deb

    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"
}
