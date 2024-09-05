# Maintainer: blacktav <blacktav at gmail dot com>
# Contributor: based on unknown abandoned pokerth-final from 2012-12-27
# Patches: xx55tt, viktoracoric, Mailaender

pkgname=pokerth
pkgver=1.1.2
pkgrel=44

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
        ${pkgname}-${pkgver}.patch.2023.xdg
        ${pkgname}-${pkgver}.patch.2024.boost_deps)
md5sums=('8fd7d7fc7ece17315e58aa3240dd4586'
         '0ef5541fc6008dfb2521dcab47afb659'
         '50d427bd8afc57fb61e186de6c4e5601'
         '5bdcc1f2240c20f4b766b183d93836b3'
         '64e1b4b08353c11370ea32dfc381ca97'
         'e61eae14e6394f4745245e2ef42d812c'
         '5a563f6b3b144b0e6c2eb4bacd4ca3d4')

# -------------------------------------------------------------------------
# Possible build speed-ups
# These changes are better made in /etc/makepkg.conf
#
# 1. This is trade-off between size (+12%) & speed (-2%)
# The optimum is reckoned to be COMPRESSZST=(zstd -c -T0 -18 -)
#COMPRESSZST=(zstd -c -T0 -)
# 2. the debug option incurs a large penalty (-15% speed-up)
#OPTIONS=(strip docs !libtool !staticlibs emptydirs zipman purge !debug !lto)
# 3. use all your cores (-35% speed-up possible)
#MAKEFLAGS="--jobs=$(nproc)"
# -------------------------------------------------------------------------

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
  # changes suggested by @viktoracoric
  # patch -Np1 -i "${srcdir}/pokerth-1.1.2.patch.2023.xdg"
  # ----------------------------------------------------------------------------
  # change to adapt to boost deprecation removals in 1.85
  # corrections taken from upstream
  # adapts to BOOST_VERSION: should work with either 1.83 or 1.86
  patch -Np1 -i "${srcdir}/pokerth-1.1.2.patch.2024.boost_deps"
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
  # added for icons 2024-06-26 Mailaender 
  install -Dm644 pokerth.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/pokerth.png"
  install -Dm644 pokerth.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/pokerth.svg"
  install -D -m644 docs/pokerth.1 "$pkgdir/usr/share/man/man1/pokerth.1"
  install -D -m644 data/data-copyright.txt "$pkgdir/usr/share/licenses/pokerth/data-copyright.txt"
  rm -f "$pkgdir/usr/share/pokerth/data/data-copyright.txt"
}

