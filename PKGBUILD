# Maintainer: Max Bruckner
_basename=mirrorselect
pkgname=gentoo-$_basename
pkgver=2.2.6
pkgrel=1
pkgdesc="Script for selecting Gentoo mirrors."
arch=( 'any' )
url="https://wiki.gentoo.org/wiki/Mirrorselectlicense=('GPL2')"
depends=('python' 'netselect' 'dialog' 'ssl-fetch>=0.3' )
source=("https://dev.gentoo.org/~zmedico/dist/${_basename}-${pkgver}.tar.gz")
b2sums=('8875bf61e26ac474338d81a602297fa4fdf3fab3dbd478b02129dbe71f2d09445efa9b82792e3e654725c5e87a4ca00d37a3d924f8bd6f2decdf74148d1069c8')

build() {
    cd "${srcdir}/${_basename}"
    ./setup.py build
}

package() {
    cd "${srcdir}/${_basename}"
    VERSION="$pkgver" ./setup.py set_version || exit

    # Apply e69ec2d046626fa2079d460aab469d04256182cd for bug https://bugs.gentoo.org/show_bug.cgi?id=698470
    sed -e 's|key = lex.get_token()|\0\n\t\t\tif key is None:\n\t\t\t\tbreak|' -i mirrorselect/configs.py || exit

    ./setup.py install --prefix='/usr/' --root="$pkgdir" || exit
}
