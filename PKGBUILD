# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libbluray-git
pkgver=1.3.4.0.gbb5bc108
pkgrel=1
pkgdesc="Library to access Blu-Ray disks for video playback. (GIT version)"
arch=('x86_64')
license=('LGPL2.1')
url='https://www.videolan.org/developers/libbluray.html'
depends=('libxml2.so'
         'libfontconfig.so'
         'libfreetype.so'
         'libudfread.so'
         )
makedepends=('git'
             'apache-ant'
             'libxml2'
             'fontconfig'
             'libudfread-git'
             'java-environment<=19'
             )
optdepends=('libaacs: Enable AACS decryption'
            'java-runtime<=19: BD-J library'
            )
provides=('libbluray'
          'libbluray.so'
          )
conflicts=('libbluray')
source=('git+https://code.videolan.org/videolan/libbluray.git')
sha256sums=('SKIP')

pkgver() {
  cd libbluray
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
}

build() {
  export JDK_HOME="/usr/lib/jvm/java-19-openjdk"
  export JAVAC="/usr/lib/jvm/java-19-openjdk/bin/javac"

  cd libbluray
  ./bootstrap
  cd "${srcdir}/build"
  ../libbluray/configure \
    --prefix=/usr \
    --disable-static

  make
}

package() {
  export JDK_HOME="/usr/lib/jvm/java-19-openjdk"
  export JAVAC="/usr/lib/jvm/java-19-openjdk/bin/javac"

  make -C build DESTDIR="${pkgdir}" install
}
