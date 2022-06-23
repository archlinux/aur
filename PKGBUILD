# Maintainer:  tx00100xt <tx00100xt@yandex.ru>
# Contributer: tx00100xt <tx00100xt@yandex.ru>

pkgname=serioussam-dancesworld
pkginstdir=serioussam
dancesworld=SamTSE-DancesWorld.tar.xz
pkgver=2.0
_srcname="SE1-TSE-DancesWorld-$pkgver"
pkgrel=1
pkgdesc="Serious Sam Classic Dances World native Linux."
arch=('i686' 'x86_64')
url="https://github.com/tx00100xt/SE1-TSE-DancesWorld"
license=('GPL2')
depends=('sdl2' 'python' 'bash')
makedepends=('cmake' 'make' 'sed')
source=("https://github.com/tx00100xt/SE1-TSE-DancesWorld/archive/refs/tags/v$pkgver.tar.gz"
	"https://github.com/tx00100xt/serioussam-mods/raw/main/SamTSE-DancesWorld/SamTSE-DancesWorld.tar.xz")
sha256sums=('ab714ad403370c099fb1cff3485f956394d48bb0011c186882eb49d4cec69128'
	"0bf91dfc5b569cb33c9ec5029423c01de9c59690e214e299c9cb671bb92608b2")

if [[ $CARCH = "i686" ]]; then
  _bits="32"
else
  _bits="64"
fi

prepare(){
  # Making building scripts.
  cd "$srcdir/$_srcname/Sources/"
  sed -i 's/cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo/cmake -DCMAKE_BUILD_TYPE=Release/g' build-linux"$_bits".sh

  chmod 755 build-linux"$_bits".sh
}

build(){
  # Building Serious Sam Dances World.
  cd "$srcdir/$_srcname/Sources/"
  ./build-linux"$_bits".sh

  mv "$srcdir/$_srcname/Sources/cmake-build/Debug/libGameMP.so" "$srcdir/Mods/DancesWorld/Bin" || return 1
  mv "$srcdir/$_srcname/Sources/cmake-build/Debug/libEntitiesMP.so"  "$srcdir/Mods/DancesWorld/Bin" || return 1

  # Removing Serious Sam Dances World tmp stuff.
  cd "$srcdir/$_srcname/"
  rm -fr "Sources"
  rm -fr "Tools.Win32"

  rm -f  "$srcdir/$_srcname"/{*.sh,*.old,*.md}
  rm -fr "$srcdir/$_srcname"/{Images,x32,x64}
}

package(){
  # Making sure directories exist.
  install -d $pkgdir/usr/share/licenses
  mkdir "$pkgdir/usr/share/$pkginstdir"
  mkdir "$pkgdir/usr/share/$pkginstdir"/{SamTSE,SamTSE/Mods} || return 0

  # Install license.
  install -D -m 644 $srcdir/$_srcname/LICENSE \
       $pkgdir/usr/share/licenses/$pkgname/LICENSE
  rm -f  "$srcdir/$_srcname/LICENSE" || return 1

  # Install data.
  mv "$srcdir/Mods" "$pkgdir/usr/share/$pkginstdir/SamTSE"
}
