# Maintainer: Justin Wong <jusw85 at hotmail dot com>
# Contributor: Matt Parnell/ilikenwf <parwok@gmail.com>
# Special thanks to fettouhi for finding the better fork
# my old fork is at https://sourceforge.net/u/ilikenwf/mcomix/ci/gtk3/tree/

pkgname=mcomix-gtk3-git
pkgver=r1961.9ba2f5b
pkgrel=1
pkgdesc="A comic book reader. Forked from MComix and ported to GTK3."
arch=('any')
url="https://github.com/multiSnow/mcomix3"
license=('GPL')
depends=('gtk3' 'python-cairo' 'python-gobject' 'python-pillow')
makedepends=('git')
optdepends=('libunrar: for rar compressed comics' \
            'p7zip: for 7z compressed comics' \
            'unrar: for rar compressed comics' \
            'unzip: for zip compressed comics' \
            'lhasa: for lha compressed comics' \
            'mupdf-tools: for PDF comics')
provides=("mcomix")
conflicts=("mcomix" "mcomix-git")
source=("git+https://github.com/multiSnow/mcomix3")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/mcomix3"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/mcomix3"
 
  python installer.py --srcdir=mcomix --target="${pkgdir}"/usr/share
 
  install -dm755 "${pkgdir}"/usr/bin
  ln -s /usr/share/mcomix/mcomixstarter.py "${pkgdir}"/usr/bin/mcomix
  ln -s /usr/share/mcomix/comicthumb.py "${pkgdir}"/usr/bin/comicthumb

  install -Dm644 mime/mcomix.desktop "${pkgdir}"/usr/share/applications/mcomix.desktop
  install -Dm644 mime/mcomix.appdata.xml "${pkgdir}"/usr/share/metainfo/mcomix.appdata.xml
  install -Dm644 mime/comicthumb.thumbnailer "${pkgdir}"/usr/share/thumbnailers/comicthumb.thumbnailer

  for size in 16x16 22x22 24x24 32x32 48x48
  do
    install -dm755 "${pkgdir}"/usr/share/icons/hicolor/"${size}"/apps/
    install -Dm644 mcomix/mcomix/images/"${size}"/mcomix.png "${pkgdir}"/usr/share/icons/hicolor/"${size}"/apps/mcomix.png
    install -Dm644 mime/icons/"${size}"/application-x-cb7.png "${pkgdir}"/usr/share/icons/hicolor/"${size}"/mimetypes/application-x-cb7.png
    install -Dm644 mime/icons/"${size}"/application-x-cbt.png "${pkgdir}"/usr/share/icons/hicolor/"${size}"/mimetypes/application-x-cbt.png
  done

  install -Dm644 man/mcomix.1 "${pkgdir}"/usr/share/man/man1/mcomix.1
  install -Dm644 man/comicthumb.1 "${pkgdir}"/usr/share/man/man1/comicthumb.1
}
