# Maintainer: dysphoria <>
# Contributor: Mitsu <archlinux AT suumitsu DOT eu>
# Contributor: schuay <jakob.gruber@gmail.com>
# Contributor: Ray Powell <ray_al@xphoniexx.net>

pkgname=mcomix-gtk3-git
pkgver=r1475.3f8f3dc
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
conflicts=("mcomix mcomix-git")
source=("${pkgname}::git+http://git.code.sf.net/p/mcomix/git"
		"https://gist.githubusercontent.com/ilikenwf/f661cb781da598660a88bbaffd4c6f5d/raw/8cd953c27afe44964093fe59ec580ae70ae6058c/gtk3.patch")
sha256sums=('SKIP'
            '00b2daf67c170acf215bb63a6a1cae4840d2826f5ebcbf43cd45805d007a025a')

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

  mkdir -p "${pkgdir}/usr/lib/python2.7/site-packages/mcomix/images/{16x16,32x32,48x48}"
  
  install -Dm644 "${srcdir}/mcomix-gtk3-git/mcomix/images/16x16/mcomix.png" "${pkgdir}/usr/lib/python2.7/site-packages/mcomix/images/16x16/mcomix.png"
  install -Dm644 "${srcdir}/mcomix-gtk3-git/mcomix/images/32x32/mcomix.png" "${pkgdir}/usr/lib/python2.7/site-packages/mcomix/images/32x32/mcomix.png"
  install -Dm644 "${srcdir}/mcomix-gtk3-git/mcomix/images/48x48/mcomix.png" "${pkgdir}/usr/lib/python2.7/site-packages/mcomix/images/48x48/mcomix.png"


  install -Dm755 mime/comicthumb ${pkgdir}/usr/bin/comicthumb
  install -Dm644 mime/comicthumb.1.gz ${pkgdir}/usr/share/man/man1/comicthumb.1.gz
  install -Dm644 mime/comicthumb.thumbnailer ${pkgdir}/usr/share/thumbnailers/comicthumb.thumbnailer
}
