# Maintainer: Cody Schafer <aur@codyps.com>
# Maintainer: Jake <aur@ja-ke.tech>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=dsview
pkgver=1.12
pkgrel=2
pkgdesc="Client software that supports the DreamSourceLab logic analyzer"
arch=('i686' 'x86_64')
url="http://www.dreamsourcelab.com/"
license=('GPL3')
depends=('boost-libs' 'qt5-base' "libsigrokdecode4dsl>=${pkgver}" "libsigrok4dsl>=${pkgver}" 'fftw')
makedepends=('cmake' 'boost')

source=(
  "DSView-$pkgver.tar.gz::https://github.com/DreamSourceLab/DSView/archive/v${pkgver}.tar.gz"
  'qt5.15.patch::https://github.com/DreamSourceLab/DSView/commit/33e3d896a47e559de95b26b13121bef10827e88d.patch'
  'extern-c.patch::https://github.com/DreamSourceLab/DSView/commit/33cc733abe19872bf5ed08540a94b798d0d4ecf4.patch'
  'udev.rules'
  'dsview.desktop'
)
sha384sums=('52b9fc2dbd9853f33140c2c528d1b31187a185f5869dd4e7700da1da872fec0d2d03732e4f194f487a287107c3e9b0e0'
            'e20413c49f636fccdd1d9e107e1aeb52e0c8e8d2d3eecc4cff6e5f239391d512909512a52af768dc44ec3837b7da363c'
            'd7ab026223bf7633a1c7cc1e03a6a15db942f956751547675423abea34223ae6e84973b8c1229e1e6a0b619fa665d568'
            'c8811523d8712b4cfd2ee10661a36e6ec4ade8fe62384f2cfec9f419a9a50d55cc14c64f944fc82623fdbd955bd63a28'
            '6c47f8b81858cfccc96a0e18dd56dbb23c72baa165650d145898eea8d8f3493a9179f7c8c9afd651ed99e713c9106238')

_wdir() {
  cd "$srcdir/DSView-$pkgver/DSView"
}

prepare() {
  cd "$srcdir/DSView-$pkgver"
  patch -Np1 < "$srcdir/qt5.15.patch"
  patch -Np1 < "$srcdir/extern-c.patch"
  
  cd DSView
  sed -i 's#install(FILES icons/logo.png DESTINATION share/${PROJECT_NAME} RENAME logo.png)##; 
          s#install(FILES DreamSourceLab.rules DESTINATION /etc/udev/rules.d/)##; 
          s#install(FILES DSView.desktop DESTINATION /usr/share/applications/)##' CMakeLists.txt
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
  
  ln -s "/usr/bin/DSView" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "$srcdir/dsview.desktop" "$pkgdir/usr/share/applications/dsview.desktop"
  install -Dm644 "$srcdir/udev.rules" "$pkgdir/usr/lib/udev/rules.d/20-dsview.rules"

  install -Dm644 icons/logo.svg "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.svg"
}

# vim:set ts=2 sw=2 et:
