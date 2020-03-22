# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libbluray-git
pkgver=1.2.0.0.g43059c7e
pkgrel=1
pkgdesc="Library to access Blu-Ray disks for video playback. (GIT version)"
arch=('x86_64')
license=('LGPL2.1')
url='http://www.videolan.org/developers/libbluray.html'
depends=('libxml2'
         'fontconfig'
         'libfreetype.so'
         )
makedepends=('git'
             'apache-ant'
             'classpath'
             'java-environment<=13'
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

  export JDK_HOME="/usr/lib/jvm/java-13-jdk"

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
