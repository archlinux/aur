# Maintainer: blacktav <blacktav at gmail dot com>
# Contributor: based on unknown abandoned pokerth-final from 2012-12-27
# Patches: xx55tt, viktoracoric

pkgname=pokerth
pkgver=1.1.2
pkgrel=34
pkgdesc="Client to online Poker game written in C++/Qt"
arch=('i686' 'x86_64')
url="http://www.pokerth.net/"
license=('GPL' 'custom')
depends=('curl' 'boost-libs' 'gsasl' 'protobuf'
         'qt5-base' 'sdl_mixer' 'tinyxml')

makedepends=('boost')

source=(https://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz
        ${pkgname}-${pkgver}.patch
        ${pkgname}-${pkgver}.patch.2019
        ${pkgname}-${pkgver}.patch.2020
        ${pkgname}-${pkgver}.patch.2023
        ${pkgname}-${pkgver}.patch.xdg.2023)
md5sums=('8fd7d7fc7ece17315e58aa3240dd4586'
         '0ef5541fc6008dfb2521dcab47afb659'
         '50d427bd8afc57fb61e186de6c4e5601'
         '2204bc9d820057d5d4b04d675cf09198'
         '5efeb1305e3d6ff4b60edf1fd7f939b6'
         'e61eae14e6394f4745245e2ef42d812c')

prepare() {
  cd "$srcdir/$pkgname-$pkgver-rc"

  # ---< required for v1.1.2 >--------------------------------------------------
  # these changes should be incorporated in next release ~feb-2018
  patch -Np1 -i "${srcdir}/pokerth-1.1.2.patch"
  # ----------------------------------------------------------------------------
  # changes to permit building with boost 1.70
  patch -Np1 -i "${srcdir}/pokerth-1.1.2.patch.2019"
  # ----------------------------------------------------------------------------
  # change to permit building with boost 1.74
  # see also DEFINE+="BOOST_BIND_GLOBAL_PLACEHOLDERS" in build below
  patch -Np1 -i "${srcdir}/pokerth-1.1.2.patch.2020"
  # ----------------------------------------------------------------------------
  # change to explicitly link libabsl_log_internal_message.so and
  #                           libabsl_log_internal_check_op.so
  #                           patch revised by xx55tt
  patch -Np1 -i "${srcdir}/pokerth-1.1.2.patch.2023"
  # ----------------------------------------------------------------------------
  # change to use XDG_CONFIG_HOME if available
  # currently sets folder within XDG_CONFIG_HOME to be .pokerth rather than pokerth
  # changes suggested by @viktoracoric
  # patch -Np1 -i "${srcdir}/pokerth-1.1.2.patch.xdg.2023"
  # ----------------------------------------------------------------------------

  # good idea to do this at all times
  protoc -I=$srcdir/$pkgname-$pkgver-rc/ --cpp_out=$srcdir/$pkgname-$pkgver-rc/src/third_party/protobuf/ $srcdir/$pkgname-$pkgver-rc/pokerth.proto $srcdir/$pkgname-$pkgver-rc/chatcleaner.proto

}

build() {
  cd "$srcdir/$pkgname-$pkgver-rc"

  # QMAKE_CFLAGS_ISYSTEM workaround to prevent generation of "-isystem /usr/include"
  qmake CONFIG+="client" DEFINES+="BOOST_BIND_GLOBAL_PLACEHOLDERS" QMAKE_CFLAGS_ISYSTEM= -spec linux-g++ ${pkgname}.pro
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver-rc"

  make INSTALL_ROOT="$pkgdir" install

  install -D pokerth "$pkgdir/usr/bin/pokerth"
  install -D -m644 docs/pokerth.1 "$pkgdir/usr/share/man/man1/pokerth.1"
  install -D -m644 data/data-copyright.txt "$pkgdir/usr/share/licenses/pokerth/data-copyright.txt"
  rm -f "$pkgdir/usr/share/pokerth/data/data-copyright.txt"
}

