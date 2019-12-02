# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>
# Maintainer: Cody Schafer <aur@codyps.com>

pkgname=dsview
pkgver=1.01
pkgrel=1
pkgdesc="Client software that supports the DreamSourceLab logic analyzer"
arch=('i686' 'x86_64')
url="http://www.dreamsourcelab.com/"
license=('GPL3')
depends=('boost-libs' 'qt5-base' "libsigrokdecode4dsl=${pkgver}" "libsigrok4dsl=${pkgver}" 'fftw')
makedepends=('boost')

source=(
  "DSView-$pkgver.tar.gz::https://github.com/DreamSourceLab/DSView/archive/v${pkgver}.tar.gz"
  'udev.rules'
  'dsview.desktop'
  '0001-workaround-configure-failure-due-to-boost-cmake.patch'
  '0002-cmake-python-link.patch'
)
sha384sums=('b8bf646f8c599cb8adfa2ab1363f36592a1ecb10b819617cecc970ac7a30b8d5ef912e9af5c1d55a9282478d8a55b80e'
            '4f7c463e0723e3cfd6ed146e0db6b44627065af077aaca9765b60c9347752e32032752f04883da89b9f65523ca5c28e8'
            '6c47f8b81858cfccc96a0e18dd56dbb23c72baa165650d145898eea8d8f3493a9179f7c8c9afd651ed99e713c9106238'
            '338763e008464bebb1f11e62d3a4839d7af43c800f772be6d51a345f6e1e83fa4d5929c1e4b363dd9af2073dda420821'
            'b3c355692709a1d9f4a1712f963ab87b1437e8d40fe0bb43dbc433f29ff9b06cc630bff357d33e5da6a351bee9dbd98f')

_wdir() {
  cd "$srcdir/DSView-$pkgver/DSView"
}

prepare() {
  cd "$srcdir/DSView-$pkgver"
  patch -Np1 -i "$srcdir"/'0001-workaround-configure-failure-due-to-boost-cmake.patch'
  patch -Np1 -i "$srcdir"/'0002-cmake-python-link.patch'
  
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

  install -Dm644 "$srcdir/dsview.desktop" "$pkgdir/usr/share/applications/dsview.desktop"
  install -Dm644 "$srcdir/udev.rules" "$pkgdir/usr/lib/udev/rules.d/20-dsview.rules"

  install -Dm644 icons/logo.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
}

# vim:set ts=2 sw=2 et:
