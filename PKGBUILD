# Maintainer: Cody Schafer <aur@codyps.com>
# Maintainer: Jake <aur@ja-ke.tech>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=dsview
pkgver=1.12
pkgrel=1
pkgdesc="Client software that supports the DreamSourceLab logic analyzer"
arch=('i686' 'x86_64')
url="http://www.dreamsourcelab.com/"
license=('GPL3')
depends=('boost-libs' 'qt5-base' "libsigrokdecode4dsl>=${pkgver}" "libsigrok4dsl>=${pkgver}" 'fftw')
makedepends=('cmake' 'boost')

source=(
  "DSView-$pkgver.tar.gz::https://github.com/DreamSourceLab/DSView/archive/v${pkgver}.tar.gz"
  'qt5.15.patch::https://github.com/DreamSourceLab/DSView/commit/33e3d896a47e559de95b26b13121bef10827e88d.patch'
  'udev.rules'
  'dsview.desktop'
)
sha384sums=('52b9fc2dbd9853f33140c2c528d1b31187a185f5869dd4e7700da1da872fec0d2d03732e4f194f487a287107c3e9b0e0'
            'db4c3b5572fcbae98544a68ae0f658d9dfcc9d12b9bf7eb35e677106718f2573c6aac9047644d3cb2d09285d7ecaff19'
            '4f7c463e0723e3cfd6ed146e0db6b44627065af077aaca9765b60c9347752e32032752f04883da89b9f65523ca5c28e8'
            '6c47f8b81858cfccc96a0e18dd56dbb23c72baa165650d145898eea8d8f3493a9179f7c8c9afd651ed99e713c9106238')

_wdir() {
  cd "$srcdir/DSView-$pkgver/DSView"
}

prepare() {
  cd "$srcdir/DSView-$pkgver"
  patch -Np1 < "$srcdir/qt5.15.patch"
  
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
