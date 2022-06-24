# Maintainer:  tx00100xt <tx00100xt@yandex.ru>
# Contributer: tx00100xt <tx00100xt@yandex.ru>

pkgname=serioussam-tower
pkginstdir=serioussam
tower=SamTFE-Tower.tar.xz
pkgver=1.00
_srcname="SE1-TFE-Tower-$pkgver"
pkgrel=1
pkgdesc="Serious Sam Classic Nightmare Tower native Linux."
arch=('i686' 'x86_64')
url="https://github.com/tx00100xt/SE1-TFE-Tower"
license=('GPL2')

if pacman -Qq serioussam >/dev/null 2>&1; then
  depends=('sdl2' 'python' 'bash' 'serioussam')
elif pacman -Qq serioussam-vk >/dev/null 2>&1; then
  depends=('sdl2' 'python' 'bash' 'serioussam-vk')
else
  echo "This package requires either "serioussam" or "serioussam-vk", but neither is installed."
  echo "Compilation aborted."
  return 1
fi

makedepends=('cmake' 'make' 'sed')
source=("https://github.com/tx00100xt/SE1-TFE-Tower/archive/refs/tags/v$pkgver.tar.gz"
    "https://github.com/tx00100xt/serioussam-mods/raw/main/SamTFE-Tower/SamTFE-Tower.tar.xz")
sha256sums=('90e253befab31fc2e5930f62e06963dc328a93c0cb10cab16bd8bd06d7c28cc6'
	"c665f8dd419c3147c4024f0ac2b7d678c1aed735189f6f8355409398e4eb76df")

if [[ $CARCH = "i686" ]]; then
  _bits="32"
else
  _bits="64"
fi

prepare(){
  # Install the Tower Modification data.
  rm -f "$srcdir/Mods/Tower/Bin/libGame.so" || return 1
  rm -f "$srcdir/Mods/Tower/Bin/libEntities.so" || return 1
  chmod -R o=rx "$srcdir/Mods/Tower"
  chmod -R g=rx "$srcdir/Mods/Tower"

  # Making building scripts.
  cd "$srcdir/$_srcname/Sources/"
  ls -l > ls.txt
  sed -i 's/cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo/cmake -DCMAKE_BUILD_TYPE=Release/g' build-linux"$_bits".sh
  sed 's/cmake -DCMAKE_BUILD_TYPE=Release/cmake -DTFE=TRUE -DCMAKE_BUILD_TYPE=Release/g' build-linux"$_bits".sh > build-linux"$_bits"-tfe.sh

  chmod 755 build-linux"$_bits"-tfe.sh
}

build(){
  # Building Serious Sam Nightmare Tower.
  cd "$srcdir/$_srcname/Sources/"
  ./build-linux"$_bits"-tfe.sh

  mv "$srcdir/$_srcname/Sources/cmake-build/Debug/libGame.so" "$srcdir/Mods/Tower/Bin" || return 1
  mv "$srcdir/$_srcname/Sources/cmake-build/Debug/libEntities.so"  "$srcdir/Mods/Tower/Bin" || return 1

  # Removed Serious Nightmare Tower tmp stuff.
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
  mkdir "$pkgdir/usr/share/$pkginstdir"/{SamTFE,SamTFE/Mods} || return 0

  # Install license.
  install -D -m 644 $srcdir/$_srcname/LICENSE \
       $pkgdir/usr/share/licenses/$pkgname/LICENSE
  rm -f  "$srcdir/$_srcname/LICENSE" || return 1

  # Install data.
  mv "$srcdir/Mods" "$pkgdir/usr/share/$pkginstdir/SamTFE"
}
