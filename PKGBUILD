# Maintainer: dysphoria <>
# Contributor: Mitsu <archlinux AT suumitsu DOT eu>
# Contributor: schuay <jakob.gruber@gmail.com>
# Contributor: Ray Powell <ray_al@xphoniexx.net>

pkgname=mcomix-git
pkgver=r1494.0b5e6d4
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
source=("${pkgname}::git+http://git.code.sf.net/p/mcomix/git"
        'save_as_tweaks_1.3.patch')
sha256sums=('SKIP'
            '10fcc2045e49dac348de37d9ea8d0491b6d74300267396054a913ffac8fefdab')
install=${pkgname}.install

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${pkgname}"
    patch -Np1 -i "${srcdir}/save_as_tweaks_1.3.patch"
}

package() {
    cd "${srcdir}/${pkgname}"
    mkdir -p ${pkgdir}/usr
    export PYTHONPATH=${pkgdir}/usr/lib/python2.7/site-packages/
    mkdir -p $PYTHONPATH
    python2 setup.py install --prefix=/usr --optimize=1 \
    --single-version-externally-managed --root="${pkgdir}/"

    install -Dm755 mime/comicthumb ${pkgdir}/usr/bin/comicthumb
    install -Dm644 mime/comicthumb.1.gz ${pkgdir}/usr/share/man/man1/comicthumb.1.gz
    install -Dm644 mime/comicthumb.thumbnailer ${pkgdir}/usr/share/thumbnailers/comicthumb.thumbnailer
    install -Dm644 mime/comicbook.schemas ${pkgdir}/usr/share/gconf/schemas/mcomix.schemas
}

