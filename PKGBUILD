# Maintainer:  Alexander <tx00100xt@yandex.ru>
# Contributer: Alexander <tx00100xt@yandex.ru>

pkgname=serioussam-st8vi
pkginstdir=serioussamse
st8vi=SamTSE-ST8VI.tar.xz
pkgver=1.7.1
_srcname="SE1-TSE-ST8VI-$pkgver"
pkgrel=3
pkgdesc="Serious Sam Classic ST8VI native Linux."
arch=('i686' 'x86_64')
url="https://github.com/tx00100xt/SE1-TSE-ST8VI"
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
source=("https://github.com/tx00100xt/SE1-TSE-ST8VI/archive/refs/tags/v$pkgver.tar.gz"
	"https://archive.org/download/sam-tse-st8vi/SamTSE-ST8VI.tar.xz")
noextract=("SamTSE-ST8VI.tar.xz")
sha256sums=('ac2c323276118e3a0e16ffe53e52b510a369d148fae7fd4196842680fa3f5127'
	"0a6954285f6ec430177e808fb6cf839f60163b78e23b1cca8f5a715dc7655d0d")

if [[ $CARCH = "i686" ]]; then
  _bits="32"
else
  _bits="64"
fi

prepare(){


  # Install the ST8VI Modification data.
  mkdir "$srcdir/$_srcname"/{SamTSE,SamTSE/Mods,SamTSE/Mods/ST8VI} || return 0
  tar -xJvf "$srcdir/$st8vi" -C "$srcdir/$_srcname/SamTSE/"
  chmod -R o=rx "$srcdir/$_srcname/SamTSE/Mods/ST8VI"
  chmod -R g=rx "$srcdir/$_srcname/SamTSE/Mods/ST8VI"

  # Making building scripts.
  cd "$srcdir/$_srcname/Sources/"
  sed -i 's/cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo/cmake -DCMAKE_BUILD_TYPE=Release/g' build-linux"$_bits".sh
  sed 's/cmake -DCMAKE_BUILD_TYPE=Release/cmake -DTFE=FALSE -DCMAKE_BUILD_TYPE=Release/g' build-linux"$_bits".sh > build-linux"$_bits"-tse.sh

  chmod 755 build-linux"$_bits"-tse.sh
}

build(){
  # Building Serious Sam ST8VI.
  cd "$srcdir/$_srcname/Sources/"
  ./build-linux"$_bits"-tse.sh

  mv "$srcdir/$_srcname/Sources/cmake-build/Debug/libGameMP.so" "$srcdir/$_srcname/SamTSE/Mods/ST8VI/Bin" || return 1
  mv "$srcdir/$_srcname/Sources/cmake-build/Debug/libEntitiesMP.so"  "$srcdir/$_srcname/SamTSE/Mods/ST8VI/Bin" || return 1

  # Removing Serious Sam ST8VI tmp stuff.
  cd "$srcdir/$_srcname/"
  rm -fr "Sources"
  rm -fr "Tools.Win32"

  rm -f  "$srcdir/$_srcname"/{*.sh,*.old,*.md}
  rm -fr "$srcdir/$_srcname"/{Images,x32,x64}
}

package(){
  # Making sure directories exist.
  install -d $pkgdir/usr/lib/{serioussamse,serioussamse/Mods,serioussamse/Mods/ST8VI}
  install -d $pkgdir/usr/share/{serioussamse,serioussamse/Mods}

  install -D -m0755 $srcdir/$_srcname/SamTSE/Mods/ST8VI/Bin/libGameMP.so $pkgdir/usr/lib/serioussamse/Mods/ST8VI
  install -D -m0755 $srcdir/$_srcname/SamTSE/Mods/ST8VI/Bin/libEntitiesMP.so  $pkgdir/usr/lib/serioussamse/Mods/ST8VI

  rm -fr "$srcdir/$_srcname/SamTSE/Mods/ST8VI/Bin"

  # Making sure directories exist.
  install -d $pkgdir/usr/share/licenses

  # Install license.
  install -D -m 644 $srcdir/$_srcname/LICENSE \
       $pkgdir/usr/share/licenses/$pkgname/LICENSE
  rm -f  "$srcdir/$_srcname/LICENSE" || return 1

  # Install data.
  mv "$srcdir/$_srcname/SamTSE/Mods" "$pkgdir/usr/share/$pkginstdir/"
}
