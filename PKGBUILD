# Maintainer: Christian Kohlstedde <christian + arch at kohlsted.de>

pkgname=rivendell
pkgver=2.19.3
pkgrel=2

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
  'jack'
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
sha256sums=('da3add8c2520ba0a501f4c50ee3bcb103fa03f439e417303eb2390c134fb0688'
            '5c2bfdd00353ac2b9bbbcfe3e3e7d665f77d5c9caefa255ff9356c93f455f6d0')

prepare() {
  cd "$pkgname-$pkgver"

  patch -p1 < ../patch-makefile.patch
  sed -i 's|pow10(|pow(10.0,|' cae/*.cpp
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
