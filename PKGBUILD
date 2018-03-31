# Maintainer: Christian Kohlstedde <christian + arch at kohlsted.de>

pkgname=rivendell
pkgver=2.19.1
pkgrel=1

pkgdesc="Open Source Radio Automation"

arch=(x86_64)
url="http://www.rivendellaudio.org/"
license=('GPL2')

depends=(
  'curl'
  'libxi'
  'cdrtools'
  'id3lib'
  'cdparanoia'
  'libsndfile'
  'mariadb'
  'qt3'
  'libsamplerate'
  'soundtouch'
  'jack2'
  'alsa-lib'
  'flac'
  'faad2'
  'libmp4v2'
  'lame'
  'libmad'
  'twolame'
  'taglib'
  'libvorbis'
)

makedepends=(
  'patch'
)

backup=('etc/rd.conf')

source=(
  "http://www.rivendellaudio.org/ftpdocs/rivendell/rivendell-$pkgver.tar.gz"
  "patch-makefile.patch"
  )
sha256sums=('97c957c70e3caafad4d4d6520de3d35f4ac0e90036ad1123f89c2916ecc7e23c'
            '5c2bfdd00353ac2b9bbbcfe3e3e7d665f77d5c9caefa255ff9356c93f455f6d0')

prepare() {
  cd "$pkgname-$pkgver"

  patch -p1 < ../patch-makefile.patch
}

build() {
  cd "$pkgname-$pkgver"
  export RD_LIB_PATH="lib"

  sh autogen.sh
  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib/rivendell/web \
    --libdir=/usr/lib \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --with-Qt-bin-dir=/usr/lib/qt3/bin \
    --with-Qt-include-dir=/usr/include/qt3 \
    --with-Qt-lib-dir=/usr/lib

  make
}

package() {
  cd "$pkgname-$pkgver"

  touch building-debian

  export RD_LIB_PATH="lib"
  export DESTDIR="$pkgdir"
  make install

  mkdir -p "$pkgdir"/etc/rivendell.d
  install -t "$pkgdir"/etc/rivendell.d -Dm755 conf/rlm_*.conf
  install -Dm755 conf/rd.conf-sample "$pkgdir"/etc/rd.conf
  install -Dm755 conf/rd-bin.conf "$pkgdir"/etc/httpd/conf/extra/rd-bin.conf
}
