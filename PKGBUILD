# Maintainer: goetzc
# Contributor: Daenyth, Jonas Jelten
pkgname=tremulous-gpp
pkgver=1.2
pkgrel=2
pkgdesc="Tremulous 1.2 beta - Gameplay Preview (gpp)"
arch=(i686 x86_64)
url="http://tremulous.net"
license=('GPL' 'custom:CC')
depends=('tremulous-data=1.1.0' 'sdl2' 'openal')
optdepends=('lyx: WYSIWYM manual viewer')
makedepends=('git' 'mesa')
source=('tremulous-gpp::git+https://github.com/darklegion/tremulous#branch=gpp'
        tremulous.sh tremded.sh tremulous.desktop)
md5sums=('SKIP'
         'c5a9317f5bb2a07cc12dd75d69dceb03'
         '47303d8033f7528883d22a2610decb1b'
         '262d1689646cdb605783aaf87e78ee85')
options=('!strip')

# Change this to 'debug' if you want debugging symbols enabled
_maketarget='release'

build() {
  cd "$srcdir/$pkgname"

  # sed -i 's/openal-config/pkg-config/g' Makefile
  make $_maketarget
}

package() {
  cd "$srcdir/$pkgname"

  local _arch=${CARCH/i686/x86}

  sed -i "s/ARCH_REPLACE/${_arch}/" "${srcdir}/tremulous.sh"
  sed -i "s/ARCH_REPLACE/${_arch}/" "${srcdir}/tremded.sh"

  # Install binaries
  install -dm755 $pkgdir/opt/tremulous
  install -m755 build/$_maketarget-linux-$_arch/renderer_opengl*.so  $pkgdir/opt/tremulous
  install -m755 build/$_maketarget-linux-$_arch/*.$_arch  $pkgdir/opt/tremulous
  for bin in $pkgdir/opt/tremulous/*.$_arch; do mv $bin ${bin/./-gpp.}; done

  # Install data files
  install -d -m755 $pkgdir/opt/tremulous/gpp
  cd $srcdir/$pkgname/assets; zip -r $srcdir/data-gpp1.pk3 *
  install -m644 $srcdir/data-gpp1.pk3  $pkgdir/opt/tremulous/gpp/
  cd $srcdir/$pkgname/build/$_maketarget-linux-$_arch/gpp; zip $srcdir/vms-gpp1.pk3 vm/*
  install -m644 $srcdir/vms-gpp1.pk3   $pkgdir/opt/tremulous/gpp/

  # Install client & server launchers
  install -D -m755 $srcdir/tremulous.sh  $pkgdir/usr/bin/tremulous-gpp
  install -D -m755 $srcdir/tremded.sh    $pkgdir/usr/bin/tremded-gpp

  # Install desktop files
  install -Dm644 $srcdir/tremulous.desktop            $pkgdir/usr/share/applications/tremulous-gpp.desktop
  install -Dm644 $srcdir/$pkgname/misc/tremulous.xpm  $pkgdir/usr/share/pixmaps/tremulous-gpp.xpm
  install -Dm644 $srcdir/$pkgname/misc/manual.lyx     $pkgdir/usr/share/tremulous/manual.lyx

  # Install license
  install -Dm644 $srcdir/$pkgname/GPL  ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 $srcdir/$pkgname/CC   ${pkgdir}/usr/share/licenses/$pkgname/LICENSE-CC
}
