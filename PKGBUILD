# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libbluray-git
pkgver=1.1.1.13.g109bbb00
pkgrel=1
pkgdesc="Library to access Blu-Ray disks for video playback. (GIT version)"
arch=('x86_64')
license=('LGPL2.1')
url='http://www.videolan.org/developers/libbluray.html'
depends=('libxml2'
         'fontconfig'
         )
makedepends=('git'
             'apache-ant'
             'java-environment<=11'
             'libaacs'
             )
optdepends=('libaacs: Enable AACS decryption'
            'java-runtime<=11: BD-J library'
            )
provides=('libbluray'
          'libbluray.so'
          )
conflicts=('libbluray')
source=('git+https://code.videolan.org/videolan/libbluray.git'
        'git+https://code.videolan.org/videolan/libudfread.git'
        )
sha256sums=('SKIP'
            'SKIP'
           )

pkgver() {
  cd libbluray
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  export JDK_HOME="/usr/lib/jvm/java-11-jdk"

  cd libbluray
  git config submodule.contrib/libudfread.url "${srcdir}/libudfread"
  git submodule update --init

  ./bootstrap
}

build() {
  cd build
  ../libbluray/configure \
    --prefix=/usr \
    --disable-static \
    --with-java9

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
