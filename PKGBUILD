# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libbluray-git
pkgver=1.3.0.3.g06d7ce99
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
             'java-environment<=16'
             )
optdepends=('libaacs: Enable AACS decryption'
            'java-runtime<=16: BD-J library'
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

  cd libbluray
  git config submodule.contrib/libudfread.url "${srcdir}/libudfread"
  git submodule update --init
}

build() {
  export JDK_HOME="/usr/lib/jvm/java-16-openjdk"
  export JAVAC="/usr/lib/jvm/java-16-openjdk/bin/javac"

  cd libbluray
  ./bootstrap
  cd "${srcdir}/build"
  ../libbluray/configure \
    --prefix=/usr \
    --disable-static

  make
}

package() {
  export JDK_HOME="/usr/lib/jvm/java-16-openjdk"
  export JAVAC="/usr/lib/jvm/java-16-openjdk/bin/javac"

  make -C build DESTDIR="${pkgdir}" install
}
