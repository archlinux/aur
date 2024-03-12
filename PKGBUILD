pkgname='alsa-scarlett-gui-dev'
_pkgname='alsa-scarlett-gui'
pkgver=0.3.3.128.g74fc
pkgrel=2
pkgdesc="GUI for the ALSA controls presented by the Scarlett2 driver, Development version"
arch=('i686' 'x86_64')
url="https://github.com/geoffreybennett/alsa-scarlett-gui"
license=('GPL-3.0-or-later' 'LGPL-3.0-or-later')
depends=('alsa-lib' 'gtk4' 'openssl')
makedepends=('gcc' 'make' 'git' 'pkgconf' 'sed')
provides=("$_pkgname")
source=("git+${url}.git#branch=dev")
sha256sums=('SKIP')

DOC_FILES=(
    ENABLEDRIVER.md
    FAQ.md
    INSTALL.md
    INTERFACES.md
    README.md
    USAGE.md
)

pkgver() {
    cd "$_pkgname"
    git describe --abbrev=4 --always --tags | sed 's/-/./g'
}

build() {
    cd "$srcdir/$_pkgname"
    sed -i 's/-Werror//' src/Makefile
    PREFIX="/usr" make -C src
}

package() {
    cd "$srcdir/$_pkgname"
    PREFIX="${pkgdir}/usr" make -C src install

    for docfile in "${DOC_FILES[@]}"; do
        install -vDm 644 "$docfile"  "${pkgdir}/usr/share/doc/${_pkgname}/${docfile}"
    done
}
