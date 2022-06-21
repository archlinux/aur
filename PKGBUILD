# Maintainer:  tx00100xt <tx00100xt@yandex.ru>
# Contributer: tx00100xt <tx00100xt@yandex.ru>

pkgname=serioussam
pkgver=1.10.2
_srcname="SeriousSamClassic-$pkgver"
pkgrel=1
pkgdesc="A game engine developed by Croteam for the classic Serious Sam games."
arch=('i686' 'x86_64')
url="https://github.com/tx00100xt/SeriousSamClassic"
license=('GPL2')
depends=('sdl2' 'python' 'bash')
makedepends=('cmake' 'make' 'sed')
source=(https://github.com/tx00100xt/SeriousSamClassic/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('SKIP')
if [[ $CARCH = "i686" ]]; then
  _bits="32"
else
  _bits="64"
fi

prepare(){
  cd "$srcdir/$_srcname/SamTFE/Sources/"
  sed -i 's/cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo/cmake -DCMAKE_BUILD_TYPE=Release/g' build-linux"$_bits".sh
  sed 's/cmake -DCMAKE_BUILD_TYPE=Release/cmake -DTFE=TRUE -DCMAKE_BUILD_TYPE=Release/g' build-linux"$_bits".sh > build-linux"$_bits"-tfe.sh
  sed -i 's/cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo/cmake -DCMAKE_BUILD_TYPE=Release/g' build-linux"$_bits"xplus.sh
  sed 's/cmake -DCMAKE_BUILD_TYPE=Release/cmake -DTFE=TRUE -DCMAKE_BUILD_TYPE=Release/g' build-linux"$_bits"xplus.sh > build-linux"$_bits"xplus-tfe.sh
  chmod 755 build-linux"$_bits"-tfe.sh
  chmod 755 build-linux"$_bits"xplus-tfe.sh
}
build(){
  cd "$srcdir/$_srcname/SamTFE/Sources/"
  ./build-linux"$_bits"-tfe.sh

  cd "$srcdir/$_srcname/SamTFE/Sources/"
  ./build-linux"$_bits"xplus-tfe.sh

  cd "$srcdir/$_srcname/SamTSE/Sources/"
  ./build-linux"$_bits".sh

  cd "$srcdir/$_srcname/SamTSE/Sources/"
  ./build-linux"$_bits"xplus.sh

  cd "$srcdir/$_srcname/SamTFE/"
  rm -fr "Sources"
  rm -fr "Tools.Win32"

  cd "$srcdir/$_srcname/SamTSE/"
  rm -fr "Sources"
  rm -fr "Tools.Win32"

  rm -f  "$srcdir/$_srcname"/{*.sh,*.old}
}
package(){
  mkdir -p "$pkgdir"/usr/{bin,share}/
  mv "$srcdir/$_srcname" "$pkgdir/usr/share/$pkgname"
  ln -s /usr/share/$pkgname/SamTFE/Bin/SeriousSam "$pkgdir/usr/bin/serioussam-tfe"
  ln -s /usr/share/$pkgname/SamTSE/Bin/SeriousSam "$pkgdir/usr/bin/serioussam-tse"
}
