# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>
# Contributor: 

_gitname=gala
_author=elementary
_pkgname=("${_gitname}-stable")
pkgname=("${_pkgname}-git")
pkgver=r1152.da85223
pkgrel=1
pkgdesc="A window & compositing manager based on libmutter and designed by elementary for use with Pantheon"
arch=('any')
url="https://github.com/${_author}/${_gitname}"
license=('GPL3')
groups=('pantheon-stable')
depends=('atk' 'bamf' 'cairo' 'gdk-pixbuf2' 'glib2' 'gnome-settings-daemon-elementary'
		 'gnome-desktop' 'granite' 'gsettings-desktop-schemas-ubuntu' 'gtk3' 'json-glib' 'libdrm'
		 'libgee' 'libgl' 
		 'mutter>=3.23.90-1' 'libx11' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes'
		 'libxi' 'libxrandr' 'libxtst' 'mesa' 'pango' 'plank' 'wayland'
  		 )
makedepends=('git' 'gnome-common' 'meson>=0.42.0-1' 'vala>=0.40.3-1')
provides=("${_gitname}" "${_pkgname}")
conflicts=("${_gitname}" "${_gitname}-git" "${_pkgname}")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "${_gitname}"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${_gitname}/"
    meson . _build --prefix=/usr
    ninja -C _build
}

package() {
    cd "${_gitname}/"
    DESTDIR="${pkgdir}" ninja -C _build install
}
