# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=dolphin-megasync-git
pkgver=v3.1.4.0.3.g2dcb710b
pkgrel=1
pkgdesc="Upload your files to your Mega account from Dolphin file manager. (GIT Version)"
arch=('i686' 'x86_64')
url='https://mega.co.nz/sync'
license=('custom:MEGA')
depends=('kio'
         'hicolor-icon-theme'
         )
makedepends=('extra-cmake-modules'
             'qt5-tools'
             'git'
             )
source=('git+https://github.com/meganz/MEGAsync.git'
        'kf5.patch'
        )
sha256sums=('SKIP'
            '1637e860d76a179420c2a58667bae8fc67e944c7216c765e6ce5794b58974fc5'
            )

pkgver() {
  cd MEGAsync
  echo "$(git describe --long --tags | tr - . | tr _ . | sed 's|OSX\.||' | sed 's|Win\.||' | sed 's|Linux\.||' )"
}

prepare() {
  mkdir -p build

  patch -p1 -i ${srcdir}/kf5.patch

  mv MEGAsync/src/MEGAShellExtDolphin/CMakeLists.txt MEGAsync/src/MEGAShellExtDolphin/CMakeLists.txt.old
  mv MEGAsync/src/MEGAShellExtDolphin/CMakeLists_kde5.txt MEGAsync/src/MEGAShellExtDolphin/CMakeLists.txt
}

build() {
  cd build
  cmake ../MEGAsync/src/MEGAShellExtDolphin \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
