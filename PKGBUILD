# Maintainer: Boradorka
# Co-maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=improve-imgsli
_reponame=Improve-ImgSLI
pkgver=10.0.1
pkgrel=1
pkgdesc="Image comparison tool with magnifying glass feature"
arch=(any)
url="https://github.com/Loganavter/$pkgname"
license=(GPL-3.0-or-later)
depends=(
  hicolor-icon-theme
  pyside6
  python
  python-dbus
  python-numpy
  python-pillow
  python-scikit-image
  python-sli-ui-toolkit
  sh
  shiboken6
)
optdepends=(
  'ffmpeg: for session recording, timeline, and video export'
  'python-imagecodecs: JXL image format support'
  'python-snakeviz: for performance profiling'
)
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
b2sums=('9c95580b7fea714d4cb5bc1a592e3ffc8e318b53e4cf33e7dfab6733f41c0ddedad3b5571b20d77907e731199629e28486c6874a31e2949c888a4b1357d64b2a')

prepare() {
  #Making launching app more secure
  sed -i "s|^Exec=|Exec=/usr/bin/|" "$srcdir"/Improve-ImgSLI-$pkgver/build/AUR-template/$pkgname.desktop
}

package() {
  cd "$_reponame-$pkgver"
  install -vDm 755 build/AUR-template/launcher.sh                         "$pkgdir"/usr/bin/$pkgname
  install -vDm 644 build/AUR-template/$pkgname.desktop                 -t "$pkgdir"/usr/share/applications/
  install -vDm 644 src/resources/icons/icon.png                           "$pkgdir"/usr/share/icons/hicolor/512x512/apps/$pkgname.png

  install -vDm 755 build/linux/bin/improve-imgsli-thumbnailer          -t "$pkgdir"/usr/bin/
  install -vDm 644 src/resources/icons/icon.png                           "$pkgdir"/usr/share/improve-imgsli/mark.png  
  install -vDm 644 build/linux/mime/application-x-improve-imgsli.xml   -t "$pkgdir"/usr/share/mime/packages/
  install -vDm 644 build/linux/thumbnailers/improve-imgsli.thumbnailer -t "$pkgdir"/usr/share/thumbnailers/

  for _sz in 16 22 32 48 64 128 256; do
    install -vDm 644 build/linux/icons/mimetypes/application-x-improve-imgsli-${_sz}.png \
                    "$pkgdir"/usr/share/icons/hicolor/${_sz}x${_sz}/mimetypes/application-x-improve-imgsli.png
  done

  cd "src"
  find . -type f \
    -not -path '*/tests/*' \
    -not -name 'windows_file_association.py' \
    -exec install -vDm 644 "{}" "$pkgdir/usr/lib/$pkgname/{}" \;
}
