# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=djpdf
pkgver=0.1.3
pkgrel=1
pkgdesc="Create small, searchable PDFs from scanned documents"
arch=(any)
url="https://github.com/Unrud/djpdf"
license=(GPL3)
depends=(hicolor-icon-theme imagemagick pyside2 python-colorama python-dbus python-pdfrw python-pillow python-psutil python-webcolors qpdf qt5-graphicaleffects qt5-quickcontrols qt5-quickcontrols2 tesseract tesseract-data-eng)
makedepends=(python-setuptools)
source=("https://github.com/Unrud/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('dc889c7f45106b4cef341db30b0aa9bf')

prepare()
{
    curl -L -O https://aur.archlinux.org/cgit/aur.git/snapshot/jbig2enc-git.tar.gz && tar -xvf jbig2enc-git.tar.gz && cd jbig2enc-git && makepkg -si
    cd ..
    curl -L -O https://aur.archlinux.org/cgit/aur.git/snapshot/python-xmp-toolkit.tar.gz && tar -xvf python-xmp-toolkit.tar.gz && cd python-xmp-toolkit && makepkg -si
}
build() {
  cd $pkgname-$pkgver
  python3 setup.py build
}

package() {
  cd $pkgname-$pkgver 
  python3 setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 desktop/com.github.unrud.djpdf.appdata.xml "$pkgdir"/usr/share/metainfo/com.github.unrud.djpdf.appdata.xml
  install -Dm644 desktop/com.github.unrud.djpdf.desktop "$pkgdir"/usr/share/applications/com.github.unrud.djpdf.desktop
  for s in 16 32 48 64 128 256 512; do
    convert +set date:create +set date:modify desktop/com.github.unrud.djpdf.png -resize ${s}x${s} com.github.unrud.djpdf_${s}.png
    install -Dm644 com.github.unrud.djpdf_${s}.png "$pkgdir"/usr/share/icons/hicolor/${s}x${s}/apps/com.github.unrud.djpdf.png
  done

  rm "$pkgdir"/usr/lib/python3.9/site-packages/djpdf-*.egg-info/requires.txt
}
