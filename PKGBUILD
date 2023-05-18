# Maintainer: TH Campbell (dysphoria) <thcampbell (at) protonmail (dot) com>
# Contributor: Justin Wong <jusw85 at hotmail dot com>
# Contributor: Matt Parnell/ilikenwf <parwok@gmail.com>
# Contributor: Mitsu <archlinux AT suumitsu DOT eu>
# Contributor: schuay <jakob.gruber@gmail.com>
# Contributor: Ray Powell <ray_al@xphoniexx.net>

pkgname=mcomix-git
pkgver=r1656.ad0a062
pkgrel=1
pkgdesc='A user-friendly, customizable image viewer specifically designed to handle comic books'
arch=('any')
url='https://sourceforge.net/projects/mcomix/'
license=('GPL')
depends=('gtk3' 'python-pillow>=6.0.0' 'xdg-utils' 'python>=3.7'
         'desktop-file-utils' 'hicolor-icon-theme'
         'python-gobject>=3.36.0' 'python-cairo>=1.16.0' 'python-setuptools')
makedepends=('gettext' 'intltool')
optdepends=(
            'libunrar: for rar compressed comics'
            'p7zip: for 7z compressed comics'
            'unrar: for rar compressed comics'
            'unzip: for zip compressed comics'
            'lhasa: for lha compressed comics'
            'mupdf: for PDF comics'
           )
provides=('mcomix')
conflicts=('mcomix')
source=(
        "${pkgname}::git+http://git.code.sf.net/p/mcomix/git"
       )
sha256sums=('SKIP')
install=mcomix-git.install

pkgver() {
        cd "${pkgname}"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
        cd "${srcdir}/${pkgname}"
        mkdir -p "${pkgdir}/usr/bin"

        _PYVERSION=$(python3 --version | sed -e 's/Python /python/')
        _ICONDIR="${pkgdir}/usr/lib/${_PYVERSION%.*}/site-packages/mcomix/images"

        install -dm755 "$_ICONDIR"

        python3 setup.py install --prefix=/usr --optimize=1 \
                --single-version-externally-managed --root="${pkgdir}/"

        install -Dm755 mcomix/images/*.png "${_ICONDIR}"

        install -Dm755 mime/comicthumb "${pkgdir}/usr/bin/comicthumb"
        install -Dm644 mime/comicthumb.1.gz "${pkgdir}/usr/share/man/man1/comicthumb.1.gz"
        install -Dm644 mime/comicthumb.thumbnailer "${pkgdir}/usr/share/thumbnailers/comicthumb.thumbnailer"
        install -Dm644 mime/comicbook.schemas "${pkgdir}/usr/share/gconf/schemas/mcomix.schemas"
        install -Dm644 mime/mcomix.desktop "${pkgdir}/usr/share/applications/mcomix.desktop"
        install -Dm644 mime/mcomix.appdata.xml "${pkgdir}/usr/share/metainfo/mcomix.appdata.xml"

        for size in 16x16 22x22 24x24 32x32 48x48
        do
                install -Dm755 "mcomix/images/${size}/mcomix.png" "${_ICONDIR}/${size}/mcomix.png"
                install -dm755 "${pkgdir}/usr/share/icons/hicolor/${size}/apps/"
                install -Dm644 "mcomix/images/${size}/mcomix.png" "${pkgdir}/usr/share/icons/hicolor/${size}/apps/mcomix.png"
                install -Dm644 "mime/icons/${size}/application-x-cb7.png" "${pkgdir}/usr/share/icons/hicolor/${size}/mimetypes/application-x-cb7.png"
                install -Dm644 "mime/icons/${size}/application-x-cbr.png" "${pkgdir}/usr/share/icons/hicolor/${size}/mimetypes/application-x-cbr.png"
                install -Dm644 "mime/icons/${size}/application-x-cbt.png" "${pkgdir}/usr/share/icons/hicolor/${size}/mimetypes/application-x-cbt.png"
                install -Dm644 "mime/icons/${size}/application-x-cbz.png" "${pkgdir}/usr/share/icons/hicolor/${size}/mimetypes/application-x-cbz.png"
        done
}
