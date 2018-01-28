# Maintainer: Matt Parnell/ilikenwf <parwok@gmail.com>

pkgname=mcomix-gtk3-git
pkgver=r1475.3f8f3dc
pkgrel=2
pkgdesc="A comic book reader. Ported to GTK3, works well with retina/hidpi"
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
conflicts=("mcomix mcomix-git")
source=("${pkgname}::git+http://git.code.sf.net/p/mcomix/git"
		"https://gist.githubusercontent.com/ilikenwf/f661cb781da598660a88bbaffd4c6f5d/raw/1b47b11b11f1340cf563d251cee92967bd9de275/gtk3.patch")
sha256sums=('SKIP'
            '11caa3211c49df1ebcf13e15c79ba3cbed5efcdeacceaa8dce444a4af4961848')

install=${pkgname}.install

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${pkgname}"
    
    patch -Np1 -i ../gtk3.patch
    
 
  python2 setup.py install --prefix=/usr --optimize=1 \
    --single-version-externally-managed --root=${pkgdir}
  
  cp -a "${srcdir}/mcomix-gtk3-git/mcomix/images" "${pkgdir}/usr/lib/python2.7/site-packages/mcomix/images"

  install -Dm755 mime/comicthumb ${pkgdir}/usr/bin/comicthumb
  install -Dm644 mime/comicthumb.1.gz ${pkgdir}/usr/share/man/man1/comicthumb.1.gz
  install -Dm644 mime/comicthumb.thumbnailer ${pkgdir}/usr/share/thumbnailers/comicthumb.thumbnailer
}
