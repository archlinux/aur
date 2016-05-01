# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libbluray-git
pkgver=0.9.2.154.g82c69be
pkgrel=1
pkgdesc="Library to access Blu-Ray disks for video playback. (GIT version)"
arch=('i686' 'x86_64')
license=('LGPL2.1')
url="http://www.videolan.org/developers/libbluray.html"
depends=('libxml2'
         'java-environment'
         'fontconfig'
         )
makedepends=('git'
             'apache-ant'
             'libaacs'
             )
optdepends=('libaacs: Enable AACS decryption')
provides=('libbluray' 'libbluray.so')
conflicts=('libbluray')
source=('git+http://git.videolan.org/git/libbluray.git'
        'git+http://git.videolan.org/git/libudfread.git'
        )
sha1sums=('SKIP'
          'SKIP'
          )

pkgver() {
  cd libbluray
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  export JDK_HOME="/usr/lib/jvm/default"

  cd libbluray
  git submodule init
  git config submodule.contrib/libudfread.url "file://${srcdir}/libudfread"
  git submodule update
  ./bootstrap
}

build() {
  cd libbluray
  ./configure \
    --prefix=/usr \
    --disable-static \
    --enable-udf
  make
}

package() {
  make -C libbluray DESTDIR="${pkgdir}" install
}
