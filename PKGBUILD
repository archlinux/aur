# Maintainer:  Alexander <tx00100xt@yandex.ru>
# Contributer: Alexander <tx00100xt@yandex.ru>

pkgname=serioussam-pese2q
pkginstdir=serioussamse
pese2q=SamTSE-ParseError.tar.xz
pkgver=1.0.2
_srcname="SE1-ParseError-$pkgver"
pkgrel=1
pkgdesc="Serious Sam Classic Odd World native Linux."
arch=('i686' 'x86_64')
url="https://github.com/tx00100xt/SE1-ParseError"
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
source=("https://github.com/tx00100xt/SE1-ParseError/archive/refs/tags/v$pkgver.tar.gz"
	"https://github.com/tx00100xt/serioussam-mods/raw/main/SamTSE-ParseError/SamTSE-ParseError.tar.xz")
noextract=("SamTSE-ParseError.tar.xz")
sha256sums=('5447721e9c74c17987d600d4e47e42d5e54b9a9343dac1a034960968e6216bff'
	"318a544b6239c776edcf26740f89635ce2dd54b573671609c99c768f4d8ce0f0")

if [[ $CARCH = "i686" ]]; then
  _bits="32"
else
  _bits="64"
fi

prepare(){
  # Install the PESE2Q Modification data.
  mkdir "$srcdir/$_srcname"/{SamTSE,SamTSE/Mods,SamTSE/Mods/PESE2,SamTSE/Mods/PESE2HD} || return 0
  tar -xJvf "$srcdir/$pese2q" -C "$srcdir/$_srcname/SamTSE/"
  rm -f "$srcdir/$_srcname/SamTSE/Mods/PESE2/Bin/libGameMP.so" || return 0
  rm -f "$srcdir/$_srcname/SamTSE/Mods/PESE2/Bin/libEntitiesMP.so" || return 0
  rm -f "$srcdir/$_srcname/SamTSE/Mods/PESE2HD/Bin/libGameMP.so" || return 0
  rm -f "$srcdir/$_srcname/SamTSE/Mods/PESE2HD/Bin/libEntitiesMP.so" || return 0
  chmod -R o=rx "$srcdir/$_srcname/SamTSE/Mods/PESE2"
  chmod -R g=rx "$srcdir/$_srcname/SamTSE/Mods/PESE2"
  chmod -R o=rx "$srcdir/$_srcname/SamTSE/Mods/PESE2HD"
  chmod -R g=rx "$srcdir/$_srcname/SamTSE/Mods/PESE2HD"
}

build(){
  # Building PESE2 Modification.
  cd "$srcdir/$_srcname/Sources/"
  cp -vfr EntitiesMP/PlayerWeapons_old.es EntitiesMP/PlayerWeapons.es || return 1
  rm -fr cmake-build
  mkdir cmake-build
  cd cmake-build
  cmake -DCMAKE_BUILD_TYPE=Release ..
  make -j4

  mv "$srcdir/$_srcname/Sources/cmake-build/Debug/libGameMP.so" "$srcdir/$_srcname/SamTSE/Mods/PESE2/Bin/libGameMP.so" || return 1
  mv "$srcdir/$_srcname/Sources/cmake-build/Debug/libEntitiesMP.so"  "$srcdir/$_srcname/SamTSE/Mods/PESE2/Bin/libEntitiesMP.so" || return 1

  # Building PESE2HD Modification.
  cd "$srcdir/$_srcname/Sources/"
  cp -vfr EntitiesMP/PlayerWeaponsHD.es EntitiesMP/PlayerWeapons.es || return 1
  rm -fr cmake-build
  mkdir cmake-build
  cd cmake-build
  cmake -DCMAKE_BUILD_TYPE=Release ..
  make -j4

  mv "$srcdir/$_srcname/Sources/cmake-build/Debug/libGameMP.so" "$srcdir/$_srcname/SamTSE/Mods/PESE2HD/Bin/libGameMP.so" || return 1
  mv "$srcdir/$_srcname/Sources/cmake-build/Debug/libEntitiesMP.so"  "$srcdir/$_srcname/SamTSE/Mods/PESE2HD/Bin/libEntitiesMP.so" || return 1

  # Removing Serious Sam PESE2Q tmp stuff.
  cd "$srcdir/$_srcname/"
  rm -fr "Sources"
  rm -fr "Tools.Win32"

  rm -f  "$srcdir/$_srcname"/{*.sh,*.old,*.md}
  rm -fr "$srcdir/$_srcname"/{Images,x32,x64}
}

package(){
  # Making sure directories exist.
  install -d $pkgdir/usr/lib/{serioussamse,serioussamse/Mods,serioussamse/Mods/PESE2,serioussamse/Mods/PESE2HD}
  install -d $pkgdir/usr/share/{serioussamse,serioussamse/Mods}

  install -D -m0755 $srcdir/$_srcname/SamTSE/Mods/PESE2/Bin/libGameMP.so $pkgdir/usr/lib/serioussamse/Mods/PESE2
  install -D -m0755 $srcdir/$_srcname/SamTSE/Mods/PESE2/Bin/libEntitiesMP.so  $pkgdir/usr/lib/serioussamse/Mods/PESE2
  install -D -m0755 $srcdir/$_srcname/SamTSE/Mods/PESE2HD/Bin/libGameMP.so $pkgdir/usr/lib/serioussamse/Mods/PESE2HD
  install -D -m0755 $srcdir/$_srcname/SamTSE/Mods/PESE2HD/Bin/libEntitiesMP.so  $pkgdir/usr/lib/serioussamse/Mods/PESE2HD

  rm -fr "$srcdir/$_srcname/SamTSE/Mods/PESE2/Bin"
  rm -fr "$srcdir/$_srcname/SamTSE/Mods/PESE2HD/Bin"

  # Making sure directories exist.
  install -d $pkgdir/usr/share/licenses

  # Install license.
  install -D -m 644 $srcdir/$_srcname/LICENSE \
       $pkgdir/usr/share/licenses/$pkgname/LICENSE
  rm -f  "$srcdir/$_srcname/LICENSE" || return 1

  # Install data.
  mv "$srcdir/$_srcname/SamTSE/Mods" "$pkgdir/usr/share/$pkginstdir/"
}
