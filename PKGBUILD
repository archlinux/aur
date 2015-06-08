# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libbluray-git
pkgver=0.8.0.47.g7b9e926
pkgrel=1
pkgdesc="Library to access Blu-Ray disks for video playback. (GIT version)"
arch=('i686' 'x86_64')
license=('LGPL2.1')
url="http://www.videolan.org/developers/libbluray.html"
depends=('libxml2' "java-environment" 'fontconfig')
makedepends=('git' 'apache-ant' 'libaacs')
optdepends=('libaacs: Enable AACS decryption')
provides=('libbluray')
conflicts=('libbluray')
source=('git+http://git.videolan.org/git/libbluray.git'
        'git://git.videolan.org/libudfread.git')
sha1sums=('SKIP'
          'SKIP')

pkgver() {
  cd libbluray
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd libbluray
  git submodule init
  git config submodule.contrib/libudfread.url "file://${srcdir}/libudfread"
  git submodule update
  ./bootstrap
}

build() {
  cd libbluray
  JDK_HOME="/usr/lib/jvm/default" ./configure --prefix=/usr --disable-static --enable-udf
  make
}

package() {
  make -C libbluray DESTDIR="${pkgdir}" install
}
