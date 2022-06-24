# Maintainer:  tx00100xt <tx00100xt@yandex.ru>
# Contributer: tx00100xt <tx00100xt@yandex.ru>

pkgname=serioussam-pese2q
pkginstdir=serioussam
pese2q=SamTSE-ParseError.tar.xz
pkgver=1.0
_srcname="SE1-ParseError-$pkgver"
pkgrel=1
pkgdesc="Serious Sam Classic Odd World native Linux."
arch=('i686' 'x86_64')
url="https://github.com/tx00100xt/SE1-TFE-OddWorld"
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
sha256sums=('37107b628ef3a0e34ce71ca95919350c145d0a23b7adfe84b0a7c02ee1bc76a5'
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
  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo ..
  make -j4

  mv "$srcdir/$_srcname/Sources/cmake-build/Debug/libGameMP.so" "$srcdir/$_srcname/SamTSE/Mods/PESE2/Bin/libGameMP.so" || return 1
  mv "$srcdir/$_srcname/Sources/cmake-build/Debug/libEntitiesMP.so"  "$srcdir/$_srcname/SamTSE/Mods/PESE2/Bin/libEntitiesMP.so" || return 1

  # Building PESE2HD Modification.
  cd "$srcdir/$_srcname/Sources/"
  cp -vfr EntitiesMP/PlayerWeaponsHD.es EntitiesMP/PlayerWeapons.es || return 1
  rm -fr cmake-build
  mkdir cmake-build
  cd cmake-build
  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo ..
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
  install -d $pkgdir/usr/share/licenses

  # Install license.
  install -D -m 644 $srcdir/$_srcname/LICENSE \
       $pkgdir/usr/share/licenses/$pkgname/LICENSE
  rm -f  "$srcdir/$_srcname/LICENSE" || return 1
  rm -f  "$srcdir/$_srcname/.gitattributes" || return 1
  rm -f  "$srcdir/$_srcname/.gitignore" || return 1

  # Install data.
  mv "$srcdir/$_srcname" "$pkgdir/usr/share/$pkginstdir"
}
