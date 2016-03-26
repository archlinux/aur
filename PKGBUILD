# Maintainer: dysphoria <>
# Contributor: marcinfa <marcinfa@gmail.com>
# Contributor: Mitsu <archlinux AT suumitsu DOT eu>
# Contributor: schuay <jakob.gruber@gmail.com>
# Contributor: Ray Powell <ray_al@xphoniexx.net>

pkgname=mcomix-svn
_realname=mcomix
_svnmod=mcomix-code
pkgver=r1450
pkgrel=1
pkgdesc="A user-friendly, customizable image viewer specifically designed to handle comic books"
arch=('any')
url="https://sourceforge.net/projects/mcomix/"
license=('GPL')
depends=('pygtk' 'python2-pillow' 'xdg-utils' 'python2' \
         'desktop-file-utils' 'hicolor-icon-theme' 'python2-setuptools')
makedepends=('gettext' 'intltool')
optdepends=('libunrar: for rar compressed comics' \
            'p7zip: for 7z compressed comics' \
            'unrar: for rar compressed comics' \
            'unzip: for zip compressed comics' \
            'mupdf: for PDF comics')
provides=("mcomix")
conflicts=("mcomix")
source=('mcomix-code::svn+https://svn.code.sf.net/p/mcomix/code/')
sha256sums=('SKIP')
install=${_realname}.install

pkgver() {
        cd "${_svnmod}"
        local ver="$(svnversion)"
        printf "r%s" "${ver//[[:alpha:]]}"
}

package() {
        cd "${srcdir}/${_svnmod}"
        mkdir -p ${pkgdir}/usr
        export PYTHONPATH=${pkgdir}/usr/lib/python2.7/site-packages/
        mkdir -p $PYTHONPATH
        python2 setup.py install --prefix=${pkgdir}/usr --optimize=1 \
        --single-version-externally-managed --root=/

        install -Dm755 mime/comicthumb ${pkgdir}/usr/bin/comicthumb
        install -Dm644 mime/comicthumb.1.gz ${pkgdir}/usr/share/man/man1/comicthumb.1.gz
        install -Dm644 mime/comicthumb.thumbnailer ${pkgdir}/usr/share/thumbnailers/comicthumb.thumbnailer
        install -Dm644 mime/comicbook.schemas ${pkgdir}/usr/share/gconf/schemas/mcomix.schemas
}

