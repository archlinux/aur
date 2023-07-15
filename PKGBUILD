# Maintainer:  Alexander <tx00100xt@yandex.ru>
# Contributer: Alexander <tx00100xt@yandex.ru>

pkgname=serioussam-st8vipe
pkginstdir=serioussamse
st8vipe=SamTSE-ST8VIPE.tar.xz
pkgver=1.7.1
_srcname="SE1-TSE-ST8VIPE-$pkgver"
pkgrel=3
pkgdesc="Serious Sam Classic ST8VIPE native Linux."
arch=('i686' 'x86_64')
url="https://github.com/tx00100xt/SE1-TSE-ST8VIPE"
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
source=("https://github.com/tx00100xt/SE1-TSE-ST8VIPE/archive/refs/tags/v$pkgver.tar.gz"
	"https://archive.org/download/sam-tse-st8vipe/SamTSE-ST8VIPE.tar.xz")
noextract=("SamTSE-ST8VIPE.tar.xz")
sha256sums=('95c5063205cf5041639fd434467b0c006e00c67e67ec6b725d87ee7114069c68'
	"f427c69dda757dab6aab0301c15f51c04da1513bf5faffc73618c9dd0bbcba24")

if [[ $CARCH = "i686" ]]; then
  _bits="32"
else
  _bits="64"
fi

prepare(){


  # Install the ST8VIPE Modification data.
  mkdir "$srcdir/$_srcname"/{SamTSE,SamTSE/Mods,SamTSE/Mods/ST8VIPE} || return 0
  tar -xJvf "$srcdir/$st8vipe" -C "$srcdir/$_srcname/SamTSE/"
  chmod -R o=rx "$srcdir/$_srcname/SamTSE/Mods/ST8VIPE"
  chmod -R g=rx "$srcdir/$_srcname/SamTSE/Mods/ST8VIPE"

  # Making building scripts.
  cd "$srcdir/$_srcname/Sources/"
  sed -i 's/cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo/cmake -DCMAKE_BUILD_TYPE=Release/g' build-linux"$_bits".sh
  sed 's/cmake -DCMAKE_BUILD_TYPE=Release/cmake -DTFE=FALSE -DCMAKE_BUILD_TYPE=Release/g' build-linux"$_bits".sh > build-linux"$_bits"-tse.sh

  chmod 755 build-linux"$_bits"-tse.sh
}

build(){
  # Building Serious Sam ST8VIPE.
  cd "$srcdir/$_srcname/Sources/"
  ./build-linux"$_bits"-tse.sh

  mv "$srcdir/$_srcname/Sources/cmake-build/Debug/libGameMP.so" "$srcdir/$_srcname/SamTSE/Mods/ST8VIPE/Bin" || return 1
  mv "$srcdir/$_srcname/Sources/cmake-build/Debug/libEntitiesMP.so"  "$srcdir/$_srcname/SamTSE/Mods/ST8VIPE/Bin" || return 1

  # Removing Serious Sam ST8VIPE tmp stuff.
  cd "$srcdir/$_srcname/"
  rm -fr "Sources"
  rm -fr "Tools.Win32"

  rm -f  "$srcdir/$_srcname"/{*.sh,*.old,*.md}
  rm -fr "$srcdir/$_srcname"/{Images,x32,x64}
}

package(){
  # Making sure directories exist.
  install -d $pkgdir/usr/lib/{serioussamse,serioussamse/Mods,serioussamse/Mods/ST8VIPE}
  install -d $pkgdir/usr/share/{serioussamse,serioussamse/Mods}

  install -D -m0755 $srcdir/$_srcname/SamTSE/Mods/ST8VIPE/Bin/libGameMP.so $pkgdir/usr/lib/serioussamse/Mods/ST8VIPE
  install -D -m0755 $srcdir/$_srcname/SamTSE/Mods/ST8VIPE/Bin/libEntitiesMP.so  $pkgdir/usr/lib/serioussamse/Mods/ST8VIPE

  rm -fr "$srcdir/$_srcname/SamTSE/Mods/ST8VIPE/Bin"

  # Making sure directories exist.
  install -d $pkgdir/usr/share/licenses

  # Install license.
  install -D -m 644 $srcdir/$_srcname/LICENSE \
       $pkgdir/usr/share/licenses/$pkgname/LICENSE
  rm -f  "$srcdir/$_srcname/LICENSE" || return 1

  # Install data.
  mv "$srcdir/$_srcname/SamTSE/Mods" "$pkgdir/usr/share/$pkginstdir/"
}
