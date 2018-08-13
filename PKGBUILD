# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>
# Maintainer: Cody Schafer <aur@codyps.com>

pkgname=dsview
pkgver=0.99
pkgrel=1
pkgdesc="Client software that supports the DreamSourceLab logic analyzer"
arch=('i686' 'x86_64')
url="http://www.dreamsourcelab.com/"
license=('GPL3')
depends=('boost-libs' 'qt5-base' "libsigrokdecode4dsl=${pkgver}" "libsigrok4dsl=${pkgver}" 'fftw')
makedepends=('boost')

source=(
  "DSView-$pkgver.tar.gz::https://github.com/DreamSourceLab/DSView/archive/${pkgver}.tar.gz"
  'udev.rules'
  'dsview.desktop'
)
sha384sums=('9f92432c1721d5e39b343029955c95203bf9cf051095956175e7315e0471bbc01c8ba85708ed3eb085a7cf75932adb6c'
            'cb8d28e4f0e20d81bccb7f81d3c2df9df13e13a45556bce9cbf0303f12d23564271bcc6afacf6a2801114dec50000729'
            'cd0519be1288c319e9803fa376058635cf61b33b7c84540b095edd293f3ba9875009a5b7d054b5b6f1bbace8c179560d')

_wdir() {
  cd "$srcdir/DSView-$pkgver/DSView"
}

prepare() {
  _wdir
  sed -i 's#install(FILES icons/logo.png DESTINATION share/${PROJECT_NAME} RENAME logo.png)##; 
          s#install(FILES DreamSourceLab.rules DESTINATION /etc/udev/rules.d/)##' \
    CMakeLists.txt
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_SKIP_RPATH=1 .
}

build() {
  _wdir
  cmake .
  make
}

package() {
  _wdir

  make DESTDIR="$pkgdir" PREFIX=/usr install

  install -Dm644 "$srcdir/dsview.desktop" "$pkgdir/usr/share/applications/dsview.desktop"
  install -Dm644 "$srcdir/udev.rules" "$pkgdir/usr/lib/udev/rules.d/20-dsview.rules"

  for i in 16 32 48 64 128 256; do
    install -Dm644 icons/logo_${i}.png "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
  done
}

# vim:set ts=2 sw=2 et:
