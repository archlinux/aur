# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=dolphin-megasync-git
pkgver=v4.0.2.0.1.g2dec1949
pkgrel=1
pkgdesc="Upload your files to your Mega account from Dolphin file manager. (GIT Version)"
arch=('x86_64')
url='https://mega.co.nz/sync'
license=('custom:MEGA')
depends=('kio'
         'hicolor-icon-theme'
         'megasync'
         )
makedepends=('extra-cmake-modules'
             'qt5-tools'
             'git'
             )
source=('git+https://github.com/meganz/MEGAsync.git'
        'kf5.patch'
        )
sha256sums=('SKIP'
            '9f356204e6c844216e68f2c75a7d757c46a811130793fe2a4238e19d05d2da0f'
            )

pkgver() {
  cd MEGAsync
  echo "$(git describe --long --tags | tr - . | tr _ . | sed 's|OSX\.||' | sed 's|Win\.||' | sed 's|Linux\.||' | sed 's|Ubuntu\.18\.10build\.||g' )"
}

prepare() {
  mkdir -p build

  patch -p1 -i "${srcdir}/kf5.patch"

  mv MEGAsync/src/MEGAShellExtDolphin/CMakeLists.txt MEGAsync/src/MEGAShellExtDolphin/CMakeLists.txt.old
  mv MEGAsync/src/MEGAShellExtDolphin/CMakeLists_kde5.txt MEGAsync/src/MEGAShellExtDolphin/CMakeLists.txt
}

build() {
  cd build
  cmake ../MEGAsync/src/MEGAShellExtDolphin \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install

  install -Dm644 MEGAsync/LICENCE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE.md"
}
