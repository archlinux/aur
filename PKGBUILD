# Maintainer: Boradorka
# Co-maintainer: Nebulosa

pkgname=improve-imgsli
pkgver=4.9.0
pkgrel=1
pkgdesc="Image comparison tool with magnifying glass feature"
arch=(x86_64)
url="https://github.com/Loganavter/$pkgname"
license=(MIT)
depends=(
  hicolor-icon-theme
  python
  python-darkdetect
  python-pillow
  python-pyqt6
  sh
)
makedepends=(
  python-build
  python-installer
  python-pip
  python-wheel
)
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('4eec575b317ff9e0343de3088c92ef11bc14c36a534b83e58f57f66fc740f15afa1b3a2e53bd6489998037abf2d048539467a07099e6ae264c48f8ffef64a084')
b2sums=('924ea05420d6998eac317c85c963c868a2047f3714ac4ed136b16122d2f680345894f8ac701d38e864549b7528400be5df59877289d07a9580969ada1f289392')

prepare() {
  #Making launching app more secure
  sed -i "s|^Exec=$pkgname|Exec=/usr/bin/$pkgname|" "$srcdir"/Improve-ImgSLI-$pkgver/build/AUR-template/$pkgname.desktop
}

build() {
  pip install --target="$srcdir/Improve-ImgSLI-$pkgver/src/vendor-libs" PyQt6-Frameless-Window PyQt6-Fluent-Widgets
}

package() {
  cd "$srcdir"/Improve-ImgSLI-$pkgver/src
  install -vDm 755 ../build/AUR-template/launcher.sh         "$pkgdir"/usr/bin/$pkgname
  install -vDm 644 Improve_ImgSLI.py                      -t "$pkgdir"/usr/lib/$pkgname/
  install -vDm 644 clickable_label.py                     -t "$pkgdir"/usr/lib/$pkgname/
  install -vDm 644 image_comparison_app.py                -t "$pkgdir"/usr/lib/$pkgname/
  install -vDm 644 translations.py                        -t "$pkgdir"/usr/lib/$pkgname/
  install -vDm 644 settings_dialog.py                     -t "$pkgdir"/usr/lib/$pkgname/
  install -vDm 644 font/SourceSans3-Regular.ttf           -t "$pkgdir"/usr/lib/$pkgname/font/
  install -vDm 644 ../build/AUR-template/$pkgname.desktop -t "$pkgdir"/usr/share/applications/
  install -vDm 644 icons/icon.png                            "$pkgdir"/usr/share/icons/hicolor/512x512/apps/$pkgname.png
  install -vDm 644 ../LICENSE.txt                            "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  install -vdm 755 "$pkgdir"/usr/lib/$pkgname/vendor-libs
  cp      -r       vendor-libs/*                             "$pkgdir"/usr/lib/$pkgname/vendor-libs/

  cd "$srcdir"/Improve-ImgSLI-$pkgver/src/services
  install -vDm 644 event_handler.py                       -t "$pkgdir"/usr/lib/$pkgname/services/
  install -vDm 644 image_processing_worker.py             -t "$pkgdir"/usr/lib/$pkgname/services/
  install -vDm 644 main_controller.py                     -t "$pkgdir"/usr/lib/$pkgname/services/
  install -vDm 644 settings_manager.py                    -t "$pkgdir"/usr/lib/$pkgname/services/
  install -vDm 644 state_manager.py                       -t "$pkgdir"/usr/lib/$pkgname/services/
  install -vDm 644 ui_logic.py                            -t "$pkgdir"/usr/lib/$pkgname/services/
  install -vDm 644 utils.py                               -t "$pkgdir"/usr/lib/$pkgname/services/

  cd "$srcdir"/Improve-ImgSLI-$pkgver/src/processing_services
  install -vDm 644 image_drawing.py                       -t "$pkgdir"/usr/lib/$pkgname/processing_services/
  install -vDm 644 image_io.py                            -t "$pkgdir"/usr/lib/$pkgname/processing_services/
  install -vDm 644 image_resize.py                        -t "$pkgdir"/usr/lib/$pkgname/processing_services/
}
