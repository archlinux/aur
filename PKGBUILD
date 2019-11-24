# Maintainer: Matt Parnell/ilikenwf <parwok@gmail.com>
# Special thanks to fettouhi for finding the better fork
# my old fork is at https://sourceforge.net/u/ilikenwf/mcomix/ci/gtk3/tree/

pkgname=mcomix-gtk3-git
pkgver=r1883.2ce9f7a
pkgrel=1
pkgdesc="A comic book reader. Forked from MComix and ported to GTK3."
arch=('any')
url="https://github.com/multiSnow/mcomix3"
license=('GPL')
depends=('python-pillow' 'python-gobject')
makedepends=('gettext' 'intltool')
optdepends=('libunrar: for rar compressed comics' \
            'p7zip: for 7z compressed comics' \
            'unrar: for rar compressed comics' \
            'unzip: for zip compressed comics' \
            'mupdf: for PDF comics')
provides=("mcomix")
conflicts=("mcomix" "mcomix-git")
source=("git+https://github.com/multiSnow/mcomix3")
sha256sums=('SKIP')

install=${pkgname}.install

pkgver() {
	cd "mcomix3"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/mcomix3"
 
  # setup.py doesn't work – setting up manually
 
  # their installer
  python installer.py --srcdir=mcomix --target="${pkgdir}"/usr/lib/python3.8
 
  # but leave out the additional directory, so the module is in the correct directory
  mv "${pkgdir}"/usr/lib/python3.8/mcomix "${pkgdir}"/usr/lib/python3.8/site-packages
  mkdir "${pkgdir}"/usr/bin
  mv "${pkgdir}"/usr/lib/python3.8/site-packages/mcomixstarter.py "${pkgdir}"/usr/bin/mcomix
  mv "${pkgdir}"/usr/lib/python3.8/site-packages/comicthumb.py "${pkgdir}"/usr/bin/comicthumb
 
  # other files
  install -Dm644 "${srcdir}/mcomix3"/man/* -t "${pkgdir}"/usr/share/man/man1/
  install -Dm644 "${srcdir}/mcomix3"/mime/mcomix.appdata.xml -t "${pkgdir}"/usr/share/metainfo/
  install -Dm644 "${srcdir}/mcomix3"/mime/mcomix.desktop -t "${pkgdir}"/usr/share/applications/
  install -Dm644 "${srcdir}/mcomix3"/mime/mcomix.xml -t "${pkgdir}"/usr/share/mime/
  install -Dm644 "${srcdir}/mcomix3"/mime/comicthumb.thumbnailer -t "${pkgdir}"/usr/share/thumbnailers/
 
  for size in 16 22 24 32 48
  do
    install -Dm644 "${srcdir}/mcomix3"/mime/icons/${size}x${size}/* -t "${pkgdir}"/usr/share/icons/hicolor/${size}x${size}/mimetypes/
    mkdir "${pkgdir}"/usr/share/icons/hicolor/${size}x${size}/apps/
    ln -s /usr/lib/python3.8/site-packages/mcomix/images/${size}x${size}/mcomix.png \
      "${pkgdir}"/usr/share/icons/hicolor/${size}x${size}/apps/
  done
  rm "${pkgdir}"/usr/lib/python3.8/site-packages/mcomix/images/mcomix-large.png
}
