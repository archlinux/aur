# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=qt5-webkit-print
_qtver=5.212.0-alpha2
pkgver=${_qtver/-/}
pkgrel=1
arch=(x86_64)
url='https://github.com/annulen/webkit/wiki'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='Classes for a WebKit2 based implementation and a new QML API (maintained fork) (patched with pdf scale and background fixes)'
depends=(qt5-location qt5-sensors qt5-webchannel libwebp libxslt libxcomposite gst-plugins-base hyphen)
makedepends=(cmake ruby gperf python2 qt5-doc qt5-tools)
optdepends=('gst-plugins-good: Webm codec support')
conflicts=(qt5-webkit)
provides=(qt5-webkit)
source=("https://github.com/annulen/webkit/releases/download/qtwebkit-$pkgver/qtwebkit-$pkgver-alpha.tar.xz"
        qt5-webkit-icu59.patch qt5-webkit-ng-gcc7.patch qt5-webkit-ng-functional.patch qt5-webkit-pdf_scaling.patch qt5-webkit-solid_background_PDF.patch)
sha256sums=('f70fea4623a0f1df6ec535358f9c431d6ead9c04742a85258aaabcd0805d2719'
            'e1306e696ad7125fa00083aa966be0ea6fe6de555c9e1d119957f208f258edfe'
            '58ecbd8708f5afe4e974fdcd6c1f32fea61ccc55dc9bb711768f2d0da6963fb8'
            'c85344edcc23930c0190b2f8ec3847bf8bdbbf7f1d4fa877c502e354e5f4233e'
            '3118595e764bec08960518c07eb5c321d7195b23adc634ba7a50987aeec642b0'
            '339876e8dfdaabdc974d2b2f095d85691d339aef16abe97b472268dae462d0cf')

prepare() {
  mkdir -p build

  cd qtwebkit-$pkgver-alpha
# Fix build with ICU 59 (PLD linux)
  patch -p1 -i ../qt5-webkit-icu59.patch
# Fix build with GCC 7
  patch -p1 -i ../qt5-webkit-ng-gcc7.patch
  patch -p1 -i ../qt5-webkit-ng-functional.patch
  # aleray fixes (https://github.com/annulen/webkit/compare/qtwebkit-stable...aleray:ospkit2)
  patch -p1 -i ../qt5-webkit-pdf_scaling.patch
  patch -p1 -i ../qt5-webkit-solid_background_PDF.patch

  sed -e 's|-Wundef|-Wundef -Wno-expansion-to-defined|' -i Source/cmake/WebKitHelpers.cmake
}

build() {
  cd build

  cmake ../qtwebkit-$pkgver-alpha \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DPORT=Qt \
    -DENABLE_TOOLS=OFF
    # -DCMAKE_INSTALL_PREFIX:PATH=/usr/local \
    # -DVMIME_INSTALL_LIBDIR=/usr/local/lib \
    # -DENABLE_WEBKIT2=OFF \
    # -DENABLE_VIDEO=OFF \
    # -DENABLE_WEB_AUDIO=OFF \
    # -DENABLE_GEOLOCATION=OFF \
    # -DENABLE_IOS_AIRPLAY=OFF \
    # -DENABLE_MINIBROWSER=OFF \
    # -DENABLE_NOTIFICATIONS=OFF \
    # -DENABLE_REMOTE_INSPECTOR=OFF \
    # -DENABLE_SPEECH_SYNTHESIS=OFF \
    # -DENABLE_TOUCH_EVENTS=OFF \
    # -DENABLE_TOUCH_SLIDER=OFF \
    # -DENABLE_TOUCH_ICON_LOADING=OFF \
    # -DENABLE_DEVICE_ORIENTATION=OFF \
    # -DENABLE_GAMEPAD=OFF \
    # -DENABLE_MEDIA_CAPTURE=OFF \
    # -DENABLE_VIBRATION=OFF
  make
}

package() {

  # mkdir -p "$pkgdir/etc/ld.so.conf.d"
  # install -Dm644 lib64-libriis.conf "$pkgdir/etc/ld.so.conf.d/lib64-libriis.conf"

  cd build
  make DESTDIR="$pkgdir" install

  # mv "$pkgdir"/usr/local/lib64 "$pkgdir"/usr/local/lib

  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/qt5-base "$pkgdir"/usr/share/licenses/${pkgname}
}
