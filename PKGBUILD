# Maintainer: Giga300 <giga300@protonmail.com>

pkgname=bitwarden-git
_pkgname=desktop
pkgver=v0.0.15.r3.g5ee4a89
_pkgver=0.0.15
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
sha256sums=('SKIP' '2e353aeac4694cd9d3e66a245a78c749e5d4d31fd23934179f32bd0bc63e254b')

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
